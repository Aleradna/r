using System.Diagnostics;
using System.Data.SQLite;
using System.Text.RegularExpressions;
using System.ComponentModel;
using System.Data;
using System.Reflection.Metadata;
using System.Drawing;

namespace SapiensTranslator
{
    internal class Traitements
    {

        static string appDataAppliPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "TranslatorLua");
        static string filePathInL = Path.Combine(appDataAppliPath, "data\\sources\\localizations.lua");
        static string filePathOutL = Path.Combine(appDataAppliPath, "data\\output\\localizations.lua");
        static string filePathInK = Path.Combine(appDataAppliPath, "data\\sources\\keyboardNames.lua");
        static string filePathOutK = Path.Combine(appDataAppliPath, "data\\output\\keyboardNames.lua");

        static string PathBDD = Path.Combine(appDataAppliPath, "data\\sqlites\\bdd.sqlite"); // Emplacement de la Base de donnée

        const string pattern1 = "(\\w+[_]\\w+)\\s+=\\s\"([\\s\\S]*?)\",";  // Pattern pour récupérer les constantes (group1) et leurs variables (group2)
        const string pattern2 = "(\\w+)\\s+=\\s(fu[\\s\\S]*?end),"; // Pattern pour récupérer les constantes (group1) et les variables de type function (group2)
        const string pattern3 = "(f.*\\.(get[\\s\\S]*?)\\([\\s\\S]*?return .*[\\n\\r]+end)"; // Pattern pour récupérer les constantes (group2) et les variables de type "function localizations.get" (group2) 
        const string pattern4 = "(local f.*(get[\\s\\S]*?)\\([\\s\\S]*?return .*[\\n\\r]+end)";
        private static string SQLStringConnect = $"DATA Source={PathBDD};Version=3;"; // Séquence d'accès SQL Read Write
        private static string SQLStringConnectRo = $"DATA Source={PathBDD};Version=3;Read Only=true;"; // Séquence d'accès SQL Read Only
        private object? _SenderWorker = null;  // Gérer l'aspect du loader
        private int calcProgress(double _fullProgress, double _runProgress)
        {
            try
            {
                return (int)(((double)_runProgress / (double)_fullProgress) * 100);
            }
            catch (Exception)
            {
                throw;
            }
        }

        /*
         * Créé le fichier bdd.sql ainsi que le schéma de la BDD
         */
        public void CreateBDD()
        {
            try
            {

                SQLiteConnection.CreateFile(PathBDD);

                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();

                    string sql = @"CREATE TABLE IF NOT EXISTS tableLocalizations (
                    ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    Constant TEXT NOT NULL UNIQUE,
                    TextOrigin TEXT NOT NULL,
                    TextTransl TEXT NOT NULL DEFAULT '',
                    TypeSource  TEXT NOT NULL DEFAULT '',
                    Checked INT(2) DEFAULT 0
                ); 
                CREATE TABLE IF NOT EXISTS tableFunctions(
                    ID INTEGER PRIMARY KEY AUTOINCREMENT,
                    Constant TEXT NOT NULL UNIQUE,
                    FunctOrigin TEXT NOT NULL,
                    FunctTransl TEXT NOT NULL DEFAULT '',
                    Checked INT(2) DEFAULT 0
                );";

                    using (SQLiteCommand cmd = new SQLiteCommand(sql, con))
                    {
                        cmd.CommandTimeout = 2;
                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
            }
            catch (Exception)
            {
                throw;
            }

        }

        // Vérifie si la bdd existe et à des données.
        public bool CheckBdd()
        {

            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    string sql = $"SELECT count(*) FROM tableLocalizations";
                    using (SQLiteCommand cmd = new SQLiteCommand(sql, con))
                    {
                        cmd.CommandTimeout = 2;
                        int count = Convert.ToInt32(cmd.ExecuteScalar());
                        con.Close();
                        return count > 0;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }



        //Méthode qui gère l'import des fichiers localizations et keyboardNames passés par le Main au loader
        public void ImportFileOriginal(string _sourcePath, object _sender)
        {
            //Méthode qui gère l'import des fichiers localizations et keyboardNames passés par le Main au loader
            try
            {
                _SenderWorker = _sender;
                if (File.Exists(_sourcePath))
                {
                    // On garde une copie du fichier original afin de l'exploiter comme modèle.

                    string destinationFolderPath = Path.Combine(appDataAppliPath, "data\\sources");
                    string fileName = Path.GetFileName(_sourcePath);
                    string destinationFilePath = Path.Combine(destinationFolderPath, fileName);
                    File.Delete(destinationFilePath);
                    File.Copy(_sourcePath, destinationFilePath);

                    switch (fileName)
                    {
                        case "keyboardNames.lua":
                            InsertConstant2SQL(_sourcePath, "Keyboard");
                            break;
                        case "localizations.lua":
                            InsertConstant2SQL(_sourcePath, "Localizations");
                            InsertFunction2SQL(_sourcePath);
                            break;
                        default:
                            throw new ArgumentException("Only localizations.lua and keyboardNames.lua files are processed by this program");
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Méthode qui gère l'import des fichiers localizations et keyboardNames déjà traduits passés par le Main au loader
        public void ImportFileTranslate(string _sourcePath, object _sender)
        {
            //Méthode qui gère l'import des fichiers localizations et keyboardNames déjà traduits passés par le Main au loader
            try
            {
                _SenderWorker = _sender;
                if (File.Exists(_sourcePath))
                {

                    string fileName = Path.GetFileName(_sourcePath);

                    switch (fileName)
                    {
                        case "keyboardNames.lua":
                            UpdateConstant2SQL(_sourcePath);
                            break;
                        case "localizations.lua":
                            UpdateConstant2SQL(_sourcePath);
                            UpdateFunction2SQL(_sourcePath);
                            break;
                        default:
                            throw new ArgumentException("Only localizations.lua and keyboardNames.lua files are processed by this program");
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }


        #region  Gestion de l'insertion, des updates et des select pour les Textes

        //Insert en BDD les textes originaux des constantes (group1) et leurs variables (group2) issues du fichier source ex: tutorial_cookingMeat_butcher = "Butcher a carcass" 
        private void InsertConstant2SQL(string _SourceFile, string _TypeSource)
        {
            //Insert en BDD les textes originaux des constantes (group1) et leurs variables (group2) issues du fichier source ex: tutorial_cookingMeat_butcher = "Butcher a carcass"
            try
            {
                string text = File.ReadAllText(_SourceFile);
                MatchCollection matches = Regex.Matches(text, pattern1);
                if (_SenderWorker != null)
                {
                    ((BackgroundWorker)_SenderWorker).ReportProgress(0);
                    int fullProgress = matches.Count - 1;
                    int runProgress = 0;

                    using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                    {
                        con.Open();
                        using (SQLiteTransaction transaction = con.BeginTransaction())
                        {
                            using (SQLiteCommand cmd = con.CreateCommand())
                            {
                                cmd.CommandText = "INSERT OR IGNORE INTO tableLocalizations(Constant,TextOrigin,TypeSource) VALUES (@Constant, @TextOrigin, @TypeSource)";
                                cmd.Parameters.Add("@Constant", DbType.String);
                                cmd.Parameters.Add("@TextOrigin", DbType.String);
                                cmd.Parameters.Add("@TypeSource", DbType.String);

                                foreach (Match match in matches)
                                {
                                    string Constant = match.Groups[1].Value;
                                    string TextOrigin = match.Groups[2].Value;

                                    int progressValue = calcProgress(fullProgress, runProgress);
                                    ((BackgroundWorker)_SenderWorker).ReportProgress(progressValue);
                                    runProgress++;
                                    cmd.Parameters["@Constant"].Value = Constant;
                                    cmd.Parameters["@TextOrigin"].Value = TextOrigin;
                                    cmd.Parameters["@TypeSource"].Value = _TypeSource;
                                    cmd.ExecuteNonQuery();
                                    int rowsAffected = cmd.ExecuteNonQuery();
                                    if (rowsAffected == 0)
                                    {
                                        if (!CompareTextOrigin(Constant, TextOrigin))
                                        {
                                            UpdateLocalizationsOrigin(con, Constant, TextOrigin);
                                        }

                                    }

                                }
                            }

                            transaction.Commit();
                        }

                        con.Close();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Insert en BDD les textes traduits des constantes (group1) et leurs variables (group2) issues du fichier source ex: tutorial_cookingMeat_butcher = "Dépecez une Carcasse" 
        private void UpdateConstant2SQL(string sourceFile)
        {
            //Insert en BDD les textes traduits des constantes (group1) et leurs variables (group2) issues du fichier source ex: tutorial_cookingMeat_butcher = "Dépecez une Carcasse" 
            try
            {
                string text = File.ReadAllText(sourceFile);
                MatchCollection matches = Regex.Matches(text, pattern1);
                if (_SenderWorker != null)
                {
                    ((BackgroundWorker)_SenderWorker).ReportProgress(0);

                    int fullProgress = matches.Count - 1;
                    int runProgress = 0;

                    using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                    {
                        con.Open();
                        using (SQLiteCommand cmd = con.CreateCommand())
                        {
                            cmd.CommandText = "Update tableLocalizations SET TextTransl = @TextTransl  WHERE Constant = @Constant";
                            cmd.Parameters.Add("@TextTransl", DbType.String);
                            cmd.Parameters.Add("@Constant", DbType.String);
                            cmd.CommandTimeout = 2;

                            foreach (Match match in matches)
                            {
                                string constant = match.Groups[1].Value;
                                string textTranslate = match.Groups[2].Value;
                                
                                int progressValue = calcProgress(fullProgress, runProgress);
                                ((BackgroundWorker)_SenderWorker).ReportProgress(progressValue);
                                runProgress++;

                                if (!CompareTextTranslate(constant, textTranslate))
                                {
                                    cmd.Parameters["@Constant"].Value = constant;
                                    cmd.Parameters["@TextTransl"].Value = textTranslate;
                                    int rowsAffected = cmd.ExecuteNonQuery();
                                    if (rowsAffected == 0)
                                    {
                                        throw new ArgumentException($"Failed to update!");

                                    }
                                }
                            }
                        }
                        con.Close();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Compare via la BDD si les textes originaux des constantes issue du fichier sont identiques à ceux en base. retourne true si le texte est présent et identique
        private bool CompareTextOrigin(string constant, string text)
        {
            //Compare via la BDD si les textes originaux des constantes issue du fichier sont identiques à ceux en base. retourne true si le texte est présent et identique
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT TextOrigin FROM tableLocalizations WHERE Constant = @Constant";
                        cmd.Parameters.AddWithValue("@Constant", constant);
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string textOriginBdd = reader.GetString(0);
                                reader.Close();

                                return (textOriginBdd != null) && textOriginBdd.Equals(text);
                            }
                        }
                    }
                }
                return false;
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Compare via la BDD si les textes traduits des constantes issue du fichier sont identiques à ceux en base. retourne true si le texte est présent et identique
        private static bool CompareTextTranslate(string constant, string text)
        {
            //Compare via la BDD si les textes traduits des constantes issue du fichier sont identiques à ceux en base. retourne true si le texte est présent et identique
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT TextOrigin, TextTransl FROM tableLocalizations WHERE Constant = @Constant";
                        cmd.Parameters.AddWithValue("@Constant", constant);
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string? textOriginBdd = reader.IsDBNull(0) ? null : reader.GetString(0);
                                string? textTranslateBdd = reader.IsDBNull(1) ? null : reader.GetString(1);
                                reader.Close();

                                return (textOriginBdd != null && textOriginBdd.Equals(text)) ||
                                       (textTranslateBdd != null && textTranslateBdd.Equals(text));
                            }
                            else
                            {
                                throw new ArgumentException($"An error is present in the file for the constant: {constant}\n\r Correct your file before starting again!");
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }


        }

        //Met à jour la table tableLocalizations si les textes originaux présent en BDD sont différent de ceux issue du fichier. cette méthode supprime également supprime l'ancienne traduction et remet le checked à 0
        private static void UpdateLocalizationsOrigin(SQLiteConnection con, string constant, string text)
        {
            //Met à jour la table tableLocalizations si les textes originaux présent en BDD sont différent de ceux issue du fichier
            try
            {

                using (SQLiteCommand cmd = new SQLiteCommand(con))
                {
                    cmd.CommandText = "UPDATE tableLocalizations SET TextOrigin = @Text, TextTransl = '', Checked = 0 WHERE Constant = @Constant";
                    cmd.Parameters.AddWithValue("@Constant", constant);
                    cmd.Parameters.AddWithValue("@Text", text);
                    cmd.CommandTimeout = 2;
                    int rowsAffected = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Fourni les informations issue de tableLocalizations a destination de l'editeur
        public DataLocalizations GetData(int idConstant)
        {
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT TextOrigin, TextTransl, TypeSource, Checked FROM tableLocalizations WHERE ID = @idConstant";
                        DataLocalizations retour = new DataLocalizations();
                        cmd.Parameters.AddWithValue("@idConstant", idConstant);
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                retour.ID = idConstant;
                                retour.TextOrigin = reader.GetString(0);
                                retour.TextTransl = reader.GetString(1);
                                retour.TypeSource = reader.GetString(2);
                                retour.Checked = reader.GetInt32(3);
                            }
                            reader.Close();
                        }
                        con.Close();
                        return retour;
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Retourne true si le _TextOrigin est présent plusieurs fois en BDD
        public bool GetOccurrenceLocalOrigin(string _TextOrigin)
        {
            //Retourne true si le _TextOrigin est présent plusieurs fois en BDD
            using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
            using (SQLiteCommand cmd = con.CreateCommand())
            {
                con.Open();
                cmd.CommandText = "SELECT COUNT(*) FROM tableLocalizations WHERE TextOrigin = @TextOrigin";
                cmd.Parameters.AddWithValue("@TextOrigin", _TextOrigin);
                cmd.CommandTimeout = 2;
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 1;
            }
        }

        //Fourni une liste de toutes les ID ainsi que les noms des constantes issue de tableLocalizations a destination de la liste déroulante de l'éditeur
        public List<CheckBoxOption> GetListLocalizationsID()
        {
            //Fourni une liste de toutes les ID ainsi que les noms des constantes issue de tableLocalizations a destination de la liste déroulante de l'éditeur
            try
            {
                using (var con = new SQLiteConnection(SQLStringConnectRo))
                using (var cmd = new SQLiteCommand(con))
                {
                    cmd.CommandTimeout = 2;
                    cmd.CommandText = "SELECT ID, Constant FROM tableLocalizations ORDER BY ID ASC";

                    var options = new List<CheckBoxOption>();

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            options.Add(new CheckBoxOption
                            {
                                ID = reader.GetInt32(0),
                                Constant = reader.GetString(1)
                            });
                        }
                    }

                    return options;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Fourni une liste de toutes les ID en fonction d'un terme ainsi que les noms des constantes issue de tableLocalizations a destination de la liste déroulante de l'éditeur
        public List<CheckBoxOption> GetListLocalizationIDByTerms(string _searchTerms)
        {
            //Fourni une liste de toutes les ID en fonction d'un terme ainsi que les noms des constantes issue de tableLocalizations a destination de la liste déroulante de l'éditeur
            using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
            {

                using (SQLiteCommand cmd = con.CreateCommand())
                {
                    con.Open();
                    cmd.CommandText = "SELECT ID, Constant FROM tableLocalizations WHERE TextOrigin LIKE @searchTerms OR TextTransl LIKE @searchTerms OR Constant LIKE @searchTerms ORDER BY ID ASC";
                    cmd.Parameters.AddWithValue("@searchTerms", "%" + _searchTerms + "%");
                    cmd.CommandTimeout = 2;

                    List<CheckBoxOption> options = new List<CheckBoxOption>();
                    using (SQLiteDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            options.Add(new CheckBoxOption
                            {
                                ID = reader.GetInt32(0),
                                Constant = reader.GetString(1)
                            });
                        }
                    }

                    return options;
                }
            }
        }

        //Fourni l'ID de la prochaine constante dont la traduction est vide 
        public int NextLocalizationsTranslEmpty(int _ValueID)
        {
            //Fourni l'ID de la prochaine constante dont la traduction est vide 
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT ID FROM tableLocalizations WHERE TextTransl = '' AND ID > @ValueID LIMIT 1";
                        cmd.Parameters.AddWithValue("@ValueID", _ValueID);
                        cmd.CommandTimeout = 2;

                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            return Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

            return 0;
        }

        //Fourni l'ID de la prochaine constante qui n'a pas été controlé
        public int NextLocalizationsNoChecked(int _ValueID)
        {
            //Fourni l'ID de la prochaine constante qui n'a pas été controlé
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT ID FROM tableLocalizations WHERE Checked = 0 AND ID > @ValueID LIMIT 1";
                        cmd.Parameters.AddWithValue("@ValueID", _ValueID);
                        cmd.CommandTimeout = 2;

                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            return Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

            return 0;
        }

        //Sauvegarde les informations soumisent par l'éditeur.
        public void SaveDataLocalizations(string newTranslate, string IDTarget, string constant, string textOrigin, int checkedValue = 0, int checkedAllReferences = 0)
        {
            //Sauvegarde les informations soumisent par l'éditeur.
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();

                    bool shouldUpdate = !CompareTextTranslate(constant, newTranslate) || (checkedValue == 1);
                    if (shouldUpdate)
                    {
                        int ID = int.Parse(IDTarget);
                        string sql;
                        SQLiteCommand cmd;
                        if (checkedAllReferences == 1)
                        {
                            sql = "UPDATE TableLocalizations SET TextTransl = @newTranslate, Checked = @Checked WHERE TextOrigin = @TextOrigin";
                            cmd = new SQLiteCommand(sql, con);
                            cmd.Parameters.AddWithValue("@TextOrigin", textOrigin);
                        }
                        else
                        {
                            sql = "UPDATE TableLocalizations SET TextTransl = @newTranslate, Checked = @Checked WHERE ID = @ID";
                            cmd = new SQLiteCommand(sql, con);
                            cmd.Parameters.AddWithValue("@ID", ID);
                        }

                        cmd.Parameters.AddWithValue("@newTranslate", newTranslate);
                        cmd.Parameters.AddWithValue("@Checked", checkedValue);
                        cmd.CommandTimeout = 2;

                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected == 0)
                        {
                            throw new ArgumentException($"Failed to save!");

                        }
                        con.Close();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        #region  Gestion de l'insertion, des updates et des select pour les Fonctions
        //Il existe 3 types de function dans SAPIENS 

        //Segmente les functions originales (group1) et leurs variables (group2) issues du fichier source
        private void InsertFunction2SQL(string sourceFile)
        {
            //Segmente les functions originales (group1) et leurs variables (group2) issues du fichier source
            try
            {
                string fileContent = File.ReadAllText(sourceFile);
                MatchCollection matches2 = Regex.Matches(fileContent, pattern2);
                MatchCollection matches3 = Regex.Matches(fileContent, pattern3);
                MatchCollection matches4 = Regex.Matches(fileContent, pattern4);

                int fullProgress = matches2.Count + matches3.Count + matches4.Count - 1;
                int runProgress = 0;

                using (SQLiteConnection connection = new SQLiteConnection(SQLStringConnect))
                {
                    connection.Open();

                    using (SQLiteCommand cmd = connection.CreateCommand())
                    {
                        cmd.CommandText = "INSERT OR IGNORE INTO tableFunctions(Constant,FunctOrigin) VALUES (@Constant, @FunctOrigin)";
                        cmd.Parameters.Add("@Constant", DbType.String);
                        cmd.Parameters.Add("@FunctOrigin", DbType.String);
                        cmd.CommandTimeout = 2;

                        InsertFunctions(matches2, cmd, ref runProgress, fullProgress);
                        InsertFunctions(matches3, cmd, ref runProgress, fullProgress, true);
                        InsertFunctions(matches4, cmd, ref runProgress, fullProgress, true);
                    }
                    connection.Close();
                }

            }
            catch (Exception)
            {
                throw;
            }
        }

        // Insert les functions en BDD et vérifie qu'elles n'ont pas été modifiés depuis le dernier Insert
        private void InsertFunctions(MatchCollection matches, SQLiteCommand command, ref int runProgress, int fullProgress, bool sens = false)
        {
            // Insert les functions en BDD et vérifie qu'elles n'ont pas été modifiés depuis le dernier Insert
            if (_SenderWorker != null)
            {
                foreach (Match match in matches)
                {
                    string constant = match.Groups[1].Value;
                    string functOrigin = match.Groups[2].Value;

                    if (sens)
                    {
                        constant = match.Groups[2].Value;
                        functOrigin = match.Groups[1].Value;
                    }

                    int progressValue = calcProgress(fullProgress, runProgress);
                    ((BackgroundWorker)_SenderWorker).ReportProgress(progressValue);
                    runProgress++;

                    command.Parameters["@Constant"].Value = constant;
                    command.Parameters["@FunctOrigin"].Value = functOrigin;
                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected == 0)
                    {
                        if (!CompareFunctOrigin(constant, functOrigin))
                        {
                            // Le texte en BDD est différent de celui du fichier
                            using (SQLiteConnection updateConnection = new SQLiteConnection(SQLStringConnect))
                            {
                                updateConnection.Open();
                                UpdateFunctOrigin(updateConnection, constant, functOrigin);
                                updateConnection.Close();
                            }
                        }
                    }
                }
            }
        }

        // Segmente les différents type de functions issue du fichier source avant l'injection des traductions en BDD
        private void UpdateFunction2SQL(string sourceFile)
        {
            // Segmente les différents type de functions issue du fichier source avant l'injection des traductions en BDD
            try
            {
                string text = File.ReadAllText(sourceFile);
                MatchCollection matches2 = Regex.Matches(text, pattern2);
                MatchCollection matches3 = Regex.Matches(text, pattern3);
                MatchCollection matches4 = Regex.Matches(text, pattern4);

                int fullProgress = matches2.Count + matches3.Count + matches4.Count - 1;
                int runProgress = 0;

                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "Update tableFunctions SET FunctTransl = @FunctTransl WHERE Constant = @Constant";
                        cmd.Parameters.Add("@FunctTransl", DbType.String);
                        cmd.Parameters.Add("@Constant", DbType.String);
                        cmd.CommandTimeout = 2;

                        UpdateFunctions(matches2, cmd, ref runProgress, fullProgress);
                        UpdateFunctions(matches3, cmd, ref runProgress, fullProgress, true);
                        UpdateFunctions(matches4, cmd, ref runProgress, fullProgress, true);
                    }
                    con.Close();
                }

            }
            catch (Exception)
            {
                throw;
            }
        }

        // Insert les traductions des functions en BDD
        private void UpdateFunctions(MatchCollection matches, SQLiteCommand cmd, ref int runProgress, int fullProgress, bool sens = false)
        {
            // Insert les traductions des functions en BDD
            if (_SenderWorker != null)
            {
                foreach (Match match in matches)
                {
                    string constant = match.Groups[1].Value;
                    string functTransl = match.Groups[2].Value;
                    if (sens)
                    {
                        constant = match.Groups[2].Value;
                        functTransl = match.Groups[1].Value;
                    }

                    int progressValue = calcProgress(fullProgress, runProgress);
                    ((BackgroundWorker)_SenderWorker).ReportProgress(progressValue);
                    runProgress++;

                    if (!CompareFunctTranslate(constant, functTransl))
                    {
                        cmd.Parameters["@Constant"].Value = constant;
                        cmd.Parameters["@FunctTransl"].Value = functTransl;
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }

        //Met à jour la table tableFunctions si les functions originales présentes en BDD sont différentes de celles issue du fichier. cette méthode supprime également l'ancienne traduction et remet le checked à 0
        private static void UpdateFunctOrigin(SQLiteConnection con, string constant, string functOrigin)
        {
            //Met à jour la table tableFunctions si les functions originales présentes en BDD sont différentes de celles issue du fichier. cette méthode supprime également l'ancienne traduction et remet le checked à 0
            try
            {
                using (SQLiteCommand cmd = new SQLiteCommand(con))
                {
                    cmd.CommandText = "UPDATE tableFunctions SET FunctOrigin = @FunctOrigin, FunctTransl = '', Checked = 0 WHERE Constant = @Constant";
                    cmd.Parameters.AddWithValue("@Constant", constant);
                    cmd.Parameters.AddWithValue("@FunctOrigin", functOrigin);
                    cmd.CommandTimeout = 2;
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        throw new ArgumentException($"Failed to update!");

                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Compare via la BDD si les functions originales issue du fichier sont identiques à celles en base. retourne true si la function est présente et identique
        private static bool CompareFunctOrigin(string constant, string functOrigin)
        {
            //Compare via la BDD si les functions originales issue du fichier sont identiques à celles en base. retourne true si la function est présente et identique
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT FunctOrigin FROM tableFunctions WHERE Constant = @Constant";
                        cmd.Parameters.AddWithValue("@Constant", constant);
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string functOriginBdd = reader.GetString(0);
                                reader.Close();

                                return (functOriginBdd != null) && functOriginBdd.Equals(functOrigin);
                            }
                        }
                    }
                }
                return false;
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Compare via la BDD si les functions traduites issue du fichier sont identiques à celles en base. retourne true si la function est présente et identique
        private static bool CompareFunctTranslate(string constant, string text)
        {
            //Compare via la BDD si les functions traduites issue du fichier sont identiques à celles en base. retourne true si la function est présente et identique
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT FunctOrigin, FunctTransl FROM tableFunctions WHERE Constant = @Constant";
                        cmd.Parameters.AddWithValue("@Constant", constant);
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string? functOriginBdd = reader.IsDBNull(0) ? null : reader.GetString(0);
                                string? functTranslateBdd = reader.IsDBNull(1) ? null : reader.GetString(1);
                                reader.Close();

                                return (functOriginBdd != null && functOriginBdd.Equals(text)) ||
                                       (functTranslateBdd != null && functTranslateBdd.Equals(text));
                            }
                            else
                            {
                                throw new ArgumentException($"An error is present in the file for the constant: {constant}\n\r Correct your file before starting again!");
                            }
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public DataFunctions GetFunctData(int _idConstant)
        {
            using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
            {
                con.Open();
                using (SQLiteCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = "SELECT FunctOrigin, FunctTransl, Checked FROM tableFunctions WHERE ID = @idConstant";
                    cmd.Parameters.AddWithValue("@idConstant", _idConstant);
                    cmd.CommandTimeout = 2;

                    using (SQLiteDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            DataFunctions retour = new DataFunctions()
                            {
                                ID = _idConstant,
                                FunctOrigin = reader.GetString(0),
                                FunctTransl = reader.GetString(1),
                                Checked = reader.GetInt32(2)
                            };

                            return retour;
                        }
                    }
                }
            }

            throw new Exception("Data not found."); // Throw an exception if no data is found
        }

        //Fourni une liste de toutes les ID ainsi que les noms des constantes issue de tableFunctions a destination de la liste déroulante de l'éditeur
        public List<CheckBoxOption> GetListFunctionsID()
        {
            //Fourni une liste de toutes les ID ainsi que les noms des constantes issue de tableFunctions a destination de la liste déroulante de l'éditeur
            try
            {
                using (var con = new SQLiteConnection(SQLStringConnectRo))
                using (var cmd = new SQLiteCommand(con))
                {
                    cmd.CommandTimeout = 2;
                    cmd.CommandText = "SELECT ID, Constant FROM tableFunctions t ORDER By ID ASC";

                    var options = new List<CheckBoxOption>();

                    con.Open();

                    using (var reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            options.Add(new CheckBoxOption
                            {
                                ID = reader.GetInt32(0),
                                Constant = reader.GetString(1)
                            });
                        }
                    }

                    return options;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Fourni une liste de toutes les ID en fonction d'un terme ainsi que les noms des constantes issue de tableFunctions a destination de la liste déroulante de l'éditeur
        public List<CheckBoxOption> GetListFunctionIDByTerms(string _searchTerms)
        {
            //Fourni une liste de toutes les ID en fonction d'un terme ainsi que les noms des constantes issue de tableFunctions a destination de la liste déroulante de l'éditeur
            using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
            {
                using (SQLiteCommand cmd = con.CreateCommand())
                {
                    con.Open();
                    cmd.CommandText = $"SELECT ID, Constant FROM tableFunctions WHERE FunctOrigin LIKE @searchTerms or FunctTransl LIKE @searchTerms or Constant LIKE @searchTerms ORDER By ID ASC";
                    cmd.Parameters.AddWithValue("@searchTerms", "%" + _searchTerms + "%");
                    cmd.CommandTimeout = 2;
                    List<CheckBoxOption> options = new List<CheckBoxOption>();

                    using (SQLiteDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            options.Add(new CheckBoxOption
                            {
                                ID = reader.GetInt32(0),
                                Constant = reader.GetString(1)
                            });
                        }
                    }

                    return options;
                }
            }
        }

        //Fourni l'ID de la prochaine function dont la traduction est vide 
        public int NextFunctionsTranslEmpty(int _ValueID)
        {
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT ID FROM tableFunctions WHERE FunctTransl ='' AND ID > @ValueID LIMIT 1";
                        cmd.Parameters.AddWithValue("@ValueID", _ValueID);
                        cmd.CommandTimeout = 2;

                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            return Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

            return 0;
        }
        //Fourni l'ID de la prochaine function dont la traduction n'a pas été contrôlé
        public int NextFunctionsNoCheck(int _ValueID)
        {
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();
                    using (SQLiteCommand cmd = con.CreateCommand())
                    {
                        cmd.CommandText = "SELECT ID FROM tableFunctions WHERE Checked = 0 AND ID > @ValueID LIMIT 1";
                        cmd.Parameters.AddWithValue("@ValueID", _ValueID);
                        cmd.CommandTimeout = 2;

                        object result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            return Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }

            return 0;
        }

        //Sauvegarde les informations soumisent par l'éditeur.
        public void SaveDataFunctions(string newTranslate, string idTarget, string constant, string textOrigin, int checkedValue = 0)
        {
            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnect))
                {
                    con.Open();

                    if ((!CompareFunctTranslate(constant, newTranslate)) || (checkedValue == 1))
                    {
                        int.TryParse(idTarget, out int ID);
                        string sql = "UPDATE tableFunctions SET FunctTransl = @newTranslate, Checked = @Checked WHERE ID = @ID";

                        using (SQLiteCommand cmd = new SQLiteCommand(sql, con))
                        {
                            cmd.Parameters.AddWithValue("@TextOrigin", textOrigin);
                            cmd.Parameters.AddWithValue("@newTranslate", newTranslate);
                            cmd.Parameters.AddWithValue("@Checked", checkedValue);
                            cmd.Parameters.AddWithValue("@ID", ID);
                            cmd.CommandTimeout = 2;
                            int rowsAffected = cmd.ExecuteNonQuery();

                            if (rowsAffected == 0)
                            {
                                throw new ArgumentException($"Failed to save!");
                            }
                        }

                        con.Close();
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        #endregion

        //Export dans un fichier des constantes des Textes et Functions 
        public void ExportFiles(object _sender, bool keyb = false)
        {
            //Export dans un fichier des constantes des Textes et Functions 
            try
            {
                string filePathOut = filePathOutL;
                string filePathIn = filePathInL;


                if (keyb)
                {
                    filePathOut = filePathOutK;
                    filePathIn = filePathInK;
                }


                _SenderWorker = _sender;
                if (!File.Exists(filePathIn))
                {
                    throw new ArgumentException("The model file data\\sources\\localizations.lua is missing!");
                }

                ((BackgroundWorker)_SenderWorker).ReportProgress(0);

                List<DataExportLua> dataExportLua = new List<DataExportLua>();
                using (SQLiteConnection con = new SQLiteConnection(SQLStringConnectRo))
                {
                    con.Open();
                    string sql = $"SELECT Constant, TextTransl FROM tableLocalizations tl WHERE tl.TypeSource {(keyb ? "<>" : "=")} 'Localizations' UNION SELECT Constant, FunctTransl FROM tableFunctions tf ORDER BY Constant ASC";
                    using (SQLiteCommand cmd = new SQLiteCommand(sql, con))
                    {
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                dataExportLua.Add(new DataExportLua { Constant = reader.GetString(0), Translation = reader.GetString(1) });
                            }
                        }
                    }
                }

                string text = File.ReadAllText(filePathIn);

                int fullProgress = 0;
                int runProgress = 0;

                MatchCollection matches1 = Regex.Matches(text, pattern1);
                fullProgress += matches1.Count;
                
                MatchCollection matches2 = Regex.Matches(text, pattern2);
                MatchCollection matches3 = Regex.Matches(text, pattern3);
                MatchCollection matches4 = Regex.Matches(text, pattern4);
                fullProgress += matches2.Count + matches3.Count + matches4.Count;

                ProcessMatches(matches1, dataExportLua, ref runProgress, fullProgress, ref text);
                ProcessMatches(matches2, dataExportLua, ref runProgress, fullProgress, ref text);
                ProcessMatches(matches3, dataExportLua, ref runProgress, fullProgress, ref text, true);
                ProcessMatches(matches4, dataExportLua, ref runProgress, fullProgress, ref text, true);

                File.WriteAllText(filePathOut, text);
            }
            catch (Exception)
            {
                throw;
            }
        }

        //Traitement des données des functions avant l'export
        private void ProcessMatches(MatchCollection matches, List<DataExportLua> dataExportLua, ref int runProgress, int fullProgress, ref string text, bool sens = false)
        {
            //Traitement des données des functions avant l'export
            if (_SenderWorker != null)
            {
                foreach (Match match in matches)
                {
                    int progressValue = calcProgress(fullProgress, runProgress);
                    ((BackgroundWorker)_SenderWorker).ReportProgress(progressValue);
                    runProgress++;
                    string MatchFull = match.ToString();
                    string OriConstant = match.Groups[1].Value;
                    string group2Value = match.Groups[2].Value;
                    if (sens)
                    {
                        OriConstant = match.Groups[2].Value;
                        group2Value = match.Groups[1].Value;
                    }
                    int index = dataExportLua.FindIndex(item => item.Constant == OriConstant);

                    if (index != -1)
                    {
                        string? TextTransl = dataExportLua[index].Translation;

                        if (!string.IsNullOrEmpty(TextTransl))
                        {
                            MatchFull = MatchFull.Replace(group2Value, TextTransl);
                            text = text.Replace(match.ToString(), MatchFull);
                        }
                    }
                }
            }
        }









    }

    internal class StatBdd
    {
        static string appDataAppliPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "TranslatorLua");
        static string PathBDD = Path.Combine(appDataAppliPath, "data\\sqlites\\bdd.sqlite"); // Emplacement de la Base de donnée  
        private static string SQLStrinConnectRo = $"DATA Source={PathBDD};Version=3;Read Only=true;"; // Séquence d'accès SQL Read Only
        public int nbRow { get; private set; }
        public int nbRowTransl { get; private set; }
        public int nbRowUntransl { get; private set; }
        public int nbRowLocalizationChecked { get; private set; }
        public int nbRowFunctionChecked { get; private set; }

        public StatBdd()
        {

            try
            {
                using (SQLiteConnection con = new SQLiteConnection(SQLStrinConnectRo))
                {
                    con.Open();
                    string sql = $"SELECT SUM(total_count) AS total_sum FROM (SELECT COUNT(*) AS total_count FROM tableFunctions tf UNION ALL SELECT COUNT(*) AS total_count FROM tableLocalizations tl)";
                    string sql2 = $"SELECT SUM(total_count) AS total_sum FROM (SELECT COUNT(*) AS total_count FROM tableFunctions tf WHERE tf.FunctTransl = '' UNION ALL SELECT COUNT(*) AS total_count FROM tableLocalizations tl WHERE tl.TextTransl = '')";
                    string sql3 = $"SELECT SUM(total_count) AS total_sum FROM (SELECT COUNT(*) AS total_count FROM tableFunctions tf WHERE tf.FunctTransl <> '' UNION ALL SELECT COUNT(*) AS total_count FROM tableLocalizations tl WHERE tl.TextTransl <> '')";
                    string sql4 = $"SELECT COUNT(*) AS total From tableLocalizations tl WHERE tl.Checked = 0";
                    string sql5 = $"SELECT COUNT(*) AS total From tableFunctions tf WHERE tf.Checked = 0";


                    using (SQLiteCommand cmd = new SQLiteCommand(sql, con))
                    {
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nbRow = Convert.ToInt32(reader["total_sum"]);
                            }
                            else
                            {
                                nbRow = 0;
                            }
                            reader.Close();
                        }
                    }
                    using (SQLiteCommand cmd = new SQLiteCommand(sql2, con))
                    {
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nbRowUntransl = Convert.ToInt32(reader["total_sum"]);
                            }
                            else
                            {
                                nbRowUntransl = 0;
                            }
                            reader.Close();
                        }
                    }
                    using (SQLiteCommand cmd = new SQLiteCommand(sql3, con))
                    {
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nbRowTransl = Convert.ToInt32(reader["total_sum"]);
                            }
                            else
                            {
                                nbRowTransl = 0;
                            }
                            reader.Close();
                        }

                    }
                    using (SQLiteCommand cmd = new SQLiteCommand(sql4, con))
                    {
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nbRowLocalizationChecked = Convert.ToInt32(reader["total"]);
                            }
                            else
                            {
                                nbRowTransl = 0;
                            }
                            reader.Close();
                        }

                    }
                    using (SQLiteCommand cmd = new SQLiteCommand(sql5, con))
                    {
                        cmd.CommandTimeout = 2;
                        using (SQLiteDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                nbRowFunctionChecked = Convert.ToInt32(reader["total"]);
                            }
                            else
                            {
                                nbRowTransl = 0;
                            }
                            reader.Close();
                        }

                    }
                    con.Close();

                }

            }
            catch (Exception)
            {
                throw;
            }

        }
    }

    internal class DataLocalizations
    {
        public int? ID { get; set; }
        public string? Constant { get; set; }
        public string? TextOrigin { get; set; }
        public string? TextTransl { get; set; }
        public string? TypeSource { get; set; }
        public int? Checked { get; set; }
    }
    internal class DataFunctions
    {
        public int? ID { get; set; }
        public string? Constant { get; set; }
        public string? FunctOrigin { get; set; }
        public string? FunctTransl { get; set; }
        public int? Checked { get; set; }
    }

    internal class DataExportLua
    {
        public string? Constant { get; set; }
        public string? Translation { get; set; }
    }

    internal class CheckBoxOption
    {
        public int ID { get; set; }
        public string? Constant { get; set; }
    }
}

