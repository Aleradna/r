local localizations = {}

local researchName = "Исследовать"
local researchingName = "Исследует"

local vowelsSet = {
    a = true,
    e = true,
    i = true,
    o = true,
    u = true,
}

local function getAorAn(noun) --crude, may need exceptions for 'hour' 'use' etc
    if noun and vowelsSet[string.sub(string.lower(noun), 1, 1)] then
        return "an"
    end
    return "a"
end

localizations.values = {
    gameName = "Sapiens",
    sapiens = "Sapiens",

    -- mobs
    mob_alpaca = "Альпака",
    mob_alpaca_plural = "Альпаки",
    mob_chicken = "Курица",
    mob_chicken_plural = "Куры",
    mob_mammoth = "Мамонт",
    mob_mammoth_plural = "Мамонты",

    -- buildables
    buildable_craftArea = "Зона для Крафта",
    buildable_craftArea_plural = "Зоны для Крафта",
    buildable_craftArea_summary = "Создание базовых предметов и простых инструментов",
    buildable_storageArea = "Зона для Хранения",
    buildable_storageArea_plural = "Зоны для Хранения",
    buildable_storageArea_summary = "Соберите все, что у вас есть, и сложите в аккуратную стопку.",
    buildable_compostBin = "Компостная яма", --0.4
    buildable_compostBin_plural = "Компостные ямы", --0.4
    buildable_compostBin_summary = "Компостные ямы превращают гниющие органические вещества в удобрения, которые затем можно использовать для обогащения почвы.", --0.4
    buildable_campfire = "Костер",
    buildable_campfire_plural = "Костры",
    buildable_campfire_summary = "Костер дает тепло и свет, а также позволяет готовить пищу, повышая ее питательную ценность.",
    buildable_brickKiln = "Печь для обжига",
    buildable_brickKiln_plural = "Печи для обжига",
    buildable_brickKiln_summary = "Этип печи можно использовать для обжига керамики. Обожженная керамика более водостойкая и прослужит дольше, чем необожженная.",
    buildable_torch = "Факел",
    buildable_torch_plural = "Факелы",
    buildable_torch_summary = "Светит вокруг. Требует много сена.",
    buildable_hayBed = "Подстилка из Сена",
    buildable_hayBed_plural = "Подстилки из Сена",
    buildable_hayBed_summary = "Лучше, чем спать на сырой земле.",
    buildable_woolskinBed = "Подстилка из Шкуры",
    buildable_woolskinBed_plural = "Подстилки из Шкур",
    buildable_woolskinBed_summary = "Теплое место для сна.",
    buildable_thatchRoof = "Соломенная Хижина/Крыша",
    buildable_thatchRoof_plural = "Соломенные Хижины/Крыши",
    buildable_thatchRoof_summary = "Базовое укрытие, которое также можно использовать как крышу.",
    buildable_thatchRoofSlope = "Наклонная секция соломенной крыши", --0.4
    buildable_thatchRoofSlope_plural = "Наклонные секции соломенной крыши", --0.4
    buildable_thatchRoofSlope_summary = "Полезно рядом с углами или для заполнения небольшого зазора", --0.4
    buildable_thatchRoofSmallCorner = "Угол соломенной крыши", --0.4
    buildable_thatchRoofSmallCorner_plural = "Углы соломенной крыши", --0.4
    buildable_thatchRoofSmallCorner_summary = "Небольшой угол крыши", --0.4
    buildable_thatchRoofSmallCornerInside = "Внутренний угол соломенной крыши", --0.4
    buildable_thatchRoofSmallCornerInside_plural = "Внутренние углы соломенной крыши", --0.4
    buildable_thatchRoofSmallCornerInside_summary = "Чтобы заполнить этот надоедливый пробел", --0.4
    buildable_thatchRoofTriangle = "Треугольник с соломенной крышей", --0.4
    buildable_thatchRoofTriangle_plural = "Треугольники с соломенной крышей", --0.4
    buildable_thatchRoofTriangle_summary = "Полезен над треугольными этажами.", --0.4
    buildable_thatchRoofInvertedTriangle = "Перевернутый треугольник с соломенной крышей", --0.4
    buildable_thatchRoofInvertedTriangle_plural = "Перевернутые треугольники с соломенной крышей", --0.4
    buildable_thatchRoofInvertedTriangle_summary = "Полезен над треугольными этажами.", --0.4
    buildable_thatchRoofLarge = "Большая Соломенная Крыша",
    buildable_thatchRoofLarge_plural = "Большие соломенные крыши",
    buildable_thatchRoofLarge_summary = "Большая секция крыши.",
    buildable_thatchRoofLargeCorner = "Угол большой соломенной крыши",
    buildable_thatchRoofLargeCorner_plural = "Большие углы соломенной крыши",
    buildable_thatchRoofLargeCorner_summary = "Большой угол крыши.",
    buildable_thatchRoofLargeCornerInside = "Внутренний угол большой соломенной крыши", --0.4
    buildable_thatchRoofLargeCornerInside_plural = "Внутренние углы большой соломенной крыши", --0.4
    buildable_thatchRoofLargeCornerInside_summary = "Большой внутренний угол крыши.", --0.4
    buildable_thatchWall = "Соломенная стена",
    buildable_thatchWall_plural = "Соломенные стены",
    buildable_thatchWall_summary = "Самая простая и быстрая стена для возведения. Размеры: 4x2",
    buildable_thatchWallDoor = "Соломенная стена с дверью",
    buildable_thatchWallDoor_plural = "Соломенные стены с дверями",
    buildable_thatchWallDoor_summary = "Самая простая и быстрая стена для возведения. Размеры: 4x2",
    buildable_thatchWallLargeWindow = "Большое окно в соломенной стене",
    buildable_thatchWallLargeWindow_plural = "Большие окна соломенных стен",
    buildable_thatchWallLargeWindow_summary = "Самая простая и быстрая стена для возведения. Размеры: 4x2",
    buildable_thatchWall4x1 = "Соломенная короткая стена",
    buildable_thatchWall4x1_plural = "Соломенные короткие стены",
    buildable_thatchWall4x1_summary = "Самая простая и быстрая стена для возведения. Размеры: 4x1",
    buildable_thatchWall2x2 = "Соломенная квадратная стена",
    buildable_thatchWall2x2_plural = "Соломенные квадратные стены",
    buildable_thatchWall2x2_summary = "Самая простая и быстрая стена для возведения. Размеры: 2x2",
    buildable_thatchRoofEnd = "Торцевая стена соломенной крыши", --0.4 добавлено "Конец"
    buildable_thatchRoofEnd_plural = "Торцевые стены соломенной крыши", --0.4 добавлено "Конец"
    buildable_thatchRoofEnd_summary = "Самая простая и быстрая стена для возведения. Заполняет конечный треугольник хижины/крыши.", --0.4 изменено
    buildable_splitLogFloor = "Разделить бревенчатый пол 2x2",
    buildable_splitLogFloor_plural = "Разделить бревенчатый пол 2x2",
    buildable_splitLogFloor_summary = "Простой пол.",
    buildable_splitLogFloor4x4 = "Разделить бревенчатый пол 4x4",
    buildable_splitLogFloor4x4_plural = "Разделить бревенчатый пол 4x4",
    buildable_splitLogFloor4x4_summary = "Простой пол.",
    buildable_splitLogFloorTri2 = "Разделить треугольник бревенчатого пола", --0.4
    buildable_splitLogFloorTri2_plural = "Разделить треугольники бревенчатого пола", --0.4
    buildable_splitLogFloorTri2_summary = "Деревянный треугольный пол", --0.4
    buildable_splitLogWall = "Сплит-стена из бревен",
    buildable_splitLogWall_plural = "Разделение бревенчатых стен",
    buildable_splitLogWall_summary = "Крепкая деревянная стена. Размеры: 4x2",
    buildable_splitLogWall4x1 = "Расколоть короткую стену из бревен",
    buildable_splitLogWall4x1_plural = "Разделить короткие стены из бревен",
    buildable_splitLogWall4x1_summary = "Крепкая деревянная стена. Размеры: 4x1",
    buildable_splitLogWall2x2 = "Квадратная стена из бревен",
    buildable_splitLogWall2x2_plural = "Квадратные стены из бревен",
    buildable_splitLogWall2x2_summary = "Крепкая деревянная стена. Размеры: 2x2",
    buildable_splitLogWallDoor = "Разделенная бревенчатая стена с дверью",
    buildable_splitLogWallDoor_plural = "Разделить бревенчатые стены дверями",
    buildable_splitLogWallDoor_summary = "Крепкая деревянная стена. Размеры: 4x2",
    buildable_splitLogWallLargeWindow = "Разделить бревенчатую стену большим окном",
    buildable_splitLogWallLargeWindow_plural = "Разделить бревенчатые стены большими окнами",
    buildable_splitLogWallLargeWindow_summary = "Крепкая стена из дерева. Размеры: 4x2",
    buildable_splitLogRoofEnd = "Торцевая стена разделенной бревенчатой ​​крыши", --0.4 добавлено "Конец"
    buildable_splitLogRoofEnd_plural = "Раздельные торцевые стены бревенчатой ​​крыши",
    buildable_splitLogBench_plural = "Разделить скамейки из бревен",
    buildable_splitLogBench_summary = "Хорошее место для сидения.",
    buildable_splitLogSteps = "Разбить бревенчатые ступени 2x3 на один этаж",
    buildable_splitLogSteps_plural = "Разбить бревенчатые ступени 2x3 на один этаж",
    buildable_splitLogSteps_summary = "Для перемещения между этажами или вверх по склонам.",
    buildable_splitLogSteps2x2 = "Разбить бревенчатые ступени 2x2 на половину этажа",
    buildable_splitLogSteps2x2_plural = "Разбить бревенчатые ступени 2x2 на половину этажа",
    buildable_splitLogSteps2x2_summary = "Для перемещения между этажами или вверх по склонам.",
    buildable_splitLogRoof = "Разделенная бревенчатая хижина/крыша",
    buildable_splitLogRoof_plural = "Раздельные бревенчатые хижины/крыши",
    buildable_splitLogRoof_summary = "Прочное укрытие, которое также можно использовать как крышу.",
    buildable_splitLogRoofSlope = "Разделенная секция наклонной бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofSlope_plural = "Разделить наклонные секции бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofSlope_summary = "Полезно рядом с углами или для заполнения небольшого зазора", --0.4
    buildable_splitLogRoofSmallCorner = "Угол разделенной бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofSmallCorner_plural = "Разделить углы бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofSmallCorner_summary = "Небольшой угол крыши", --0.4
    buildable_splitLogRoofSmallCornerInside = "Внутренний угол разделенной бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofSmallCornerInside_plural = "Разделение внутренних углов бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofSmallCornerInside_summary = "Чтобы заполнить этот надоедливый пробел", --0.4
    buildable_splitLogRoofTriangle = "Треугольник разделенной бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofTriangle_plural = "Разделить треугольники бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofTriangle_summary = "Полезен над треугольными этажами.", --0.4
    buildable_splitLogRoofInvertedTriangle = "Перевернутый треугольник разделенной бревенчатой ​​крыши", --0.4
    buildable_splitLogRoofInvertedTriangle_plural = "Разделить бревенчатую крышу на перевернутые треугольники", --0.4
    buildable_splitLogRoofInvertedTriangle_summary = "Полезно над треугольными этажами.", --0.4
    buildable_mudBrickWall = "Стена из сырцового кирпича",
    buildable_mudBrickWall_plural = "Стены из сырцового кирпича",
    buildable_mudBrickWall_summary = "Крепкая стена, но может быть повреждена дождем. Размеры: 4x2", --0.4 обновлен с добавлением "но может быть поврежден дождем"
    buildable_mudBrickWallDoor = "Стена из сырцового кирпича с дверью",
    buildable_mudBrickWallDoor_plural = "Глиняные стены с дверями",
    buildable_mudBrickWallDoor_summary = "Крепкая стена, но может быть повреждена дождем. Размеры: 4x2", --0.4 обновлен с добавлением "но может быть поврежден дождем"
    buildable_mudBrickWallLargeWindow = "Стена из сырцового кирпича с большим окном",
    buildable_mudBrickWallLargeWindow_plural = "Глиняные стены с большими окнами",
    buildable_mudBrickWallLargeWindow_summary = "Крепкая стена, но может быть повреждена дождем. Размеры: 4x2", --0.4 обновлен с добавлением "но может быть поврежден дождем"
    buildable_mudBrickWall4x1 = "Короткая стена из сырцового кирпича", -- 0.4 изменено "Половина" на "Короткая"
    buildable_mudBrickWall4x1_plural = "Короткие стены из сырцового кирпича", -- 0.4 изменило "Половина" на "Короткие"
    buildable_mudBrickWall4x1_summary = "Крепкая стена, но может быть повреждена дождем. Размеры: 4x1", --0.4 обновлен с добавлением "но может быть поврежден дождем"
    buildable_mudBrickWall2x2 = "Квадратная стена из сырцового кирпича",
    buildable_mudBrickWall2x2_plural = "Квадратные стены из сырцового кирпича",
    buildable_mudBrickWall2x2_summary = "Крепкая стена, но может быть повреждена дождем. Размеры: 2x2", --0.4 обновлен с добавлением "но может быть поврежден дождем"
    buildable_mudBrickRoofEnd = "Торцевая стена крыши из сырцового кирпича", --0.4
    buildable_mudBrickRoofEnd_plural = "Торцевые стены крыши из сырцового кирпича", --0.4
    buildable_mudBrickRoofEnd_summary = "Крепкая стена, но может быть повреждена дождем. Заполняет конечный треугольник хижины/крыши.", --0.4
    buildable_mudBrickColumn = "Колонна из сырцового кирпича",
    buildable_mudBrickColumn_plural = "Столбцы из сырцового кирпича",
    buildable_mudBrickColumn_summary = "Декоративная колонна. Может быть повреждена дождем.", --0.4 обновлен с добавлением "Может быть поврежден дождем"
    buildable_mudBrickFloor2x2 = "Пол из сырцового кирпича 2x2",
    buildable_mudBrickFloor2x2_plural = "Пол из сырцового кирпича 2x2",
    buildable_mudBrickFloor2x2_summary = "Хороший пол для сухих помещений.",
    buildable_mudBrickFloor4x4 = "Пол из сырцового кирпича 4x4",
    buildable_mudBrickFloor4x4_plural = "Пол из сырцового кирпича 4x4",
    buildable_mudBrickFloor4x4_summary = "Хороший пол для сухих помещений.",
    buildable_mudBrickFloorTri2 = "Треугольник пола из сырцового кирпича", --0.4
    buildable_mudBrickFloorTri2_plural = "Треугольники пола из сырцового кирпича", --0.4
    buildable_mudBrickFloorTri2_summary = "Хороший пол для сухих мест", --0.4

    buildable_stoneBlockWall = "Стена из каменных блоков", --0.4
    buildable_stoneBlockWall_plural = "Стены из каменных блоков", --0.4
    buildable_stoneBlockWall_summary = "Крепкая стена. Размеры: 4x2", --0,4
    buildable_stoneBlockWallDoor = "Стена из каменных блоков с дверью", --0.4
    buildable_stoneBlockWallDoor_plural = "Стены из каменных блоков с дверями", --0.4
    buildable_stoneBlockWallDoor_summary = "Крепкая стена. Размеры: 4x2", --0,4
    buildable_stoneBlockWallLargeWindow = "Стена из каменных блоков с большим окном", --0.4
    buildable_stoneBlockWallLargeWindow_plural = "Стены из каменных блоков с большими окнами", --0.4
    buildable_stoneBlockWallLargeWindow_summary = "Крепкая стена. Размеры: 4x2", --0,4
    buildable_stoneBlockRoofEnd = "Торцевая стена крыши из каменных блоков", --0.4
    buildable_stoneBlockRoofEnd_plural = "Торцевые стены крыши из каменных блоков", --0.4
    buildable_stoneBlockRoofEnd_summary = "Крепкая стена. Заполняет конечный треугольник хижины/крыши.", --0.4
    buildable_stoneBlockWall4x1 = "Короткая стена из каменных блоков", --0,4
    buildable_stoneBlockWall4x1_plural = "Короткие стены из каменных блоков", --0.4
    buildable_stoneBlockWall4x1_summary = "Крепкая стена. Размеры: 4x1", --0,4
    buildable_stoneBlockWall2x2 = "Квадратная стена из каменных блоков", --0,4
    buildable_stoneBlockWall2x2_plural = "Квадратные стены из каменных блоков", --0.4
    buildable_stoneBlockWall2x2_summary = "Крепкая стена. Размеры: 2x2", --0,4
    buildable_stoneBlockColumn = "Колонна из каменных блоков", --0.4
    buildable_stoneBlockColumn_plural = "Колонны из каменных блоков", --0.4
    buildable_stoneBlockColumn_summary = "Декоративная колонна", --0.4

    buildable_brickWall = "Кирпичная стена",
    buildable_brickWall_plural = "Кирпичные стены",
    buildable_brickWall_summary = "Крепкая стена. Размеры: 4x2",
    buildable_brickWallDoor = "Кирпичная стена с дверью",
    buildable_brickWallDoor_plural = "Кирпичные стены с дверями",
    buildable_brickWallDoor_summary = "Крепкая стена. Размеры: 4x2",
    buildable_brickWallLargeWindow = "Кирпичная стена с большим окном",
    buildable_brickWallLargeWindow_plural = "Кирпичные стены с большими окнами",
    buildable_brickWallLargeWindow_summary = "Крепкая стена. Размеры: 4x2",
    buildable_brickWall4x1 = "Кирпичная короткая стена", -- 0.4 изменено "Половина" на "Короткая"
    buildable_brickWall4x1_plural = "Кирпичные короткие стены", -- 0.4 изменено "Половина" на "Короткие"
    buildable_brickWall4x1_summary = "Крепкая стена. Размеры: 4x1",
    buildable_brickWall2x2 = "Кирпичная квадратная стена",
    buildable_brickWall2x2_plural = "Кирпичные квадратные стены",
    buildable_brickWall2x2_summary = "Крепкая стена. Размеры: 2x2",
    buildable_brickRoofEnd = "Кирпичная торцевая стена крыши", --0.4
    buildable_brickRoofEnd_plural = "Кирпичные торцевые стены крыши", --0.4
    buildable_brickRoofEnd_summary = "Крепкая стена. Заполняет конечный треугольник хижины/крыши.", --0.4
    buildable_tileFloor2x2 = "Плитка пола 2x2",
    buildable_tileFloor2x2_plural = "Плитка пола 2x2",
    buildable_tileFloor2x2_summary = "Сельский шарм.",
    buildable_tileFloor4x4 = "Плитка пола 4x4",
    buildable_tileFloor4x4_plural = "Плитка пола 4x4",
    buildable_tileFloor4x4_summary = "Сельский шарм.",
    buildable_genericPath_summary = "Пути позволяют сапиенсам двигаться быстрее.",
    buildable_tileRoof = "Черепичная Хижина/Крыша",
    buildable_tileRoof_plural = "Плиточные хижины/крыши",
    buildable_tileRoof_summary = "Крепкая защищенная от непогоды крыша.",
    buildable_tileRoofSlope = "Наклонная секция черепичной крыши", --0.4
    buildable_tileRoofSlope_plural = "Наклонные секции черепичной крыши", --0.4
    buildable_tileRoofSlope_summary = "Полезно рядом с углами или для заполнения небольшого зазора", --0.4
    buildable_tileRoofSmallCorner = "Угол черепичной крыши", --0.4
    buildable_tileRoofSmallCorner_plural = "Углы черепичной крыши", --0,4
    buildable_tileRoofSmallCorner_summary = "Небольшой угол крыши", --0.4
    buildable_tileRoofSmallCornerInside = "Внутренний угол черепичной крыши", --0.4
    buildable_tileRoofSmallCornerInside_plural = "Внутренние углы черепичной крыши", --0,4
    buildable_tileRoofSmallCornerInside_summary = "Чтобы заполнить этот надоедливый пробел.", --0.4
    buildable_tileRoofTriangle = "Треугольник черепичной крыши", --0.4
    buildable_tileRoofTriangle_plural = "Треугольники черепичной крыши", --0.4
    buildable_tileRoofTriangle_summary = "Полезно над треугольными этажами.", --0.4
    buildable_tileRoofInvertedTriangle = "Перевернутый треугольник черепичной крыши", --0.4
    buildable_tileRoofInvertedTriangle_plural = "Перевернутые треугольники черепичной крыши", --0.4
    buildable_tileRoofInvertedTriangle_summary = "Полезно над треугольными этажами.", --0.4
    buildable_tileFloorTri2 = "Треугольник плитки на полу", --0.4
    buildable_tileFloorTri2_plural = "Треугольники плитки пола", --0.4
    buildable_tileFloorTri2_summary = "Деревенский шарм", --0.4
    buildable_fertilize = "Мульча", --0.4
    buildable_fertilize_plural = "Мульча", --0.4
    buildable_fertilize_summary = "Обогащайте почву, закапывая компост или навоз.", --0.4

    
    --craftables
    craftable_rockSmall = "Твердый камень", --0.4 добавлено "Сложно"
    craftable_rockSmall_plural = "Твердые камни", --0.4 добавлено "Сложно"
    craftable_rockSmall_summary = "Можно превратить в основные инструменты.",
    craftable_rockSmallSoft = "Мягкий камень - М", --0.4
    craftable_rockSmallSoft_plural = "Мягкие камни", --0.4
    craftable_rockSmallSoft_summary = "Может быть легко обработан в первоначальный ручной топор.", --0.4
    craftable_stoneSpearHead = "Каменный Наконечник Копья",
    craftable_stoneSpearHead_plural = "Каменные наконечники копий",
    craftable_stoneSpearHead_summary = "Используется для изготовления каменных копий",
    craftable_stonePickaxeHead = "Каменный Наконечник Кирки",
    craftable_stonePickaxeHead_plural = "Наконечники каменных кирок",
    craftable_stonePickaxeHead_summary = "Используется для изготовления каменных кирок.",
    craftable_flintSpearHead = "Кремневый Наконечник Копья",
    craftable_flintSpearHead_plural = "Кремневые наконечники копий",
    craftable_flintSpearHead_summary = "Используется для изготовления кремневых копий",
    craftable_boneSpearHead = "Костяной Наконечник Копья",
    craftable_boneSpearHead_plural = "Костяные наконечники копий",
    craftable_boneSpearHead_summary = "Используется для изготовления костяных копий",
    craftable_stoneKnife = "Каменный Нож",
    craftable_stoneKnife_plural = "Каменные ножи",
    craftable_stoneKnife_summary = "Используется для многих целей, включая разделку мяса и изготовление изделий из дерева.",
    craftable_stoneChisel = "Каменное долото", --0.4
    craftable_stoneChisel_plural = "Каменные долото", --0.4
    craftable_stoneChisel_summary = "Используется для вырезания каменных блоков из мягких пород, таких как песчаник и известняк, а также для резьбы по дереву.", --0.4
    craftable_quernstone = "Ручная дверь",
    craftable_quernstone_plural = "Ручная дверь",
    craftable_quernstone_summary = "Используется для измельчения, может перемалывать пшеницу в муку.",
    craftable_flintKnife = "Кремневый Нож",
    craftable_flintKnife_plural = "Кремневые ножи",
    craftable_flintKnife_summary = "Используется для многих целей, включая разделку мяса и изготовление изделий из дерева.",
    craftable_boneKnife = "Костяной Нож",
    craftable_boneKnife_plural = "Костяные Ножи",
    craftable_boneKnife_summary = "Используется для многих целей, включая разделку мяса и изготовление изделий из дерева.",
    craftable_bronzeKnife = "Бронзовый нож", --0.4
    craftable_bronzeKnife_plural = "Бронзовые ножи", --0.4
    craftable_bronzeKnife_summary = "Используется для многих целей, включая разделку мяса и изготовление изделий из дерева", --0.4
    craftable_bronzeChisel = "Бронзовое долото", --0.4
    craftable_bronzeChisel_plural = "Бронзовые долота", --0.4
    craftable_bronzeChisel_summary = "Используется для вырезания каменных блоков из мягких и твердых пород, а также для резьбы по дереву.", --0.4
    craftable_boneFlute = "Костяная Флейта",
    craftable_boneFlute_plural = "Костяные Флейты",
    craftable_boneFlute_summary = "Музыка помогает сапиенсам быть счастливыми.",
    craftable_logDrum = "Барабан для бревен",
    craftable_logDrum_plural = "Барабан для бревен",
    craftable_logDrum_summary = "Музыка делает сапиенс счастливыми.",
    craftable_balafon = "Балафон",
    craftable_balafon_plural = "Балафоны",
    craftable_balafon_summary = "Музыка помогает сапиенсам быть счастливыми.",
    craftable_flintPickaxeHead = "Кремневый Наконечник Кирки",
    craftable_flintPickaxeHead_plural = "Наконечники кремневых кирок",
    craftable_flintPickaxeHead_summary = "Используется для изготовления кремневых кирок.",
    craftable_woodenPole = "Деревянный столб (устарело)",
    craftable_woodenPole_plural = "Деревянные столбы (устарело)",
    craftable_woodenPole_summary = "Скоро будет удален из игры.",
    craftable_stoneSpear = "Каменное Копье",
    craftable_stoneSpear_plural = "Каменные копья",
    craftable_stoneSpear_summary = "Используется для охоты, рыбалки и боя.",
    craftable_flintSpear = "Кремневое Копье",
    craftable_flintSpear_plural = "Кремневые копья",
    craftable_flintSpear_summary = "Используется для охоты, рыбалки и боя.",
    craftable_boneSpear = "Костяное Копье",
    craftable_boneSpear_plural = "Костяные копья",
    craftable_boneSpear_summary = "Используется для охоты, рыбалки и боя.",
    craftable_stonePickaxe = "Каменная Кирка",
    craftable_stonePickaxe_plural = "Каменные кирки",
    craftable_stonePickaxe_summary = "Можно использовать для добычи камня, а также для облегчения копания.",
    craftable_flintPickaxe = "Кремневая Кирка",
    craftable_flintPickaxe_plural = "Кремневые кирки",
    craftable_flintPickaxe_summary = "Можно использовать для добычи камней, а также для облегчения копания.",
    craftable_stoneHatchet = "Каменный Топорик",
    craftable_stoneHatchet_plural = "Каменные топоры",
    craftable_stoneHatchet_summary = "Хорошо подходит для рубки деревьев.",
    craftable_stoneAxeHead = "Каменный Наконечник Топора (Т)", --0.4 добавлено "(Hard Rock)"
    craftable_stoneAxeHead_plural = "Каменные Наконечники Топора (Т)", --0.4 добавлено "(Hard Rock)"
    craftable_stoneAxeHead_summary = "Можно использовать для рубки дров и копания земли. Также можно использовать для изготовления топоров.", --0.4 добавлено "Также можно использовать для изготовления топоров"
    craftable_stoneAxeHeadSoft = "Каменный ручной топор (М)", --0.4
    craftable_stoneAxeHeadSoft_plural = "Каменные ручные топоры (М)", --0.4
    craftable_stoneAxeHeadSoft_summary = "Можно использовать для рубки дров и копания земли. Этот тип камня мягкий, поэтому его можно быстро изготовить, но он быстро разлагается.", --0.4
    craftable_flintAxeHead = "Кремневый Наконечник Топора",
    craftable_flintAxeHead_plural = "Кремневые ручные топоры",
    craftable_flintAxeHead_summary = "Можно рубить дрова и копать землю.",
    craftable_flintHatchet = "Кремневый Топорик",
    craftable_flintHatchet_plural = "Кремневые топоры",
    craftable_flintHatchet_summary = "Хорошо подходит для рубки деревьев.",

    craftable_bronzeAxeHead = "Бронзовый ручной топор", --0.4
    craftable_bronzeAxeHead_plural = "Бронзовые ручные топоры", --0.4
    craftable_bronzeAxeHead_summary = "Можно рубить дрова и копать землю", --0.4
    craftable_bronzeHatchet = "Бронзовый топорик", --0.4
    craftable_bronzeHatchet_plural = "Бронзовые топоры", --0.4
    craftable_bronzeHatchet_summary = "Хорошо подходит для рубки деревьев", --0.4
    craftable_bronzeSpearHead = "Бронзовый наконечник копья", --0.4
    craftable_bronzeSpearHead_plural = "Бронзовые наконечники копий", --0.4
    craftable_bronzeSpearHead_summary = "Используется для изготовления бронзовых копий", --0.4
    craftable_bronzeSpear = "Бронзовое копье", --0.4
    craftable_bronzeSpear_plural = "Бронзовые копья", --0.4
    craftable_bronzeSpear_summary = "Используется для охоты, рыбалки и боя", --0.4
    craftable_bronzePickaxeHead = "Бронзовый наконечник кирки", --0.4
    craftable_bronzePickaxeHead_plural = "Бронзовые наконечники кирки", --0.4
    craftable_bronzePickaxeHead_summary = "Используется для изготовления бронзовых кирок", --0.4
    craftable_bronzePickaxe = "Бронзовая кирка", --0.4
    craftable_bronzePickaxe_plural = "Бронзовые кирки", --0.4
    craftable_bronzePickaxe_summary = "Можно использовать для добычи камня, а также легче копать", --0.4
    craftable_stoneHammerHead = "Наконечник каменного молота", --0.4
    craftable_stoneHammerHead_plural = "Наконечники каменных молотов", --0.4
    craftable_stoneHammerHead_summary = "Используется для изготовления молотков для кузнечного дела", --0.4
    craftable_stoneHammer = "Каменный молот", --0.4
    craftable_stoneHammer_plural = "Каменные молоты", --0,4
    craftable_stoneHammer_summary = "Для строительства и кузнечного дела", --0.4
    craftable_bronzeHammerHead = "Бронзовый молот", --0.4
    craftable_bronzeHammerHead_plural = "Бронзовые наконечники молота", --0.4
    craftable_bronzeHammerHead_summary = "Используется для изготовления молотков для кузнечного дела", --0.4
    craftable_bronzeHammer = "Бронзовый молот", --0,4
    craftable_bronzeHammer_plural = "Бронзовые молоты", --0,4
    craftable_bronzeHammer_summary = "Для кузнечного дела", --0.4

    craftable_splitLog = "Доски",
    craftable_splitLog_plural = "Доски",
    craftable_splitLog_summary = "Используется для строительства, по нему также можно ходить.", --b20
    craftable_butcherChicken = "Мясной цыпленок",
    craftable_butcherChicken_plural = "Разбить цыплят",
    craftable_butcherChicken_action = "Разделка курицы", --0.3.0
    craftable_butcherChicken_summary = "Соберите мясо курицы.",
    craftable_butcherAlpaca = "Мясная альпака",
    craftable_butcherAlpaca_plural = "Мясник альпак",
    craftable_butcherAlpaca_action = "Забой альпаки", --0.3.0
    craftable_butcherAlpaca_summary = "Соберите мясо и шерсть альпаки.",
    craftable_cookedChicken = "Приготовленное куриное мясо",
    craftable_cookedChicken_plural = "Приготовленное куриное мясо",
    craftable_cookedChicken_summary = "Победитель-победитель.",
    craftable_campfireRoastedPumpkin = "Жареная тыква на костре",
    craftable_campfireRoastedPumpkin_plural = "Жареная тыква на костре",
    craftable_campfireRoastedPumpkin_summary = "Тыква.",
    craftable_campfireRoastedBeetroot = "Жареная свекла у костра",
    craftable_campfireRoastedBeetroot_plural = "Жареная свекла у костра",
    craftable_campfireRoastedBeetroot_summary = "Свекла ест ее сырой.",
    craftable_flatbread = "Лепешка",
    craftable_flatbread_plural = "Лепешки",
    craftable_flatbread_summary = "Самый простой хлеб.",
    craftable_unfiredUrnWet = "Необожженная урна",
    craftable_unfiredUrnWet_plural = "Необожженные урны",
    craftable_unfiredUrnWet_summary = "Можно использовать для хранения зерна. При выстреле содержимое дольше сохраняется.", --0.3.0 изменено
    craftable_firedUrn = "Огненная урна",
    craftable_firedUrn_plural = "Огненные урны",
    craftable_firedUrn_summary = "Можно использовать для хранения зерна. При выстреле содержимое дольше сохраняется.", --0.3.0 изменено
    craftable_unfiredBowlWet = "Необожженная чаша", --0.3.0
    craftable_unfiredBowlWet_plural = "Необожженные чаши", --0.3.0
    craftable_unfiredBowlWet_summary = "Можно использовать для хранения лекарств. При выстреле содержимое дольше сохраняется.", --0.3.0
    craftable_firedBowl = "Огненная чаша", --0.3.0
    craftable_firedBowl_plural = "Зажженные чаши", --0.3.0
    craftable_firedBowl_summary = "Можно использовать для хранения лекарств. При выстреле содержимое дольше сохраняется.", --0.3.0
    craftable_crucibleWet = "Горнило", --0.4
    craftable_crucibleWet_plural = "Тигли", --0.4
    craftable_crucibleWet_summary = "Используется для удержания расплавленного металла при изготовлении слитков.", --0.4
    craftable_hulledWheat = "Очищенная пшеница",
    craftable_hulledWheat_plural = "Очищенная пшеница",
    craftable_hulledWheat_summary = "Может быть перемолота в муку.", --0.3.0 удалено упоминание о похлёбке, так как её нет в игре
    craftable_thatchResearch = "Исследование соломы",
    craftable_thatchResearch_plural = "Исследование соломы",
    craftable_thatchResearch_summary = "Исследование соломы",
    craftable_mudBrickBuildingResearch = "Исследование каменной кладки", --0.4 changed from mud brick building to masonry, now applies to all brick/block based building
    craftable_mudBrickBuildingResearch_plural = "Исследование каменной кладки", --0.4 changed from mud brick building to masonry, now applies to all brick/block based building
    craftable_mudBrickBuildingResearch_summary = "Исследование каменной кладки.", --0.4 changed from mud brick building to masonry, now applies to all brick/block based building
    craftable_woodBuildingResearch = "Исследование деревянного строительства",
    craftable_woodBuildingResearch_plural = "Исследование деревянного строительства",
    craftable_woodBuildingResearch_summary = "Исследование деревянного строительства",
    craftable_tilingResearch = "Исследование мозаики",
    craftable_tilingResearch_plural = "Исследование мозаики",
    craftable_tilingResearch_summary = "Исследование мозаики.",
    craftable_plantingResearch = "Исследование посевов.",
    craftable_plantingResearch_plural = "Исследование растений",
    craftable_plantingResearch_summary = "Исследование посевов",
    craftable_flour = "Мука",
    craftable_flour_plural = "Мука",
    craftable_flour_summary = "Используется для приготовления хлеба",
    craftable_breadDough = "Тесто",
    craftable_breadDough_plural = "Тесто",
    craftable_breadDough_summary = "Можно запечь хлеб.",
    craftable_flaxTwine = "Льняная Веревка",
    craftable_flaxTwine_plural = "Льняная Веревка",
    craftable_flaxTwine_summary = "Используется для более сложного изготовления инструментов и ткачества.",
    craftable_mudBrickWet = "Грязевой кирпич",
    craftable_mudBrickWet_plural = "Грязевые кирпичи",
    craftable_mudBrickWet_summary = "После высыхания можно использовать для строительства укрытия, а также для строительства печей.",
    craftable_mudTileWet = "Необожженная плитка",
    craftable_mudTileWet_plural = "Необожженные плитки",
    craftable_mudTileWet_summary = "После высушивания и обжига можно использовать для крыш, полов и дорожек.",
    craftable_firedTile = "Плитка",
    craftable_firedTile_plural = "Плитки",
    craftable_firedTile_summary = "Можно использовать для крыш, полов и дорожек.",
    craftable_cookedAlpaca = "Приготовленное мясо альпаки",
    craftable_cookedAlpaca_plural = "Приготовленное мясо альпаки",
    craftable_cookedAlpaca_summary = "Одной ногой или кормом можно накормить большую семью.",
    craftable_cookedMammoth = "Приготовленное мясо мамонта",
    craftable_cookedMammoth_plural = "Приготовленное мясо мамонта",
    craftable_cookedMammoth_summary = "На вкус как пушистый слон.",
    craftable_firedBrick = "Кирпич",
    craftable_firedBrick_plural = "Кирпичи",
    craftable_firedBrick_summary = "Прочный ресурс для строительства.",
    
    --0.3.0 group:
    craftable_injuryMedicine = "Лекарство от травм",
    craftable_injuryMedicine_plural = "Лекарство от травм",
    craftable_injuryMedicine_summary = "Лечит общие физические травмы.",
    craftable_burnMedicine = "Лекарство от ожогов",
    craftable_burnMedicine_plural = "Сжечь лекарство",
    craftable_burnMedicine_summary = "Лечит ожоги",
    craftable_foodPoisoningMedicine = "Лекарство от отравления",
    craftable_foodPoisoningMedicine_plural = "Лекарство от отравления",
    craftable_foodPoisoningMedicine_summary = "Лечит проблемы с желудком, вызванные пищевым отравлением.",
    craftable_virusMedicine = "Вирусная медицина",
    craftable_virusMedicine_plural = "Вирусное лекарство",
    craftable_virusMedicine_summary = "Лечит простуду и вирусные инфекции.",
    --0.3.0 group end
    
    craftable_bronzeIngot = "Бронзовый слиток", --0.4
    craftable_bronzeIngot_plural = "Бронзовые слитки", --0,4
    craftable_bronzeIngot_summary = "Используется для изготовления более прочных инструментов и оружия", --0.4
    craftable_stoneTileSoft = "Каменная плитка (мягкая)", --0.4
    craftable_stoneTileSoft_plural = "Каменные плитки (мягкие)", --0.4
    craftable_stoneTileSoft_summary = "Измельчайте известняк или песчаник в плитки для крыш, полов и дорожек.", --0.4
    craftable_stoneTileHard = "Каменная плитка (твердая)", --0.4
    craftable_stoneTileHard_plural = "Каменные плитки (твердые)", --0,4
    craftable_stoneTileHard_summary = "Измельчайте твердые породы, гранит или мрамор в плитки для крыш, полов и дорожек.", --0.4

    --actions
    action_idle = "В режиме ожидания",
    action_idle_inProgress = "В режиме ожидания",
    action_gather = "Собрать",
    action_gather_inProgress = "Сбор",
    action_chop = "Срубить",
    action_chop_inProgress = "Измельчение",
    action_pullOut = "Вырвать",
    action_pullOut_inProgress = "Вытягивание",
    action_dig = "Копать",
    action_dig_inProgress = "Копка",
    action_mine = "Мой",
    action_mine_inProgress = "Майнинг",
    action_clear = "Расчистить",
    action_clear_inProgress = "Очистка",
    action_moveTo = "Переместить",
    action_moveTo_inProgress = "Переезд",
    action_flee = "Бежать",
    action_flee_inProgress = "Бег",
    action_pickup = "Поднять",
    action_pickup_inProgress = "Подбор",
    action_place = "Разместить",
    action_place_inProgress = "Размещение",
    action_eat = "Ешь",
    action_eat_inProgress = "Есть",
    action_playFlute = "Играть",
    action_playFlute_inProgress = "Играет",
    action_playDrum = "Играть",
    action_playDrum_inProgress = "Воспроизведение",
    action_playБалафон = "Играть",
    action_playBalafon_inProgress = "Играет",
    action_wave = "Волна",
    action_wave_inProgress = "Размахивание",
    action_turn = "Повернуть",
    action_turn_inProgress = "Поворот",
    action_fall = "Падение",
    action_fall_inProgress = "Падение",
    action_sleep = "Сон",
    action_sleep_inProgress = "Уставший",
    action_build = "Строить",
    action_build_inProgress = "Строительство",
    action_light = "Зажечь",
    action_light_inProgress = "Поджиг",
    action_extinguish = "Потушить",
    action_extinguish_inProgress = "Тушение",
    action_destroyContents = "Уничтожить содержимое",
    action_destroyContents_inProgress = "Уничтожение содержимого",
    action_throwProjectile = "Бросок",
    action_throwProjectile_inProgress = "Бросок",
    action_butcher = "Мясник",
    action_butcher_inProgress = "Разделать",
    action_knap = "Похлопать",
    action_knap_inProgress = "Расщепление",
    action_grind = "Помолоть",
    action_grind_inProgress = "Помол",
    action_potteryCraft = "Создать",
    action_potteryCraft_inProgress = "Создание",
    action_craft = "Создать", --0.3.0
    action_craft_inProgress = "Создание", --0.3.0
    action_spinCraft = "Создать",
    action_spinCraft_inProgress = "Создание",
    action_thresh = "Обмолот",
    action_thresh_inProgress = "Молотба",
    action_scrapeWood = "Создать",
    action_scrapeWood_inProgress = "Создание",
    action_fireStickCook = "Готовить",
    action_fireStickCook_inProgress = "Готовим",
    action_recruit = "Нанять",
    action_recruit_inProgress = "Вербовка",
    action_sneak = "Подкрасться",
    action_sneak_inProgress = "Подкрадывается",
    action_sit = "Сидеть",
    action_sit_inProgress = "Сидя",
    action_inspect = "Проверить",
    action_inspect_inProgress = "Проверка",
    action_patDown = "аккуратно",
    action_patDown_inProgress = "Уборка",
    action_takeOffTorsoClothing = "Снять одежду",
    action_takeOffTorsoClothing_inProgress = "Снятие одежды",
    action_putOnTorsoClothing = "Наденьте одежду",
    action_putOnTorsoClothing_inProgress = "Надевание одежды",

    
    --0.3.0 group:
    action_selfApplyOralMedicine = "Принимать лекарства",
    action_selfApplyOralMedicine_inProgress = "Прием лекарств",
    action_selfApplyTopicalMedicine = "Применить лекарство",
    action_selfApplyTopicalMedicine_inProgress = "Применение лекарств",
    action_giveMedicine = "Дать лекарство",
    action_giveMedicine_inProgress = "Раздача лекарств",
    --0.3.0 group end
    
    action_smithHammer = "Кузнец", --0.4
    action_smithHammer_inProgress = "Кузнечное Дело", --0.4
    action_chiselStone = "Долото", --0.4
    action_chiselStone_inProgress = "Долбление", --0.4

    --action modifiers
    action_jog = "Пробежка",
    action_jog_inProgress = "Бег",
    action_run = "Выполнить",
    action_run_inProgress = "Выполняется",
    action_slowWalk = "Медленная ходьба",
    action_slowWalk_inProgress = "Медленная ходьба",
    action_sadWalk = "Грустная прогулка",
    action_sadWalk_inProgress = "Печально ходить",
    action_crouch = "Присесть",
    action_crouch_inProgress = "Приседание",

    -- terrain types
    Terrain_rock = "Камень",
    Terrain_limestone = "Известняк",
    Terrain_redRock = "Красная скала",
    Terrain_greenRock = "Нифрит",
    Terrain_graniteRock = "Гранит", --0.4
    Terrain_marbleRock = "Мрамор", --0.4
    Terrain_lapisRock = "Лазурит", --0,4
    Terrain_beachSand = "Песок",
    Terrain_riverSand = "Речной Песок",
    Terrain_desertSand = "Песок",
    Terrain_ice = "Лед",
    Terrain_desertRedSand = "Красный Песок",
    Terrain_dirt = "Почва",
    Terrain_richDirt = "Плодородная Почва",
    Terrain_poorDirt = "Бедная Почва",
    Terrain_clay = "Глина",
    Terrain_copperOre = "Медная руда", --0.4
    Terrain_tinOre = "Руда олова", --0.4
    Terrain_sandstoneYellowRock = "Песчаник (желтый)", --0.4
    Terrain_sandstoneRedRock = "Песчаник (красный)", --0.4
    Terrain_sandstoneOrangeRock = "Песчаник (оранжевый)", --0.4
    Terrain_sandstoneBlueRock = "Песчаник (синий)", --0.4

    -- terrain variations
    TerrainVariations_snow = "Снег",
    TerrainVariations_grassSnow = "Трава/Снег",
    TerrainVariations_grass = "Трава",
    TerrainVariations_flint = "Кремень",
    TerrainVariations_clay = "Глина",
    TerrainVariations_copperOre = "Медная руда", --0.4
    TerrainVariations_tinOre = "Руда олова", --0.4
    TerrainVariations_limestone = "Известняк",
    TerrainVariations_redRock = "Красная скала",
    TerrainVariations_greenRock = "Нифрит",
    TerrainVariations_graniteRock = "Гранит", --0.4
    TerrainVariations_marbleRock = "Мрамор", --0.4
    TerrainVariations_lapisRock = "Лазурит", --0,4
    TerrainVariations_shallowWater = "Мелководье",
    TerrainVariations_deepWater = "Глубокая Вода",
    TerrainVariations_sandstoneYellowRock = "Песчаник (желтый)", --0.4
    TerrainVariations_sandstoneRedRock = "Песчаник (красный)", --0.4
    TerrainVariations_sandstoneOrangeRock = "Песчаник (оранжевый)", --0.4
    TerrainVariations_sandstoneBlueRock = "Песчаник (синий)", --0.4

    -- needs
    need_sleep = "Сон",
    need_warmth = "Замерз",
    need_food = "Голод",
    need_rest = "Отдых",
    --need_starvation = "Голодает", --deprecated 0.3.0
    need_exhaustion = "Уставший",
    need_music = "Музыка",

    --flora
    flora_willow = "Ивовое дерево",
    flora_willow_plural = "Ивовые деревья",
    flora_willow_summary = "Встречается возле рек, ивы дают прочную, но скрученную древесину",
    flora_willow_sapling = "Саженец ивы",
    flora_willow_sapling_plural = "Саженцы ивы",
    flora_beetrootPlant = "Свекла",
    flora_beetrootPlant_plural = "Свеклу",
    flora_beetrootPlant_summary = "Вкусный выносливый корнеплод.",
    flora_beetrootPlantSapling = "Свекольный саженец",
    flora_beetrootPlantSapling_plural = "Свекольная рассада",
    flora_wheatPlant = "Пшеница",
    flora_wheatPlant_plural = "Пшеница",
    flora_wheatPlant_summary = "Пшеницу можно обмолотить, а затем смолоть в муку для выпечки хлеба",
    flora_wheatPlantSapling = "Росток пшеницы",
    flora_wheatPlantSapling_plural = "Ростки пшеницы",
    flora_flaxPlant = "Лен",
    flora_flaxPlant_plural = "Лен",
    flora_flaxPlant_summary = "Универсальное растение, волокна льна можно прясть в шпагат, а семена можно есть для получения небольшого количества калорий",
    flora_flaxPlantSapling = "Саженец льна",
    flora_flaxPlantSapling_plural = "Саженцы льна",
    flora_poppyPlant = "Мак", --0.3.0
    flora_poppyPlant_plural = "Мак", --0.3.0
    flora_poppyPlant_summary = "Цветок мака не только приятен на вид, но и используется в медицине.", --0.3.0
    flora_poppyPlantSapling = "Саженец мака", --0.3.0
    flora_poppyPlantSapling_plural = "Саженцы мака", --0.3.0
    flora_echinaceaPlant = "Эхинацея", --0.3.0
    flora_echinaceaPlant_plural = "Эхинацея", --0.3.0
    flora_echinaceaPlant_summary = "Цветы эхинацеи используются в медицинских целях.", --0.3.0
    flora_echinaceaPlantSapling = "Саженец эхинацеи", --0.3.0
    flora_echinaceaPlantSapling_plural = "Саженцы эхинацеи", --0.3.0
    flora_gingerPlant = "Имбирь", --0.3.0
    flora_gingerPlant_plural = "Имбирь", --0.3.0
    flora_gingerPlant_summary = "Корни имбиря помогают успокоить расстройство желудка.", --0.3.0
    flora_gingerPlantSapling = "Саженец имбиря", --0.3.0
    flora_gingerPlantSapling_plural = "Саженцы имбиря", --0.3.0
    flora_turmericPlant = "Куркума", --0.3.0
    flora_turmericPlant_plural = "Куркума", --0.3.0
    flora_turmericPlant_summary = "Турмерик может помочь при воспалении.", --0.3.0
    flora_turmericPlantSapling = "Саженец куркумы", --0.3.0
    flora_turmericPlantSapling_plural = "Саженцы куркумы", --0.3.0
    flora_marigoldPlant = "Календула", --0.3.0
    flora_marigoldPlant_plural = "Календулу", --0.3.0
    flora_marigoldPlant_summary = "Из ноготков можно сделать припарку для лечения ран.", --0.3.0
    flora_marigoldPlantSapling = "Саженец ноготков", --0.3.0
    flora_marigoldPlantSapling_plural = "Саженцы ноготков", --0.3.0
    flora_garlicPlant = "Чеснок", --0.3.0
    flora_garlicPlant_plural = "Чеснок", --0.3.0
    flora_garlicPlant_summary = "Чеснок можно есть или использовать в медицине.", --0.3.0
    flora_garlicPlantSapling = "Саженец чеснока", --0.3.0
    flora_garlicPlantSapling_plural = "Саженцы чеснока", --0.3.0
    flora_aloePlant = "Алоэ", --0.3.0
    flora_aloePlant_plural = "Алоэ", --0.3.0
    flora_aloePlant_summary = "Листья алоэ помогают смягчить ожоги.", --0.3.0
    flora_aloePlantSapling = "Саженец алоэ", --0.3.0
    flora_aloePlantSapling_plural = "Саженцы алоэ", --0.3.0
    flora_aspen = "Осина",
    flora_pineBig_plural = "Высокие сосны",
    flora_pineBig_summary = "Высокие сосны встречаются редко, растут долго и дают семена только раз в десять лет, но при рубке дают большое количество древесины",
    flora_pineBig_sapling = "Саженец высокой сосны",
    flora_pineBig_sapling_plural = "Саженцы высокой сосны",
    flora_aspenBig = "Высокое осиновое дерево",
    flora_aspenBig_plural = "Высокие осиновые деревья",
    flora_aspenBig_summary = "Высокие осины встречаются редко, растут долго и дают семена только раз в десять лет, но при рубке дают большое количество древесины",
    flora_aspenBig_sapling = "Саженец осины высокой",
    flora_aspenBig_sapling_plural = "Саженцы высокой осины",
    flora_appleTree = "Яблоня",
    flora_appleTree_plural = "Яблони",
    flora_appleTree_summary = "Компактное листопадное дерево, плодоносящее с конца лета до осени",
    flora_appleTree_sapling = "Саженец яблони",
    flora_appleTree_sapling_plural = "Саженцы яблони",
    flora_elderberryTree = "Куст Бузины", --0.3.0
    flora_elderberryTree_plural = "Деревья бузины", --0.3.0
    flora_elderberryTree_summary = "Небольшое кустарниковое дерево с ягодами, которые используются в медицинских целях.", --0.3.0
    flora_elderberryTree_sapling = "Саженец бузины", --0.3.0
    flora_elderberryTree_sapling_plural = "Саженцы бузины", --0.3.0
    flora_gooseberryBush = "Крыжовник",
    flora_gooseberryBush_plural = "Кусты крыжовника",
    flora_gooseberryBush_summary = "Дает сочные плоды, богатые витамином С. Собирается летом",
    flora_pumpkinPlant = "Тыква",
    flora_pumpkinPlant_plural = "Тыквенные растения",
    flora_pumpkinPlant_summary = "Тыквы долго хранятся, хорошо едятся и могут быть полезны для других целей",
    flora_peachTree = "Персик",
    flora_peachTree_plural = "Персиковые деревья",
    flora_peachTree_summary = "Дает сочные косточковые плоды, готовые к употреблению летом",
    flora_peachTree_sapling = "Саженец персика",
    flora_peachTree_sapling_plural = "Саженцы персика",
    flora_bananaTree = "Банановая Пальма",
    flora_bananaTree_plural = "Банановые деревья",
    flora_bananaTree_summary = "Банановые деревья на самом деле вовсе не деревья, а травы, а плоды - это ягоды. Длинные желтые ягоды",
    flora_bananaTree_sapling = "Саженец банана",
    flora_bananaTree_sapling_plural = "Саженцы банана",
    flora_coconutTree = "Кокосовая Пальма",
    flora_coconutTree_plural = "Кокосовые деревья",
    flora_coconutTree_summary = "Кокосовые деревья дают крупные и питательные плоды, а также уникальную древесину. Падение кокосовых орехов убивает 150 человек каждый год",
    flora_coconutTree_sapling = "Саженец кокосового ореха",
    flora_coconutTree_sapling_plural = "Кокосовые саженцы",
    flora_raspberryBush = "Куст малины",
    flora_raspberryBush_plural = "Кусты малины",
    flora_raspberryBush_summary = "Малина богата витамином С и обладает ярким вкусом. Собирается осенью",
    flora_shrub = "Куст",
    flora_shrub_plural = "Куст",
    flora_shrub_summary = "Куст",
    flora_orangeTree = "Апельсиновое Дерево",
    flora_orangeTree_plural = "Апельсиновые деревья",
    flora_orangeTree_summary = "Апельсиновые деревья выносливы и часто дают столь необходимый урожай в конце зимы",
    flora_orangeTree_sapling = "Саженец апельсина",
    flora_orangeTree_sapling_plural = "Апельсиновые саженцы",
    flora_cactus = "Кактус",
    flora_cactus_plural = "Кактусы",
    flora_cactus_summary = "Кактус",
    flora_cactus_sapling = "Саженец кактуса",
    flora_cactus_sapling_plural = "Саженцы кактусов",
    flora_sunflower = "Подсолнух",
    flora_sunflower_plural = "Подсолнух",
    flora_sunflower_summary = "Подсолнухи скрашивают пейзаж, а семена дают небольшое количество калорий",
    flora_sunflowerSapling = "Саженец подсолнечника",
    flora_sunflowerSapling_plural = "Саженцы подсолнечника",
    flora_flower1 = "Цветок",
    flora_flower1_plural = "Цветы",
    flora_flower1_summary = "Цветок",

    -- branches
    branch_birch = "Березовая ветка",
    branch_birch_plural = "Березовые ветки",
    branch_pine = "Ветка сосны",
    branch_pine_plural = "Сосновые ветви",
    branch_aspen = "Ветка осины",
    branch_aspen_plural = "Ветви осины",
    branch_bamboo = "Бамбук",
    branch_bamboo_plural = "Бамбук",
    branch_willow = "Ветка ивы",
    branch_willow_plural = "Ветви ивы",
    branch_apple = "Ветка яблони",
    branch_apple_plural = "Ветви яблони",
    branch_elderberry = "Ветка бузины", --0.3.0
    branch_elderberry_plural = "Ветви бузины", --0.3.0
    branch_orange = "Ветка апельсина",
    branch_orange_plural = "Ветви апельсина",
    branch_peach = "Ветка персика",
    branch_peach_plural = "Ветви персика",

    -- logs
    log_birch = "Березовое бревно",
    log_birch_plural = "Березовые бревна",
    log_willow = "Ивовое бревно",
    log_willow_plural = "Ивовые поленья",
    log_apple = "Яблочное бревно",
    log_apple_plural = "Яблоневые бревна",
    log_elderberry = "Бревно бузины", --0.3.0
    log_elderberry_plural = "Бревна бузины", --0.3.0
    log_orange = "Апельсиновое бревно",
    log_orange_plural = "Апельсиновые поленья",
    log_peach = "Персиковое бревно",
    log_peach_plural = "Персиковые бревна",
    log_pine = "Сосновое бревно",
    log_pine_plural = "Сосновые поленья",
    log_aspen = "Осиновое бревно",
    log_aspen_plural = "Осиновые бревна",
    log_coconut = "Кокосовое бревно",
    log_coconut_plural = "Кокосовые бревна",

    --fruits/seeds
    fruit_orange = "Апельсин",
    fruit_orange_plural = "Апельсины",
    fruit_orange_rotten = "Гнилые апельсины",
    fruit_orange_rotten_plural = "Гнилые апельсины",
    fruit_apple = "Яблоко",
    fruit_apple_plural = "Яблоки",
    fruit_apple_rotten = "Гнилое яблоко",
    fruit_apple_rotten_plural = "Гнилые яблоки",
    fruit_elderberry = "Бузина", --0.3.0
    fruit_elderberry_plural = "Ягоды Бузины", --0.3.0
    fruit_elderberry_rotten = "Гнилая бузина", --0.3.0
    fruit_elderberry_rotten_plural = "Гнилая бузина", --0.3.0
    fruit_banana = "Банан",
    fruit_banana_plural = "Бананы",
    fruit_banana_rotten = "Гнилой Банан",
    fruit_banana_rotten_plural = "Гнилые Бананы",
    fruit_coconut = "Кокос",
    fruit_coconut_plural = "Кокосы",
    fruit_coconut_rotten = "Гнилой кокос",
    fruit_coconut_rotten_plural = "Гнилые кокосы",
    fruit_pineCone = "Сосновая шишка",
    fruit_pineCone_plural = "Сосновые Шишки",
    fruit_pineCone_rotten = "Гнилая сосновая шишка",
    fruit_pineCone_rotten_plural = "Гнилые сосновые шишки",
    fruit_pineConeBig = "Большая сосновая шишка",
    fruit_pineConeBig_plural = "Большие сосновые шишки",
    fruit_pineConeBig_rotten = "Гнилая большая сосновая шишка",
    fruit_pineConeBig_rotten_plural = "Гнилые крупные сосновые шишки",
    fruit_aspenBigSeed = "Высокое семя осины",
    fruit_aspenBigSeed_plural = "Семена осины высокой",
    fruit_aspenBigSeed_rotten = "Гнилые семена осины",
    fruit_aspenBigSeed_rotten_plural = "Гнилые семена высокой осины",
    fruit_beetroot = "Свекла",
    fruit_beetroot_plural = "Свеклу",
    fruit_beetroot_rotten = "Гнилая свекла",
    fruit_beetroot_rotten_plural = "Гнилая свекла",
    fruit_beetrootSeed = "Свекольное семя",
    fruit_beetrootSeed_plural = "Семена свеклы",
    fruit_beetrootSeed_rotten = "Гнилые семена свеклы",
    fruit_beetrootSeed_rotten_plural = "Гнилые семена свеклы",
    fruit_wheat = "Пшеница",
    fruit_wheat_plural = "Пшеница",
    fruit_wheat_rotten = "Гнилая пшеница",
    fruit_wheat_rotten_plural = "Гнилая пшеница",
    fruit_flax = "Сырой Лен",
    fruit_flax_plural = "Сырой Лен",
    fruit_flax_rotten = "Гнилой лен",
    fruit_flax_rotten_plural = "Гнилой лен",
    fruit_flaxSeed = "Льняное семя",
    fruit_flaxSeed_plural = "Семена льна",
    fruit_flaxSeed_rotten = "Гнилое льняное семя",
    fruit_flaxSeed_rotten_plural = "Гнилые семена льна",
    fruit_poppyFlower = "Цветок мака", --0.3.0
    fruit_poppyFlower_plural = "Цветы мака", --0.3.0
    fruit_poppyFlower_rotten = "Гнилой цветок мака", --0.3.0
    fruit_poppyFlower_rotten_plural = "Гнилые цветы мака", --0.3.0
    fruit_echinaceaFlower = "Цветок Эхинацеи", --0.3.0
    fruit_echinaceaFlower_plural = "Цветы эхинацеи", --0.3.0
    fruit_echinaceaFlower_rotten = "Гнилой цветок эхинацеи", --0.3.0
    fruit_echinaceaFlower_rotten_plural = "Гнилые цветы эхинацеи", --0.3.0
    fruit_marigoldFlower = "Цветок ноготков", --0.3.0
    fruit_marigoldFlower_plural = "Цветы ноготков", --0.3.0
    fruit_marigoldFlower_rotten = "Гнилой цветок ноготков", --0.3.0
    fruit_marigoldFlower_rotten_plural = "Гнилые цветы ноготков", --0.3.0
    fruit_gingerRoot = "Корень Имбиря", --0.3.0
    fruit_gingerRoot_plural = "Корни имбиря", --0.3.0
    fruit_gingerRoot_rotten = "Гнилой корень имбиря", --0.3.0
    fruit_gingerRoot_rotten_plural = "Гнилые корни имбиря", --0.3.0
    fruit_turmericRoot = "Корень куркумы", --0.3.0
    fruit_turmericRoot_plural = "Корни Куркумы", --0.3.0
    fruit_turmericRoot_rotten = "Гнилой корень куркумы", --0.3.0
    fruit_turmericRoot_rotten_plural = "Гнилой корень куркумы", --0.3.0
    fruit_garlic = "Чеснок", --0.3.0
    fruit_garlic_plural = "Чеснок", --0.3.0
    fruit_garlic_rotten = "Гнилой чеснок", --0.3.0
    fruit_garlic_rotten_plural = "Гнилой чеснок", --0.3.0
    fruit_aloeLeaf = "Лист алоэ", --0.3.0
    fruit_aloeLeaf_plural = "Листья алоэ", --0.3.0
    fruit_aloeLeaf_rotten = "Гнилой лист алоэ", --0.3.0
    fruit_aloeLeaf_rotten_plural = "Гнилые листья алоэ", --0.3.0
    fruit_sunflowerSeed = "Семена подсолнечника",
    fruit_sunflowerSeed_plural = "Семена подсолнечника",
    fruit_sunflowerSeed_rotten = "Гнилые семена подсолнечника",
    fruit_sunflowerSeed_rotten_plural = "Гнилые семена подсолнечника",
    fruit_peach = "Персик",
    fruit_peach_plural = "Персики",
    fruit_peach_rotten = "Гнилой персик",
    fruit_peach_rotten_plural = "Гнилые персики",
    fruit_raspberry = "Малина",
    fruit_raspberry_plural = "Малина",
    fruit_raspberry_rotten = "Гнилая малина",
    fruit_raspberry_rotten_plural = "Гнилая малина",
    fruit_gooseberry = "Крыжовник",
    fruit_gooseberry_plural = "Крыжовник",
    fruit_gooseberry_rotten = "Гнилой крыжовник",
    fruit_gooseberry_rotten_plural = "Гнилой крыжовник",
    fruit_pumpkin = "Тыква",
    fruit_pumpkin_plural = "Тыквы",
    fruit_pumpkin_rotten = "Гнилая тыква",
    fruit_pumpkin_rotten_plural = "Гнилые тыквы",
    fruit_birchSeed = "Березовые семена",
    fruit_birchSeed_plural = "Березовые семена",
    fruit_birchSeed_rotten = "Гнилые березовые семена",
    fruit_birchSeed_rotten_plural = "гнилые семена березы",
    fruit_aspenSeed = "Семена осины",
    fruit_aspenSeed_plural = "Семена осины",
    fruit_aspenSeed_rotten = "Гнилые семена осины",
    fruit_aspenSeed_rotten_plural = "гнилые семена осины",
    fruit_willowSeed = "Семя ивы",
    fruit_willowSeed_plural = "Семена ивы",
    fruit_willowSeed_rotten = "Гнилые семена ивы",
    fruit_willowSeed_rotten_plural = "Гнилые семена ивы",
    fruit_bambooSeed = "Семя бамбука",
    fruit_bambooSeed_plural = "Семена бамбука",
    fruit_bambooSeed_rotten = "Гнилое бамбуковое семя",
    fruit_bambooSeed_rotten_plural = "Гнилые семена бамбука",

    -- tool groups
    toolGroup_weapon = "Оружие",
    toolGroup_weapon_plural = "Оружие",
    
    -- tools
    tool_treeChop = "Рубящий инструмент",
    tool_treeChop_plural = "Рубящие инструменты",
    tool_treeChop_usage = "Рубить",
    tool_dig = "Инструмент для копания",
    tool_dig_plural = "Инструменты для копания",
    tool_dig_usage = "Копка",
    tool_mine = "Горный инструмент",
    tool_mine_plural = "Горные инструменты",
    tool_mine_usage = "Добыча",
    tool_weaponBasic = "Основное оружие",
    tool_weaponBasic_plural = "Основное оружие",
    tool_weaponBasic_usage = "Оружие (базовое)",
    tool_weaponSpear = "Копье",
    tool_weaponSpear_plural = "Копья",
    tool_weaponSpear_usage = "Оружие (копье)",
    tool_weaponKnife = "Нож",
    tool_weaponKnife_plural = "Ножи",
    tool_weaponKnife_usage = "Оружие (Нож)",
    tool_butcher = "Разделочный Инструмент",
    tool_butcher_plural = "Разделочные Инструменты",
    tool_butcher_usage = "Разделать",
    tool_knapping = "Разделочный инструмент",
    tool_knapping_plural = "Орудия для оббивки",
    tool_knapping_usage = "Кнаппинг",
    tool_carving = "Резьбовой инструмент",
    tool_carving_plural = "Инструменты для резьбы",
    tool_carving_usage = "Резьба",
    tool_grinding = "Шлифовальный инструмент",
    tool_grinding_plural = "Шлифовальные инструменты",
    tool_grinding_usage = "Шлифование",


    tool_knappingCrude = "Орудия грубой обработки почвы", --b20
    tool_knappingCrude_plural = "Инструменты для грубого кнаппинга", --b20
    tool_knappingCrude_usage = "Орудия грубого обжига", --b20


    tool_crucible = "Крусибл", --0.4
    tool_crucible_plural = "Крусиблы", --0.4
    tool_crucible_usage = "Крусибл", --0.4
    tool_hammering = "Молоток", --0.4
    tool_hammering_plural = "Молотки", --0.4
    tool_hammering_usage = "Молоток", --0.4
    tool_softChiselling = "Долото (М)", --0.4
    tool_softChiselling_plural = "Долото (М)", --0.4
    tool_softChiselling_usage = "Долото (мягкая скалка)", --0.4
    tool_hardChiselling = "Долото (твердая порода)", --0.4
    tool_hardChiselling_plural = "Зубило (твердая порода)", --0.4
    tool_hardChiselling_usage = "Долото (твердая порода)", --0.4
    
    
    --tool properties
    toolProperties_damage = "Урон",
    toolProperties_speed = "Скорость",
    toolProperties_durability = "Прочность",

    -- tool usages
    tool_usage_new = "Новый",
    tool_usage_used = "Использованный",
    tool_usage_wellUsed = "Хорошо использовался",
    tool_usage_nearlyBroken = "Почти сломан",

    -- plans
    plan_build = "Строить",
    plan_build_inProgress = "Строительство",
    plan_plant = "Сажать",
    plan_plant_inProgress = "Посев",
    plan_dig = "Копать",
    plan_dig_inProgress = "Копка",
    plan_mine = "Шахта",
    plan_mine_inProgress = "Добыча",
    plan_clear = "Расчистить",
    plan_clear_inProgress = "Расчистка",
    plan_fill = "Заполнение",
    plan_fill_inProgress = "Заполнение",
    plan_chop = "Срубить",
    plan_chop_inProgress = "Рубить",
    plan_storeObject = "Магазин",
    plan_storeObject_inProgress = "Хранение",
    plan_transferObject = "Передача",
    plan_transferObject_inProgress = "Передача",
    plan_destroyContents = "Уничтожить содержимое",
    plan_destroyContents_inProgress = "Уничтожить содержимое",
    plan_pullOut = "Вырвать",
    plan_pullOut_inProgress = "Вытащить",
    plan_removeObject = "Удалить",
    plan_removeObject_inProgress = "Удалить",
    plan_gather = "Собрать",
    plan_gather_inProgress = "Собрать",
    plan_moveTo = "Переместить",
    plan_moveTo_inProgress = "Перемещение",
    plan_wait = "Ждать здесь",
    plan_wait_inProgress = "Ждать",
    plan_moveAndWait = "Двигаться и ждать",
    plan_moveAndWait_inProgress = "Двигаться и ждать",
    plan_light = "Зажечь",
    plan_light_inProgress = "Поджиг",
    plan_extinguish = "Потушить",
    plan_extinguish_inProgress = "Потушить",
    plan_hunt = "Охотиться",
    plan_hunt_inProgress = "Охотиться",
    plan_craft = "Создать",
    plan_craft_inProgress = "Крафтинг",
    plan_recruit = "Рекрут",
    plan_recruit_inProgress = "Вербовка",
    plan_deconstruct = "Удалить",
    plan_deconstruct_inProgress = "Удалить",
    plan_manageStorage = "Управлять хранилищем",
    plan_manageStorage_inProgress = "Управление хранилищем",
    plan_manageSapien = "Управлять Сапиеном",
    plan_manageSapien_inProgress = "Управление Сапиеном",
    plan_addFuel = "Добавить Топливо",
    plan_addFuel_inProgress = "Добавление топлива",
    plan_buildPath = "Путь строительства",
    plan_buildPath_inProgress = "Путь строительства",
    plan_research = researchName,
    plan_research_inProgress = researchingName,
    plan_constructWith = "Использовать",
    plan_constructWith_inProgress = "Использование",
    plan_allowUse = "Разрешить использование",
    plan_allowUse_inProgress = "Разрешить использование",
    plan_stop = "Остановить",
    plan_stop_inProgress = "Остановка",
    plan_butcher = "Мясник",
    plan_butcher_inProgress = "Разделать",
    plan_clone = "Строить",
    plan_clone_inProgress = "Строить",
    plan_playInstrument = "Играть",
    plan_playInstrument_inProgress = "Играть",
    plan_rebuild = "Перестраивать", --0.4
    plan_rebuild_inProgress = "Перестройка", --0.4
    plan_rebuild_title = function(values)
        return values.rebuildText .. " " .. values.objectName
    end,

    plan_treatInjury = "Лечение травмы", --0.3.0 
    plan_treatInjury_inProgress = "Лечить травму", --0.3.0 
    plan_treatBurn = "Лечить ожог", --0.3.0 
    plan_treatBurn_inProgress = "Лечение ожога", --0.3.0 
    plan_treatFoodPoisoning = "Лечить пищевое отравление", --0.3.0 
    plan_treatFoodPoisoning_inProgress = "Лечение пищевого отравления", --0.3.0 
    plan_treatVirus = "Лечить вирус", --0.3.0 
    plan_treatVirus_inProgress = "Лечить вирус", --0.3.0

    plan_fertilize = "Мульчирование", --0.4
    plan_fertilize_inProgress = "Мульчирование", --0.4
    plan_deliverToCompost = "Компост", --0.4
    plan_deliverToCompost_inProgress = "Компостирование", --0.4
    plan_chiselStone = "Долото", --0.4
    plan_chiselStone_inProgress = "Долото", --0.4

    --research    
    research_fire_description = "Ваше племя обнаружило, что тепло выделяется в результате трения при трении двух палок друг о друга. Если палка достаточно нагреется, может образоваться уголек, который разжигает костер, давая тепло и свет",
    research_thatchBuilding_description = "Ваше племя обнаружило, что если высушенную растительность выстроить в ряд и разместить над опорной конструкцией, то можно получить водонепроницаемое укрытие.",
    research_mudBrickBuilding_description = "Ваше племя обнаружило, что сложенные блоки или кирпичи могут создавать прочные конструкции.", --0.4 изменено, теперь применяется ко всем кирпичным/блочным постройкам.
    research_brickBuilding_description = "Теперь, когда ваше племя выяснило, как скреплять обожженные кирпичи вместе, у них появилась новая декоративная альтернатива глиняным кирпичам для строительства стен.", --deprecated (0.4)
    research_woodBuilding_description = "Расщепляя бревна с помощью простых инструментов, ваше племя нашло новый строительный материал. Сооружения, построенные из дерева, прочнее и устойчивее к погодным условиям.",
    research_rockKnapping_description = "Используя один камень для удара о другой, ваше племя обнаружило, что края можно заострить, и сделать несколько очень полезных инструментов.",
    research_flintKnapping_description = "Найдя новый вид камня, ваше племя попробовало обтесать его, чтобы создать новый более острый край. Этот новый материал также более прочный.",
    research_pottery_description = "Ваше племя обнаружило, что некоторые виды земли можно спрессовывать в формы, когда они мягкие и влажные, и они сохраняют свою форму, когда высыхают и затвердевают. Это будет полезно для хранения определенных ресурсов",
    research_potteryFiring_description = "Ваше племя заметило, что глина затвердевает при нагревании на огне. С помощью специально построенного корпуса из глиняного кирпича и еще более жаркого огня они теперь могут делать гончарные изделия, более устойчивые к воде, и лучше сохранять их содержимое.",
    research_spinning_description = "Теперь ваше племя может создавать бечевки и веревки, сплетая вместе растительные волокна. Это будет особенно полезно для скрепления вещей и изготовления сложных инструментов.",
    research_digging_description = "С новыми знаниями об обтесывании камней можно будет использовать ручные топоры, чтобы легче снимать верхний слой почвы, переносить его в другое место и открывать то, что находится под ним.",
    research_mining_description = "Добавив рукоятку к простому каменному инструменту, можно создать силу, достаточную для раскалывания твердых поверхностей, и ваше племя обнаружило, что теперь можно добывать камни",
    research_chiselStone_description = "Ваше племя обнаружило, что долото можно использовать для вырезания блоков прямо из камня. Каменные блоки можно использовать для строительства прочных сооружений, а можно высекать их снова для создания плитки.", --0.4
    research_planting_description = "Наблюдая за семенами и растениями, ваше племя обнаружило, как контролировать места произрастания. Это облегчит контроль за поставками продовольствия и даст новые возможности для декора",
    research_mulching_description = "Ваше племя обнаружило, что почву можно улучшить, добавив слой перегнившего органического материала. С более богатой почвой растения и деревья растут быстрее и дают обильные урожаи.", --0.4
    research_threshing_description = "Семена некоторых трав обладают питательной ценностью, и ваше племя открыло способ их более легкого извлечения",
    research_treeFelling_description = "При достаточном количестве ударов ручным топором можно свалить даже самые могучие деревья. Это даст деревянные поленья, которые будут гореть в кострах гораздо дольше, но, возможно, есть и другие применения",
    research_basicHunting_description = "Ваше племя нашло способ охотиться и убивать мелкую добычу, которая может стать ценным ресурсом и потенциально пищей, если ее подготовить и приготовить.",
    research_spearHunting_description = "После экспериментов с различными снарядами ваше племя обнаружило, что, сочетая остроту обточенного клинка с устойчивостью в полете прямой палки, оно может охотиться гораздо успешнее и охотиться на более крупную добычу",
    research_butchery_description = "Теперь у вашего племени есть возможность отделять ценные ресурсы, содержащиеся в туше животного. Теперь они могут получать сырое мясо, хотя вы можете попросить их пока не есть его.",
    research_woodWorking_description = "Ваше племя обнаружило, что, соскабливая слои с веток и бревен, можно изготовить множество полезных инструментов и строительных материалов.",
    research_boneCarving_description = "Ваше племя обнаружило, что костям можно придавать форму с помощью ножа, чтобы создавать острые лезвия или даже издавать музыкальные звуки.",
    research_flutePlaying_description = "Ваше племя узнало, как создавать музыку. Музыка помогает объединить ваше племя, повышая лояльность и счастье тех, кто рядом",
    research_campfireCooking_description = "После минуты вдохновения ваше племя обнаружило, что, нагревая сырые ингредиенты в огне, их можно сделать вкуснее и легче есть",
    research_baking_description = "Наконец-то после долгих экспериментов ваше племя может приготовить вкусную и сытную еду, используя обильные зерна, растущие вокруг них.",
    research_toolAssembly_description = "Заостренный камень можно использовать с большей силой, если прикрепить его к деревянной ручке. Теперь ваше племя может изготавливать лучшие инструменты и более грозное оружие.",
    research_medicine_description = "Измельчив травы, корни и цветы, ваше племя обнаружило, что можно делать припарки и лекарства. Эти смеси могут помочь при ранениях и болезнях.", --0.3.0
    research_grinding_description = "Измельчение предметов может быть очень полезным, в частности, для того, чтобы открыть ценные калории, скрытые в семенах и зернах. Ваше племя обнаружило, что камень-курган значительно облегчает задачу измельчения", --modified b13
    research_tiling_description = "Ваше племя открыло новый метод строительства с использованием тонко нарезанных блоков из камня или керамики. Плитка может быть использована для строительства высококачественной кровли, полов и дорожек.", --0.4 modified
    research_unlock_butcherMammoth = "Мясной мамонт",

    research_composting_name = "Компостирование", --0.4 - название обычно берется из навыка, поэтому типы исследований, не имеющие связанного навыка, должны иметь название.
    research_composting_description = "Гниющую органическую материю можно сложить в кучу и оставить, чтобы она превратилась в компост, который затем можно использовать для обогащения почвы.", --0.4
    research_blacksmithing_description = "Нагревая и соединяя определенные виды горных пород при высоких температурах, ваше племя открыло способ получения и использования бронзы. Бронзовые инструменты служат намного дольше и могут быть использованы для изготовления совершенно новых категорий инструментов.", --0.4

    -- paths
    path_dirt = "Почвенная тропа",
    path_dirt_plural = "Почвенные тропы",
    path_sand = "Песчаная тропа",
    path_sand_plural = "Песчаные тропы",
    path_rock = "Путь скалы",
    path_rock_plural = "Пути скал",
    path_clay = "Путь глины",
    path_clay_plural = "Глиняные тропинки",
    path_tile = "Путь плитки",
    path_tile_plural = "Тропинки из плитки",

    -- other objects
    object_campfire = "Костер",
    object_campfire_plural = "Костры",
    object_brickKiln = "Печь для обжига",
    object_brickKiln_plural = "Печи для обжига",
    object_torch = "Факел",
    object_torch_plural = "Факелы",
    object_alpacaMeatRack = "Сырое мясо альпаки", --0.3.0 добавлено "Сырое"
    object_alpacaMeatRack_plural = "Сырое мясо альпаки", --0.3.0 добавлено "Сырое"
    object_alpacaMeatRackCooked = "Приготовленное мясо альпаки",
    object_alpacaMeatRackCooked_plural = "Приготовленное мясо альпаки",
    object_dirtWallDoor = "Грунтовая стена с дверью",
    object_dirtWallDoor_plural = "Грунтовая стена с дверью",
    object_build_storageArea = "Зона для Хранения",
    object_build_storageArea_plural = "Зоны для Хранения",
    object_build_compostBin = "Компостная яма", --0.4
    object_build_compostBin_plural = "Компостные ямы", --0.4
    object_aspenSplitLog = "Журнал разделения осины",
    object_aspenSplitLog_plural = "Осиновое сращенное бревно",
    object_dirtRoof = "Грунтовая крыша",
    object_dirtRoof_plural = "Грунтовые крыши",
    object_plan_move = "Переезд",
    object_plan_plan_move_plural = "Перемещение",
    object_deadAlpaca = "Туша альпаки",
    object_deadAlpaca_plural = "Туша альпаки",
    object_deadMammoth = "Туша мамонта",
    object_deadMammoth_plural = "Туши мамонтов",
    object_chickenMeatBreastCooked = "Приготовленное куриное мясо",
    object_chickenMeatBreastCooked_plural = "Приготовленное куриное мясо",
    object_build_dirtWall = "Грунтовая стена",
    object_build_dirtWall_plural = "Грунтовые стены",
    object_grass = "Трава",
    object_grass_plural = "Трава",
    object_flaxDried = "Сухой Лен",
    object_flaxDried_plural = "Сухой Лен",
    object_splitLogFloor = "Пол из бревен 2х2",
    object_splitLogFloor_plural = "Полы из бревен 2х2",
    object_splitLogFloor4x4 = "Пол из бревен 4x4",
    object_splitLogFloor4x4_plural = "Полы из бревен 4x4",
    object_splitLogFloorTri2 = "Треугольник пола из бревен", --0.4
    object_splitLogFloorTri2_plural = "Треугольники пола из сплит бревна", --0.4
    object_build_splitLogFloorTri2 = "Треугольник пола из бревен", --0.4
    object_build_splitLogFloorTri2_plural = "Треугольники пола из бревен", --0.4
    object_mudBrickFloor2x2 = "Глинобитный пол 2x2",
    object_mudBrickFloor2x2_plural = "Грязекирпичный пол 2x2",
    object_build_mudBrickFloor2x2 = "Грязекирпичный пол 2x2",
    object_build_mudBrickFloor2x2_plural = "Грязекирпичный пол 2x2",
    object_mudBrickFloor4x4 = "Глинобитный пол 4x4",
    object_mudBrickFloor4x4_plural = "Грязекирпичный пол 4x4",
    object_build_mudBrickFloor4x4 = "Грязекирпичный пол 4x4",
    object_build_mudBrickFloor4x4_plural = "Глинобитный пол 4x4",
    object_mudBrickFloorTri2 = "Треугольник кирпичного пола", --0.4
    object_mudBrickFloorTri2_plural = "Треугольники глинобитного пола", --0.4
    object_build_mudBrickFloorTri2 = "Треугольник глинобитного пола", --0.4
    object_build_mudBrickFloorTri2_plural = "Треугольники глинобитного пола", --0.4
    object_tileFloor2x2 = "Плиточный пол 2x2",
    object_tileFloor2x2_plural = "Плиточный пол 2x2s",
    object_build_tileFloor2x2 = "Плиточный пол 2x2",
    object_build_tileFloor2x2_plural = "Плиточный пол 2x2s",
    object_tileFloor4x4 = "Плиточный пол 4x4",
    object_tileFloor4x4_plural = "Плиточный пол 4x4s",
    object_build_tileFloor4x4 = "Плиточный пол 4x4",
    object_build_tileFloor4x4_plural = "Плиточный пол 4x4s",
    object_splitLogWall = "Стена из бревен",
    object_splitLogWall_plural = "Стены из бревен",
    object_splitLogWall4x1 = "Короткая стена из сплит-бревна",
    object_splitLogWall4x1_plural = "Короткие стены из сплит-бревна",
    object_splitLogWall2x2 = "Квадратная стена из сращенного бревна",
    object_splitLogWall2x2_plural = "Квадратные стены из бревен",
    object_splitLogWallDoor = "Стена из бревен с дверью",
    object_splitLogWallDoor_plural = "Стены из бревен с дверью",
    object_splitLogRoofEnd = "Стена крыши из сплит-бревна",
    object_splitLogRoofEnd_plural = "Стены крыши из сплит-бревна",
    object_splitLogSteps = "Ступени из сплит бревна 2х3 одноэтажные",
    object_splitLogSteps_plural = "Ступени из сплит бревна 2х3 одноэтажные",
    object_splitLogSteps2x2 = "Ступени из раздельных бревен 2x2 половинный этаж",
    object_splitLogSteps2x2_plural = "Ступени из бревен 2x2 половинный этаж",
    object_splitLogRoofSlope = "Уклон крыши из сплит-бревна", --0.4
    object_splitLogRoofSlope_plural = "Скаты крыши из бревен", --0.4
    object_build_splitLogRoofSlope = "Уклон крыши из бревен", --0.4
    object_build_splitLogRoofSlope_plural = "Скаты крыши из бревен", --0.4
    object_splitLogRoofSmallCorner = "Угол крыши из разборных бревен", --0.4
    object_splitLogRoofSmallCorner_plural = "Углы крыши из разборного бревна", --0.4
    object_build_splitLogRoofSmallCorner = "Угол крыши из бревен", --0.4
    object_build_splitLogRoofSmallCorner_plural = "Углы крыши из бревен", --0.4
    object_splitLogRoofSmallCornerInside = "Внутренний угол крыши из сплит-бревна", --0.4
    object_splitLogRoofSmallCornerInside_plural = "Внутренние углы крыши из сплит бревна", --0.4
    object_build_splitLogRoofSmallCornerInside = "Внутренний угол крыши из бревен", --0.4
    object_build_splitLogRoofSmallCornerInside_plural = "Внутренние углы крыши из бревен", --0.4
    object_splitLogRoofTriangle = "Треугольник крыши из бревен", --0.4
    object_splitLogRoofTriangle_plural = "Треугольники крыши из бревен", --0.4
    object_build_splitLogRoofTriangle = "Треугольник крыши из бревен", --0.4
    object_build_splitLogRoofTriangle_plural = "Треугольники крыши из бревен", --0.4
    object_splitLogRoofInvertedTriangle = "Перевернутый треугольник крыши из бревен", --0.4
    object_splitLogRoofInvertedTriangle_plural = "Перевернутые треугольники крыши из бревен", --0.4
    object_build_splitLogRoofInvertedTriangle = "Перевернутый треугольник крыши из бревен", --0.4
    object_build_splitLogRoofInvertedTriangle_plural = "Перевернутые треугольники крыши из бревен", --0.4
    object_stick = "Палка",
    object_stick_plural = "Палки",
    object_build_thatchRoof = "Крыша из соломы",
    object_build_thatchRoof_plural = "Соломенные крыши",
    object_build_thatchRoofSlope = "Уклон крыши", --0.4
    object_build_thatchRoofSlope_plural = "Скаты крыш из соломы", --0.4
    object_build_thatchRoofSmallCorner = "Угол соломенной крыши", --0.4
    object_build_thatchRoofSmallCorner_plural = "Углы крыши", --0.4
    object_build_thatchRoofSmallCornerInside = "Внутренний угол крыши", --0.4
    object_build_thatchRoofSmallCornerInside_plural = "Внутренние углы крыши", --0.4
    object_build_thatchRoofTriangle = "Треугольник крыши", --0.4
    object_build_thatchRoofTriangle_plural = "Треугольники крыши", --0.4
    object_build_thatchRoofInvertedTriangle = "Перевернутый треугольник крыши", --0.4
    object_build_thatchRoofInvertedTriangle_plural = "Перевернутые треугольники крыши", --0.4
    object_build_thatchRoofLarge = "Большая Соломенная Крыша",
    object_build_thatchRoofLarge_plural = "Большие соломенные крыши",
    object_build_thatchRoofLargeCorner = "Угол большой соломенной крыши",
    object_build_thatchRoofLargeCorner_plural = "Углы больших крыш",
    object_build_thatchRoofLargeCornerInside = "Внутренний угол большой соломенной крыши", --0.4
    object_build_thatchRoofLargeCornerInside_plural = "Внутренние углы большой крыши", --0.4
    object_build_tileRoof = "Черепичная Хижина/Крыша",
    object_build_tileRoof_plural = "Черепичные крыши",
    object_tileRoofSlope = "Уклон черепичной крыши", --0.4
    object_tileRoofSlope_plural = "Скаты черепичной крыши", --0.4
    object_build_tileRoofSlope = "Уклон черепичной крыши", --0.4
    object_build_tileRoofSlope_plural = "Скаты черепичной крыши", --0.4
    object_tileRoofSmallCorner = "Угол черепичной крыши", --0.4
    object_tileRoofSmallCorner_plural = "Углы черепичной крыши", --0.4
    object_build_tileRoofSmallCorner = "Угол черепичной крыши", --0.4
    object_build_tileRoofSmallCorner_plural = "Углы черепичной крыши", --0.4
    object_tileRoofSmallCornerInside = "Внутренний угол черепичной крыши", --0.4
    object_tileRoofSmallCornerInside_plural = "Внутренние углы черепичной крыши", --0.4
    object_build_tileRoofSmallCornerInside = "Внутренний угол черепичной крыши", --0.4
    object_build_tileRoofSmallCornerInside_plural = "Внутренние углы черепичной крыши", --0.4
    object_tileRoofTriangle = "Треугольник черепичной крыши", --0.4
    object_tileRoofTriangle_plural = "Треугольники черепичной крыши", --0.4
    object_build_tileRoofTriangle = "Треугольник черепичной крыши", --0.4
    object_build_tileRoofTriangle_plural = "Треугольники черепичной крыши", --0.4
    object_tileRoofInvertedTriangle = "Перевернутый треугольник черепичной крыши", --0.4
    object_tileRoofInvertedTriangle_plural = "Перевернутые треугольники черепичной крыши", --0.4
    object_build_tileRoofInvertedTriangle = "Перевернутый треугольник черепичной крыши", --0.4
    object_build_tileRoofInvertedTriangle_plural = "Перевернутые треугольники черепичной крыши", --0.4
    object_tileFloorTri2 = "Треугольник плиточного пола", --0.4
    object_tileFloorTri2_plural = "Треугольники плиточного пола", --0.4
    object_build_tileFloorTri2 = "Треугольник плиточного пола", --0.4
    object_build_tileFloorTri2_plural = "Треугольники плиточного пола", --0.4
    object_dirtWall = "Грунтовая стена",
    object_dirtWall_plural = "Грязные стены",
    object_alpacaWoolskin = "Шерсть альпаки",
    object_alpacaWoolskin_plural = "Шерстяные шкуры альпаки",
    object_mammothWoolskin = "Шерстяная шкура мамонта",
    object_mammothWoolskin_plural = "Шерстяные шкуры мамонта",
    object_bone = "Кость",
    object_bone_plural = "Кости",
    object_rock = "Обычный камень",
    object_rock_plural = "Обычные камни",
    object_rockSmall = "Маленькая скала",
    object_rockSmall_plural = "Камни",
    object_rockLarge = "Валун",
    object_rockLarge_plural = "Валуны",
    object_stoneBlock = "Каменный блок", --0.4,
    object_stoneBlock_plural = "Каменные блоки", --0.4
    object_stoneTile = "Каменная плитка", --0.4,
    object_stoneTile_plural = "Каменная плитка", --0.4

    object_limestoneRock = "Известняковая скала",
    object_limestoneRock_plural = "Известняковые скалы",
    object_limestoneRockSmall = "Небольшая известняковая скала",
    object_limestoneRockSmall_plural = "Небольшие известняковые скалы",
    object_limestoneRockLarge = "Кремневый Валун",
    object_limestoneRockLarge_plural = "Известняковые валуны",
    object_limestoneRockBlock = "Известняковый блок", --0.4
    object_limestoneRockBlock_plural = "Известняковые блоки", --0.4
    object_stoneTile_limestone = "Известняковая плитка", --0.4,
    object_stoneTile_limestone_plural = "Известняковая плитка", --0.4

    object_redRock = "Красная скала",
    object_redRock_plural = "Красные скалы",
    object_redRockSmall = "Маленькие красные скалы",
    object_redRockSmall_plural = "Маленькие красные скалы",
    object_redRockLarge = "Валун красной скалы",
    object_redRockLarge_plural = "Валуны красного камня",
    object_redRockBlock = "Красный каменный блок", --0.4
    object_redRockBlock_plural = "Блоки из красного камня", --0.4
    object_stoneTile_redRock = "Плитка из красного камня", --0.4,
    object_stoneTile_redRock_plural = "Плитка из красного камня", --0.4

    object_greenRock = "Зеленокаменная порода",
    object_greenRock_plural = "Зеленокаменные породы",
    object_greenRockSmall = "Маленькая зеленокаменная скала",
    object_greenRockSmall_plural = "Небольшие зеленокаменные породы",
    object_greenRockLarge = "Зеленокаменная глыба",
    object_greenRockLarge_plural = "Валуны из зеленого камня",
    object_greenRockBlock = "Глыба зеленого камня", --0.4
    object_greenRockBlock_plural = "Блоки зеленого камня", --0.4
    object_stoneTile_greenRock = "Плитка из зеленого камня", --0.4
    object_stoneTile_greenRock_plural = "Плитка из зеленого камня", --0.4

    --0.4 added group start
    
    object_graniteRock = "Гранитная скала",
    object_graniteRock_plural = "Гранитные скалы",
    object_graniteRockSmall = "Маленькая гранитная скала",
    object_graniteRockSmall_plural = "Небольшие гранитные скалы",
    object_graniteRockLarge = "Гранитная глыба",
    object_graniteRockLarge_plural = "Гранитные валуны",
    object_graniteRockBlock = "Гранитный блок",
    object_graniteRockBlock_plural = "Гранитные блоки",
    object_stoneTile_graniteRock = "Гранитная плитка",
    object_stoneTile_graniteRock_plural = "Гранитная плитка",
    
    
    object_marbleRock = "Мраморный камень",
    object_marbleRock_plural = "Мраморные камни",
    object_marbleRockSmall = "Маленький мраморный камень",
    object_marbleRockSmall_plural = "Маленькие мраморные камни",
    object_marbleRockLarge = "Мраморная глыба",
    object_marbleRockLarge_plural = "Мраморные валуны",
    object_marbleRockBlock = "Мраморный блок",
    object_marbleRockBlock_plural = "Мраморные блоки",
    object_stoneTile_marbleRock = "Мраморная плитка",
    object_stoneTile_marbleRock_plural = "Мраморная плитка",

    object_lapisRock = "Камень лазурит",
    object_lapisRock_plural = "Камни из лазурита",
    object_lapisRockSmall = "Маленький камень лазурит",
    object_lapisRockSmall_plural = "Малые камни лазурита",
    object_lapisRockLarge = "Валун лазурита",
    object_lapisRockLarge_plural = "Валуны лазурита",
    object_lapisRockBlock = "Глыба лазурита",
    object_lapisRockBlock_plural = "Блоки из лазурита",
    object_stoneTile_lapisRock = "Плитка из лазурита",
    object_stoneTile_lapisRock_plural = "Плитка из лазурита",

    object_sandstoneYellowRock = "Песчаник (желтый) камень",
    object_sandstoneYellowRock_plural = "Песчаник (желтые) камни",
    object_sandstoneYellowRockSmall = "Небольшая песчаниковая (желтая) скала",
    object_sandstoneYellowRockSmall_plural = "Небольшие песчаниковые (желтые) породы",
    object_sandstoneYellowRockLarge = "Песчаник (желтый) валун",
    object_sandstoneYellowRockLarge_plural = "Валуны из песчаника (желтого)",
    object_sandstoneYellowRockBlock = "Глыба песчаника (желтого)",
    object_sandstoneYellowRockBlock_plural = "Блоки из песчаника (желтого)",
    object_stoneTile_sandstoneYellowRock = "Плитка из песчаника (желтого)",
    object_stoneTile_sandstoneYellowRock_plural = "Плитка из песчаника (желтого)",

    object_sandstoneRedRock = "Песчаник (красная) скала",
    object_sandstoneRedRock_plural = "Песчаник (красная) скала",
    object_sandstoneRedRockSmall = "Песчаник (красная) скала",
    object_sandstoneRedRockSmall_plural = "Мелкие песчаниковые (красные) породы",
    object_sandstoneRedRockLarge = "Песчаник (красный) валун",
    object_sandstoneRedRockLarge_plural = "Валуны из песчаника (красного)",
    object_sandstoneRedRockBlock = "Глыба песчаника (красного)",
    object_sandstoneRedRockBlock_plural = "Блоки из песчаника (красного)",
    object_stoneTile_sandstoneRedRock = "Плитка из песчаника (красного)",
    object_stoneTile_sandstoneRedRock_plural = "Плитка из песчаника (красного)",

    object_sandstoneOrangeRock = "Песчаник (оранжевый) камень",
    object_sandstoneOrangeRock_plural = "Песчаник (оранжевые) камни",
    object_sandstoneOrangeRockSmall = "Небольшая песчаниковая (оранжевая) скала",
    object_sandstoneOrangeRockSmall_plural = "Небольшие песчаниковые (оранжевые) породы",
    object_sandstoneOrangeRockLarge = "Песчаник (оранжевый) валун",
    object_sandstoneOrangeRockLarge_plural = "Валуны из песчаника (оранжевого цвета)",
    object_sandstoneOrangeRockBlock = "Песчаник (оранжевый) глыба",
    object_sandstoneOrangeRockBlock_plural = "Блоки из песчаника (оранжевого)",
    object_stoneTile_sandstoneOrangeRock = "Плитка из песчаника (оранжевого)",
    object_stoneTile_sandstoneOrangeRock_plural = "Плитка из песчаника (оранжевого)",

    object_sandstoneBlueRock = "Песчаник (синяя) скала",
    object_sandstoneBlueRock_plural = "Песчаник (синие) камни",
    object_sandstoneBlueRockSmall = "Маленькая песчаниковая (синяя) скала",
    object_sandstoneBlueRockSmall_plural = "Небольшие песчаниковые (синие) скалы",
    object_sandstoneBlueRockLarge = "Песчаник (синий) валун",
    object_sandstoneBlueRockLarge_plural = "Валуны из песчаника (синего)",
    object_sandstoneBlueRockBlock = "Песчаник (синий) блок",
    object_sandstoneBlueRockBlock_plural = "Блоки из песчаника (синего)",
    object_stoneTile_sandstoneBlueRock = "Плитка из песчаника (синего)",
    object_stoneTile_sandstoneBlueRock_plural = "Плитка из песчаника (синего)",

    --0.4 group end

    object_chickenMeatBreast = "Сырое куриное мясо", --0.3.0 добавлено "Сырое"
    object_chickenMeatBreast_plural = "Сырое куриное мясо", --0.3.0 добавлено "Сырое"
    object_birchWoodenPole = "Березовый деревянный шест",
    object_birchWoodenPole_plural = "Березовые деревянные столбы",
    object_willowWoodenPole = "Ивовый деревянный столб",
    object_willowWoodenPole_plural = "Деревянные столбы из ивы",
    object_appleWoodenPole = "Деревянные столбы из яблок",
    object_appleWoodenPole_plural = "Яблоневые деревянные столбы",
    object_elderberryWoodenPole = "Деревянные столбы из бузины",
    object_elderberryWoodenPole_plural = "Деревянные столбы из бузины",
    object_orangeWoodenPole = "Оранжевые деревянные столбы",
    object_orangeWoodenPole_plural = "Оранжевые деревянные столбы",
    object_peachWoodenPole = "Персиковый деревянный шест",
    object_peachWoodenPole_plural = "персиковые деревянные столбы",
    object_bambooWoodenPole = "Бамбуковые деревянные шесты",
    object_bambooWoodenPole_plural = "Деревянные столбы из бамбука",
    object_thatchWallDoor = "Стена из лоскутов с дверью",
    object_thatchWallDoor_plural = "Стены из лохмотьев с дверью",
    object_birchSplitLog = "Березовый сруб",
    object_birchSplitLog_plural = "Березовые поленья",
    object_willowSplitLog = "Ивовое бревно",
    object_willowSplitLog_plural = "Бревна, расщепленные ивой",
    object_appleSplitLog = "Яблочное раздельное бревно",
    object_appleSplitLog_plural = "Яблоневые бревна",
    object_elderberrySplitLog = "Раздельные бревна бузины",
    object_elderberrySplitLog_plural = "Бревна, разделенные бузиной",
    object_orangeSplitLog = "Апельсиновое раздельное бревно",
    object_orangeSplitLog_plural = "Апельсиновые бревна",
    object_peachSplitLog = "Персиковое раздельное бревно",
    object_peachSplitLog_plural = "Персиковые бревна",
    object_coconutSplitLog = "Кокосовое раздельное бревно",
    object_cococonutSplitLog_plural = "Кокосовые бревна",
    object_build_hayBed = "Подстилка из Сены",
    object_build_hayBed_plural = "Подстилки из Сена",
    object_build_woolskinBed = "Подстилка из Шкуры",
    object_build_woolskinBed_plural = "Подстилки из Шкур",
    object_aspenWoodenPole = "Осиновый деревянный столб",
    object_aspenWoodenPole_plural = "Осиновые деревянные столбы",
    object_chicken = "Курица",
    object_chicken_plural = "Куры",
    object_chickenMeat = "Сырое куриное мясо", --0.3.0 добавлено "Сырое"
    object_chickenMeat_plural = "Сырое куриное мясо", --0.3.0 добавлено "Сырое"
    object_build_splitLogFloor = "Пол из раздельных бревен 2x2",
    object_build_splitLogFloor_plural = "Полы из бревен 2х2",
    object_build_splitLogFloor4x4 = "Пол из бревен 4x4",
    object_build_splitLogFloor4x4_plural = "Полы из бревен 4x4",
    object_build_splitLogWall = "Стена из бревен",
    object_build_splitLogWall_plural = "Стены из бревен",
    object_build_splitLogWall4x1 = "Короткая стена из бревен",
    object_build_splitLogWall4x1_plural = "Короткие стены из бревен",
    object_build_splitLogWall2x2 = "Квадратная стена из бревен",
    object_build_splitLogWall2x2_plural = "Квадратные стены из бревен",
    object_build_splitLogRoofEnd = "Стена крыши из бревен",
    object_build_splitLogRoofEnd_plural = "Стены крыши из бревен",
    object_build_splitLogWallDoor = "Стена из бревен с дверью",
    object_build_splitLogWallDoor_plural = "Стены из бревен с дверями",
    object_build_splitLogSteps = "Ступени из сруба 2х3 одноэтажные",
    object_build_splitLogSteps_plural = "Ступени из сплит бревна 2х3 одноэтажные",
    object_build_splitLogSteps2x2 = "Ступени из бревен 2x2 половинный этаж",
    object_build_splitLogSteps2x2_plural = "Ступени из сплит-бревна 2x2 Half Floor",
    object_build_splitLogRoof = "Крыша из бревен",
    object_build_splitLogRoof_plural = "Крыши из бревен",
    object_mammoth = "Мамонт",
    object_mammoth_plural = "Мамонты",
    object_build_dirtRoof = "Грунтовая крыша",
    object_build_dirtRoof_plural = "Грунтовые крыши",
    object_flint = "Кремень",
    object_flint_plural = "Кремень",
    object_clay = "Глина",
    object_clay_plural = "Глина",
    object_copperOre = "Медная руда", --0.4
    object_copperOre_plural = "Медная руда", --0.4
    объект_tinOre = "Руда олова", --0.4
    объект_tinOre_plural = "Руда олова", --0.4
    объект_манюра = "Навоз", --0.4
    object_manure_plural = "Навоз", --0.4
    object_manureRotten = "Гнилой навоз", --0.4
    object_manureRotten_plural = "Гнилой навоз", --0.4
    object_rottenGoo = "Гнилая слизь", --0.4
    object_rottenGoo_plural = "Гнилая слизь", --0.4
    object_compost = "Компост", --0.4
    object_compost_plural = "Компост", --0.4
    object_compostRotten = "Гнилой компост", --0.4.1
    object_compostRotten_plural = "Гнилой компост", --0.4.1
    object_build_craftArea = "Зона для крафта",
    object_build_craftArea_plural = "Зоны для крафта",
    object_build_dirtWallDoor = "Грунтовая стена с дверью",
    object_build_dirtWallDoor_plural = "Грунтовая стена с дверью",
    object_stoneKnife = "Каменный Нож",
    object_stoneKnife_plural = "Каменные Ножи",
    object_stoneKnife_limestone = "Нож из известняка",
    object_stoneKnife_limestone_plural = "Известняковые ножи",
    object_stoneKnife_redRock = "Нож из красного камня",
    object_stoneKnife_redRock_plural = "Ножи из красного камня",
    object_stoneKnife_greenRock = "Нож из зеленого камня",
    object_stoneKnife_greenRock_plural = "Ножи из зеленого камня",
    object_stoneKnife_graniteRock = "Гранитный нож", --0.4
    object_stoneKnife_graniteRock_plural = "Гранитные ножи", --0.4
    object_stoneKnife_marbleRock = "Мраморный нож", --0.4
    object_stoneKnife_marbleRock_plural = "Мраморные ножи", --0.4
    object_stoneKnife_lapisRock = "Нож из лазурита", --0.4
    object_stoneKnife_lapisRock_plural = "Ножи из лазурита", --0.4
    object_flintKnife = "Кремневый Нож",
    object_flintKnife_plural = "Кремневые ножи",
    object_boneKnife = "Костяной Нож",
    object_boneKnife_plural = "Костяные Ножи",
    object_bronzeKnife = "Бронзовый нож", --0.4
    object_bronzeKnife_plural = "Бронзовые ножи", --0.4
    object_bronzeChisel = "Бронзовое зубило", --0.4
    object_bronzeChisel_plural = "Бронзовое зубило", --0.4
    object_boneFlute = "Костяная Флейта",
    object_boneFlute_plural = "Костяные Флейты",
    object_logDrum = "Бревенчатый барабан",
    object_logDrum_plural = "Бревенчатые барабаны",
    object_balafon = "Балафон",
    object_balafon_plural = "Балафоны",
    object_drumStick = "Барабанная палочка",
    object_drumStick_plural = "Барабанные палочки",
    object_alpaca = "Альпака",
    object_alpaca_plural = "Альпаки",
    object_storageArea = "Зона для Хранения",
    object_storageArea_plural = "Зоны для Хранения",
    object_stoneAxeHead = "Каменный ручной топор",
    object_stoneAxeHead_plural = "Каменные ручные топоры",
    object_stoneAxeHead_limestone = "Ручной топор из известняка",
    object_stoneAxeHead_limestone_plural = "Известняковые ручные топоры",
    object_stoneAxeHead_redRock = "Ручной топор из красного камня",
    object_stoneAxeHead_redRock_plural = "Ручные топоры из красного камня",
    object_stoneAxeHead_greenRock = "Ручной топор из зеленого камня",
    object_stoneAxeHead_greenRock_plural = "ручные топоры из зеленого камня",

     --0.4 group start:
    object_stoneChisel = "Каменное долото", --0.4
    object_stoneChisel_plural = "Каменные долото", --0.4
    object_stoneChisel_limestone = "Известняковое зубило", --0.4
    object_stoneChisel_limestone_plural = "Зубило по известняку", --0.4
    object_stoneChisel_redRock = "Зубило по красному камню", --0.4
    object_stoneChisel_redRock_plural = "Зубило по красной скале", --0.4
    object_stoneChisel_greenRock = "Зубило из зеленого камня", --0.4
    object_stoneChisel_greenRock_plural = "Зубило из зеленого камня", --0.4
    object_stoneChisel_graniteRock = "Гранитное зубило", --0.4
    object_stoneChisel_graniteRock_plural = "Гранитные зубила", --0.4
    object_stoneChisel_marbleRock = "Мраморное долото", --0.4
    object_stoneChisel_marbleRock_plural = "Зубило по мрамору", --0.4
    object_stoneChisel_lapisRock = "Долото по лазуриту", --0.4
    object_stoneChisel_lapisRock_plural = "Долото из лазурита", --0.4
    
    object_stoneAxeHead_sandstoneYellowRock = "Ручные топоры из песчаника (желтого)", --0.4
    object_stoneAxeHead_sandstoneYellowRock_plural = "Ручные топоры из песчаника (желтого)", --0.4
    object_quernstone_sandstoneYellowRock = "Ручная мельница", --0.4
    object_quernstone_sandstoneYellowRock_plural = "Ручная мельница", --0.4

    object_stoneAxeHead_sandstoneRedRock = "Ручные топоры из песчаника (красного)", --0.4
    object_stoneAxeHead_sandstoneRedRock_plural = "Ручные топоры из песчаника (красного)", --0.4
    object_quernstone_sandstoneRedRock = "Ручная мельница", --0.4
    object_quernstone_sandstoneRedRock_plural = "Ручная мельница", --0.4

    object_stoneAxeHead_sandstoneOrangeRock = "Ручной топор из песчаника (оранжевый)", --0.4
    object_stoneAxeHead_sandstoneOrangeRock_plural = "Ручные топоры из песчаника (оранжевого)", --0.4
    object_quernstone_sandstoneOrangeRock = "Ручная мельница", --0.4
    object_quernstone_sandstoneOrangeRock_plural = "Ручная мельница", --0.4

    object_stoneAxeHead_sandstoneBlueRock = "Ручной топор из песчаника (синий)", --0.4
    object_stoneAxeHead_sandstoneBlueRock_plural = "Ручные топоры из песчаника (синего)", --0.4
    object_quernstone_sandstoneBlueRock = "Ручная мельница", --0.4
    object_quernstone_sandstoneBlueRock_plural = "Ручная мельница", --0.4

    object_stoneAxeHead_graniteRock = "Гранитный ручной топор", --0.4
    object_stoneAxeHead_graniteRock_plural = "Гранитные ручные топоры", --0.4
    object_stoneAxeHead_marbleRock = "Мраморный ручной топор", --0.4
    object_stoneAxeHead_marbleRock_plural = "Мраморные ручные топоры", --0.4
    object_stoneAxeHead_lapisRock = "Ручной топор из лазурита", --0.4
    object_stoneAxeHead_lapisRock_plural = "Ручные топоры из лазурита", --0.4
    object_stoneHammerHead = "Голова каменного молота", --0.4
    object_stoneHammerHead_plural = "Наконечники каменных молотов", --0.4
    object_stoneHammerHead_redRock = "Голова молота из красного камня", --0.4
    object_stoneHammerHead_redRock_plural = "Наконечники молотов из красного камня", --0.4
    object_stoneHammerHead_greenRock = "Наконечник молота из зеленого камня", --0.4
    object_stoneHammerHead_greenRock_plural = "Наконечники молотов из зеленого камня", --0.4
    object_stoneHammerHead_graniteRock = "Наконечник молота из гранита", --0.4
    object_stoneHammerHead_graniteRock_plural = "Наконечники гранитных молотов", --0.4
    object_stoneHammerHead_marbleRock = "Голова мраморного молота", --0.4
    object_stoneHammerHead_marbleRock_plural = "Наконечники мраморных молотов", --0.4
    object_stoneHammerHead_lapisRock = "Голова молота из лазурита", --0.4
    object_stoneHammerHead_lapisRock_plural = "Наконечники молотов из лазурита", --0.4
    object_bronzeHammerHead = "Головка бронзового молота", --0.4
    object_bronzeHammerHead_plural = "Наконечники бронзовых молотов", --0.4
    object_bronzeAxeHead = "Бронзовый ручной топор", --0.4
    object_bronzeAxeHead_plural = "Бронзовые ручные топоры", --0.4
    object_bronzePickaxeHead = "Голова бронзовой кирки", --0.4
    object_bronzePickaxeHead_plural = "Наконечники бронзовых кирок", --0.4
    object_compostBin = "Компостная яма", --0.4
    object_compostBin_plural = "Компостные ямы", --0.4
    --0.4 group end

    object_flintAxeHead = "Кремневый Наконечник Топора",
    object_flintAxeHead_plural = "Кремневые ручные топоры",
    object_chickenMeatCooked = "Приготовленное куриное мясо",
    object_chickenMeatCooked_plural = "Приготовленное куриное мясо",
    object_pumpkinCooked = "Жареная тыква",
    object_pumpkinCooked_plural = "Жареная тыква",
    object_beetrootCooked = "Жареная свекла",
    object_beetrootCooked_plural = "Обжаренная свекла",
    object_flatbread = "Лепешка",
    object_flatbread_plural = "Лепешки",
    object_flatbreadRotten = "Заплесневелые лепешки",
    object_flatbreadRotten_plural = "Заплесневелые лепешки",
    object_build_thatchWall = "Стена из соломы",
    object_build_thatchWall_plural = "Стены из соломы",
    object_build_thatchWallLargeWindow = "Стена с большим окном", --0.3.0 change Single to Large
    object_build_thatchWallLargeWindow_plural = "Стена с большими окнами", --0.3.0 change Single to Large
    object_build_thatchWall4x1 = "Короткая стена из досок",
    object_build_thatchWall4x1_plural = "Короткие стены из досок",
    object_build_thatchWall2x2 = "Квадратная стена из соломы",
    object_build_thatchWall2x2_plural = "квадратные стены из соломы",
    object_build_thatchRoofEnd = "Стена крыши из соломы",
    object_build_thatchRoofEnd_plural = "Стены крыши из соломы",
    object_deadChicken = "Тушка курицы",
    object_deadChicken_plural = "Тушки цыплят",
    object_deadChickenRotten = "Тушка гнилой курицы",
    object_deadChickenRotten_plural = "Тухлые куриные тушки",
    object_thatchWall = "Стена из соломы",
    object_thatchWall_plural = "Стены из соломы",
    object_thatchWallLargeWindow = "Стена из соломы с большим окном", --0.3.0 change Single to Large
    object_thatchWallLargeWindow_plural = "Стена с большими окнами", --0.3.0 change Single to Large
    object_thatchWall4x1 = "Короткая стена из соломы",
    object_thatchWall4x1_plural = "Короткие стены из лохмотьев",
    object_thatchWall2x2 = "Квадратная стена из соломы",
    object_thatchWall2x2_plural = "квадратные стены из соломы",
    object_thatchRoofEnd = "Стена крыши из соломы",
    object_thatchRoofEnd_plural = "Стены крыши из тонкомера",
    object_sand = "Песок",
    object_sand_plural = "Песок",
    object_craftArea = "Зона для крафта",
    object_craftArea_plural = "Зоны для Крафта",
    object_build_campfire = "Костер",
    object_build_campfire_plural = "Костры",
    object_build_brickKiln = "Печь для обжига",
    object_build_brickKiln_plural = "Печи для обжига",
    object_build_torch = "Факел",
    object_build_torch_plural = "Факелы",
    object_stoneSpear = "Каменное копье",
    object_stoneSpear_plural = "Каменные копья",
    object_flintSpear = "Кремневое копье",
    object_flintSpear_plural = "Кремневые копья",
    object_boneSpear = "Костяное копье",
    object_boneSpear_plural = "Костяные копья",
    object_stonePickaxe = "Каменная Кирка",
    object_stonePickaxe_plural = "Каменные кирки",
    object_flintPickaxe = "Кремневая Кирка",
    object_flintPickaxe_plural = "Кремневые кирки",
    object_stoneHatchet = "Каменный Топорик",
    object_stoneHatchet_plural = "Каменные топорики",
    object_flintHatchet = "Кремневый Топорик",
    object_flintHatchet_plural = "Кремневые топорики",
    object_bronzeHatchet = "Бронзовый топорик", --0.4
    object_bronzeHatchet_plural = "Бронзовые топоры", --0.4
    object_bronzePickaxe = "Бронзовая кирка", --0.4
    object_bronzePickaxe_plural = "Бронзовые кирки", --0.4
    object_bronzeSpear = "Бронзовое копье", --0.4
    object_bronzeSpear_plural = "Бронзовые копья", --0.4
    object_alpacaMeatLeg = "Сырое мясо альпаки", --0.3.0 добавлено "Сырое"
    object_alpacaMeatLeg_plural = "Сырое мясо альпаки", --0.3.0 добавлено "Сырое"
    object_alpacaMeatLegCooked = "Приготовленное мясо альпаки",
    object_alpacaMeatLegCooked_plural = "Приготовленное мясо альпаки",
    object_hayBed = "Подстилка из Сены",
    object_hayBed_plural = "Подстилки из Сена",
    object_woolskinBed = "Подстилка из Шкуры",
    object_woolskinBed_plural = "Подстилки из Шкур",
    object_sapien = "Сапиен",
    object_sapien_plural = "Sapiens",
    object_thatchRoof = "Соломенная крыша",
    object_thatchRoof_plural = "крыши из соломы",
    object_thatchRoofSlope = "Уклон крыши", --0.4
    object_thatchRoofSlope_plural = "Скаты крыш из соломы", --0.4
    object_thatchRoofSmallCorner = "Угол соломенной крыши", --0.4
    object_thatchRoofSmallCorner_plural = "Углы крыши", --0.4
    object_thatchRoofSmallCornerInside = "Внутренний угол крыши", --0.4
    object_thatchRoofSmallCornerInside_plural = "Внутренние углы соломенной крыши", --0.4
    object_thatchRoofTriangle = "Треугольник крыши", --0.4
    object_thatchRoofTriangle_plural = "Треугольники крыши", --0.4
    object_thatchRoofInvertedTriangle = "Перевернутый треугольник крыши", --0.4
    object_thatchRoofInvertedTriangle_plural = "Перевернутые треугольники крыши", --0.4
    object_thatchRoofLarge = "Большая Соломенная Крыша",
    object_thatchRoofLarge_plural = "Большие соломенные крыши",
    object_thatchRoofLargeCorner = "Угол большой соломенной крыши",
    object_thatchRoofLargeCorner_plural = "Углы больших крыш",
    object_thatchRoofLargeCornerInside = "Внутренний угол большой соломенной крыши", --0.4
    object_thatchRoofLargeCornerInside_plural = "Внутренние углы большой соломенной крыши", --0.4
    object_tileRoof = "Черепичная Хижина/Крыша",
    object_tileRoof_plural = "Черепичные крыши",
    object_pineWoodenPole = "Сосновые деревянные столбы",
    object_pineWoodenPole_plural = "Сосновые деревянные столбы",
    object_hay = "Солома",
    object_hay_plural = "Солома",
    object_hayRotten = "Гнилое сено",
    object_hayRotten_plural = "Гнилое сено",
    object_terrainModificationProxy = "Модифицировать местность",
    object_terrainModificationProxy_plural = "Изменить местность",
    object_dirt = "Почва",
    object_dirt_plural = "Почва",
    object_richDirt = "Плодородная Почва",
    object_richDirt_plural = "Плодородная Почва",
    object_poorDirt = "Бедная Почва",
    object_poorDirt_plural = "Бедная Почва",
    object_riverSand = "Речной Песок",
    object_riverSand_plural = "Речной Песок",
    object_redSand = "Красный песок",
    object_redSand_plural = "Красный песок",
    object_stoneSpearHead = "Каменный Наконечник Копья",
    object_stoneSpearHead_plural = "Наконечники каменных копий",
    object_stoneSpearHead_limestone = "Наконечник копья из известняка",
    object_stoneSpearHead_limestone_plural = "Наконечники копий из известняка",
    object_stoneSpearHead_redRock = "Наконечник копья из красного камня",
    object_stoneSpearHead_redRock_plural = "Наконечники копий из красного камня",
    object_stoneSpearHead_greenRock = "Наконечник копья из зеленого камня",
    object_stoneSpearHead_greenRock_plural = "Наконечники копий из зеленого камня",
    object_stoneSpearHead_graniteRock = "Гранитная головка копья", --0.4
    object_stoneSpearHead_graniteRock_plural = "Гранитные наконечники копий", --0.4
    object_stoneSpearHead_marbleRock = "Наконечник мраморного копья", --0.4
    object_stoneSpearHead_marbleRock_plural = "Наконечники мраморных копий", --0.4
    object_stoneSpearHead_lapisRock = "Наконечник копья из лазурита", --0.4
    object_stoneSpearHead_lapisRock_plural = "Наконечники копий из лазурита", --0.4
    object_stonePickaxeHead = "Каменный Наконечник Кирки",
    object_stonePickaxeHead_plural = "Наконечники каменных кирок",
    object_stonePickaxeHead_limestone = "Наконечник известняковой кирки",
    object_stonePickaxeHead_limestone_plural = "Наконечники известняковых кирок",
    object_stonePickaxeHead_redRock = "Наконечник кирки из красного камня",
    object_stonePickaxeHead_redRock_plural = "Наконечник кирки из красного камня",
    object_stonePickaxeHead_greenRock = "Наконечник кирки из зеленого камня",
    object_stonePickaxeHead_greenRock_plural = "Наконечники кирки из зеленого камня",
    object_stonePickaxeHead_graniteRock = "Наконечник гранитной кирки", --0.4
    object_stonePickaxeHead_graniteRock_plural = "Наконечники гранитных кирок", --0.4
    object_stonePickaxeHead_marbleRock = "Наконечник мраморной кирки", --0.4
    object_stonePickaxeHead_marbleRock_plural = "Наконечники мраморных кирок", --0.4
    object_stonePickaxeHead_lapisRock = "Наконечник кирки из лазурита", --0.4
    object_stonePickaxeHead_lapisRock_plural = "Наконечники кирки из лазурита", --0.4
    object_flintSpearHead = "Кремневый Наконечник Копья",
    object_flintSpearHead_plural = "Наконечники кремневых копий",
    object_bronzeSpearHead = "Наконечник бронзового копья", --0.4
    object_bronzeSpearHead_plural = "Наконечники бронзовых копий", --0.4
    object_boneSpearHead = "Костяной Наконечник Копья",
    object_boneSpearHead_plural = "Наконечники костяных копий",
    object_flintPickaxeHead = "Кремневый Наконечник Кирки",
    object_flintPickaxeHead_plural = "Наконечники кремневых кирок",
    object_stoneHammer = "Каменный молот", --0.4
    object_stoneHammer_plural = "Каменные молоты", --0.4
    object_bronzeHammer = "Бронзовый молот", --0.4
    object_bronzeHammer_plural = "Бронзовые молоты", --0.4
    object_build_thatchWallDoor = "Стена с дверью",
    object_build_thatchWallDoor_plural = "Стена с дверью",
    object_pineSplitLog = "Сосновый сруб",
    object_pineSplitLog_plural = "Сосновое расколотое бревно",
    object_burntBranch = "Сожженная ветка",
    object_burntBranch_plural = "Сожженные ветки",
    object_unfiredUrnWet = "Необожженная урна (мокрая)",
    object_unfiredUrnWet_plural = "Необожженные урны (мокрые)",
    object_unfiredUrnDry = "Необожженная урна",
    object_unfiredUrnDry_plural = "Необожженные урны",
    object_firedUrn = "Обожженная урна",
    object_firedUrn_plural = "Обожженные урны",
    object_unfiredUrnHulledWheat = "Пшеница с шелухой (необожженная урна)",
    object_unfiredUrnHulledWheat_plural = "Скорлупа пшеницы (необожженная урна)",
    object_unfiredUrnHulledWheatRotten = "Пшеница с плесенью (необожженная урна)",
    object_unfiredUrnHulledWheatRotten_plural = "Пшеница с плесенью (необожженная урна)",
    object_firedUrnHulledWheat = "Пшеница с шелухой (обожженная урна)",
    object_firedUrnHulledWheat_plural = "Пшеница с шелухой (обожженная урна)",
    object_firedUrnHulledWheatRotten = "Пшеница с плесенью (обожженная урна)",
    object_firedUrnHulledWheatRotten_plural = "Пшеница с плесенью (обожженная урна)",

    --0.3.0 added group start
    object_unfiredBowlWet = "Необожженная миска (мокрая)",
    object_unfiredBowlWet_plural = "Необожженные миски (мокрые)",
    object_unfiredBowlDry = "Необожженная чаша",
    object_unfiredBowlDry_plural = "Необожженные миски",
    object_firedBowl = "Обожженная чаша",
    object_firedBowl_plural = "Обожженные миски",
    
    object_unfiredBowlInjuryMedicine = "Медицина травм",
    object_unfiredBowlInjuryMedicine_plural = "Медицина травм",
    object_unfiredBowlBurnMedicine = "Медицина ожогов",
    object_unfiredBowlBurnMedicine_plural = "Медицина ожогов",
    object_unfiredBowlFoodPoisoningMedicine = "Лекарство от пищевого отравления",
    object_unfiredBowlFoodPoisoningMedicine_plural = "Лекарство от пищевого отравления",
    object_unfiredBowlVirusMedicine = "Лекарство от вирусов (необжаренная чаша)",
    object_unfiredBowlVirusMedicine_plural = "Лекарство от вирусов (необжаренные миски)",
    object_unfiredBowlMedicineRotten = "Гнилая медицина",
    object_unfiredBowlMedicineRotten_plural = "Гнилая медицина",
    
    object_firedBowlInjuryMedicine = "Медицина травм",
    object_firedBowlInjuryMedicine_plural = "Медицина травм",
    object_firedBowlBurnMedicine = "Медицина ожогов",
    object_firedBowlBurnMedicine_plural = "Медицина ожогов",
    object_firedBowlFoodPoisoningMedicine = "Медицина пищевых отравлений",
    object_firedBowlFoodPoisoningMedicine_plural = "Лекарство от пищевого отравления",
    object_firedBowlVirusMedicine = "Лекарство от вирусов",
    object_firedBowlVirusMedicine_plural = "Лекарство от вирусов",
    object_firedBowlMedicineRotten = "Гнилая медицина",
    object_firedBowlMedicineRotten_plural = "Гнилая медицина",

    --0.3.0 group end

    
    object_crucibleWet = "Крусибл (мокрый)", --0.4
    object_crucibleWet_plural = "Тигли (мокрые)", --0.4
    object_crucibleDry = "Крусибл", --0.4
    object_crucibleDry_plural = "Крусиблы", --0.4

    object_temporaryCraftArea = "Создать",
    object_temporaryCraftArea_plural = "Создать",
    object_quernstone = "Ручная мельница",
    object_quernstone_plural = "Ручная мельница",
    object_quernstone_limestone = "Ручная мельница",
    object_quernstone_limestone_plural = "Ручная мельница",
    object_quernstone_redRock = "Ручная мельница",
    object_quernstone_redRock_plural = "Ручная мельница",
    object_quernstone_greenRock = "Ручная мельница",
    object_quernstone_greenRock_plural = "Ручная мельница",
    object_quernstone_graniteRock = "Ручная мельница", --0.4
    object_quernstone_graniteRock_plural = "Ручная мельница", --0.4
    object_quernstone_marbleRock = "Ручная мельница", --0.4
    object_quernstone_marbleRock_plural = "Ручная мельница", --0.4
    object_quernstone_lapisRock = "Ручная мельница", --0.4
    object_quernstone_lapisRock_plural = "Ручная мельница", --0.4
    object_unfiredUrnFlour = "Мука (необожженная урна)",
    object_unfiredUrnFlour_plural = "Мука (необожженные урны)",
    object_unfiredUrnFlourRotten = "Заплесневелая мука (необожженная урна)",
    object_unfiredUrnFlourRotten_plural = "Заплесневелая мука (необожженные урны)",
    object_firedUrnFlour = "Мука (обожженная урна)",
    object_firedUrnFlour_plural = "Мука (обожженные урны)",
    object_firedUrnFlourRotten = "Заплесневелая мука (обожженная урна)",
    object_firedUrnFlourRotten_plural = "Заплесневелая мука (обожженные урны)",
    object_splitLogBench = "Скамья для разделения бревен",
    object_splitLogBench_plural = "Скамьи из раздельных бревен",
    object_build_splitLogBench = "Скамья из раздельных бревен",
    object_build_splitLogBench_plural = "Скамейки из раздельных бревен",
    object_splitLogRoof = "Крыша из сплит-бревна",
    object_splitLogRoof_plural = "Крыши из срубленных бревен",
    object_branchRotten = "Гнилая ветка",
    object_branchRotten_plural = "Гнилые ветки",
    object_breadDough = "Тесто",
    object_breadDough_plural = "Тесто",
    object_breadDoughRotten = "Гнилое хлебное тесто",
    object_breadDoughRotten_plural = "Гнилое хлебное тесто",
    object_flaxTwine = "Льняная Веревка",
    object_flaxTwine_plural = "Льняная Веревка",
    object_mudBrickWet_sand = "Кирпич из песчаного раствора (мокрый)",
    object_mudBrickWet_sand_plural = "Кирпич из песчаной грязи (мокрый)",
    object_mudBrickWet_hay = "Кирпич из сенной грязи (мокрый)",
    object_mudBrickWet_hay_plural = "Кирпичи из сенной грязи (мокрые)",
    object_mudBrickWet_riverSand = "Кирпич из речного песка (мокрый)",
    object_mudBrickWet_riverSand_plural = "Кирпичи из речного песка (мокрые)",
    object_mudBrickWet_redSand = "Кирпич из красного песка (влажный)",
    object_mudBrickWet_redSand_plural = "Кирпичи из красного песка (влажные)",
    object_mudTileWet = "Необожженная плитка (мокрая)",
    object_mudTileWet_plural = "Необожженная плитка (мокрая)",
    object_mudTileDry = "Необожженная плитка",
    object_mudTileDry_plural = "Необработанная плитка",
    object_firedTile = "Плитка",
    object_firedTile_plural = "Плитка",
    object_mudBrickDry_sand = "Кирпич из песчаного раствора (сухой)",
    object_mudBrickDry_sand_plural = "Кирпич из песчаного раствора (сухой)",
    object_mudBrickDry_hay = "Кирпич из сена (сухой)",
    object_mudBrickDry_hay_plural = "Кирпичи из сенной грязи (сухие)",
    object_mudBrickDry_riverSand = "Кирпич из речного песка (сухой)",
    object_mudBrickDry_riverSand_plural = "Кирпичи из речного песка (сухие)",
    object_mudBrickDry_redSand = "Кирпич из красного песка (сухой)",
    object_mudBrickDry_redSand_plural = "Кирпичи из красного песка (сухие)",
    object_firedBrick_sand = "Обожженный песчаный кирпич",
    object_firedBrick_sand_plural = "Кирпичи из обожженного песка",
    object_firedBrick_hay = "Обожженный кирпич из сена",
    object_firedBrick_hay_plural = "Кирпичи из обожженного сена",
    object_firedBrick_riverSand = "Обожженный кирпич из речного песка",
    object_firedBrick_riverSand_plural = "Обожженные кирпичи из речного песка",
    object_firedBrick_redSand = "Обожженный кирпич с красным песком",
    object_firedBrick_redSand_plural = "Обожженный кирпич из красного песка",
    object_mudBrickWall = "Стена из глинобитного кирпича",
    object_mudBrickWall_plural = "Стены из глинобитного кирпича",
    object_mudBrickWall4x1 = "Короткая стена из кирпича",
    object_mudBrickWall4x1_plural = "Короткие стены из кирпича",
    object_mudBrickWall2x2 = "Квадратная стена из кирпича",
    object_mudBrickWall2x2_plural = "Квадратные стены из кирпича",
    object_build_mudBrickWall = "Грязекирпичная стена",
    object_build_mudBrickWall_plural = "Стены из кирпича",
    object_build_mudBrickWall4x1 = "Короткая стена из кирпича",
    object_build_mudBrickWall4x1_plural = "Короткие стены из кирпича",
    object_build_mudBrickWall2x2 = "Квадратная стена из кирпича",
    object_build_mudBrickWall2x2_plural = "Квадратные стены из кирпича",
    object_mudBrickRoofEnd = "Торцевая стена крыши из кирпича", --0.4
    object_mudBrickRoofEnd_plural = "Торцевые стены крыши из кирпича", --0.4
    object_build_mudBrickRoofEnd = "Торцевая стена крыши из кирпича", --0.4
    object_build_mudBrickRoofEnd_plural = "Торцевые стены крыши из кирпича",--0.4
    object_mudBrickWallDoor = "Стена из кирпича с дверью",
    object_mudBrickWallDoor_plural = "Глинобитная стена с дверью",
    object_build_mudBrickWallDoor = "Грязекирпичная стена с дверью",
    object_build_mudBrickWallDoor_plural = "Глинобитная стена с дверью",
    object_mudBrickWallLargeWindow = "Стена из кирпича с большим окном",
    object_mudBrickWallLargeWindow_plural = "Глинобитная стена с большим окном",
    object_build_mudBrickWallLargeWindow = "Стена из глинобитного кирпича с большим окном",
    object_build_mudBrickWallLargeWindow_plural = "Стена из глинобитного кирпича с большим окном",
    object_mudBrickColumn = "Колонна из бутового кирпича",
    object_mudBrickColumn_plural = "Колонны из бутового кирпича",
    object_build_mudBrickColumn = "Колонна из кирпича",
    object_build_mudBrickColumn_plural = "Грязекирпичные колонны",
    
    object_stoneBlockWall = "Стена из каменных блоков", --0.4
    object_stoneBlockWall_plural = "Стены из каменных блоков", --0.4
    object_build_stoneBlockWall = "Стена из каменных блоков", --0.4
    object_build_stoneBlockWall_plural = "Стены из каменных блоков", --0.4
    object_stoneBlockWallDoor = "Стена из каменных блоков с дверью", --0.4
    object_stoneBlockWallDoor_plural = "Стена из каменных блоков с дверью", --0.4
    object_build_stoneBlockWallDoor = "Стена из каменного блока с дверью", --0.4
    object_build_stoneBlockWallDoor_plural = "Стена из каменного блока с дверью", --0.4
    object_stoneBlockWallLargeWindow = "Стена из каменных блоков с большим окном", --0.4
    object_stoneBlockWallLargeWindow_plural = "Стена из каменных блоков с большим окном", --0.4
    object_build_stoneBlockWallLargeWindow = "Стена из каменных блоков с большим окном", --0.4
    object_build_stoneBlockWallLargeWindow_plural = "Стена из каменных блоков с большим окном", --0.4
    object_stoneBlockWall4x1 = "Короткая стена из каменных блоков", --0.4
    object_stoneBlockWall4x1_plural = "Короткие стены из каменных блоков", --0.4
    object_build_stoneBlockWall4x1 = "Короткая стена из каменных блоков", --0.4
    object_build_stoneBlockWall4x1_plural = "Короткие стены из каменных блоков", --0.4
    object_stoneBlockWall2x2 = "Квадратная стена из каменных блоков", --0.4
    object_stoneBlockWall2x2_plural = "Квадратные стены из каменных блоков", --0.4
    object_build_stoneBlockWall2x2 = "Квадратная стена из каменных блоков", --0.4
    object_build_stoneBlockWall2x2_plural = "Квадратные стены из каменных блоков", --0.4
    object_stoneBlockRoofEnd = "Торцевая стена крыши из каменных блоков", --0.4
    object_stoneBlockRoofEnd_plural = "Торцевые стены крыши из каменных блоков", --0.4
    object_build_stoneBlockRoofEnd = "Торцевая стена крыши из каменных блоков", --0.4
    object_build_stoneBlockRoofEnd_plural = "Торцевые стены крыши из каменных блоков",--0.4
    object_stoneBlockColumn = "Колонна из каменных блоков", --0.4
    object_stoneBlockColumn_plural = "Колонны из каменных блоков", --0.4
    object_build_stoneBlockColumn = "Колонна из каменных блоков", --0.4
    object_build_stoneBlockColumn_plural = "Колонны из каменных блоков", --0.4

    object_brickWall = "Кирпичная стена",
    object_brickWall_plural = "Кирпичные стены",
    object_build_brickWall = "Кирпичная стена",
    object_build_brickWall_plural = "Кирпичные стены",
    object_brickWallDoor = "Кирпичная стена с дверью",
    object_brickWallDoor_plural = "Кирпичная стена с дверью",
    object_build_brickWallDoor = "Кирпичная стена с дверью",
    object_build_brickWallDoor_plural = "Кирпичная стена с дверью",
    object_brickWallLargeWindow = "Кирпичная стена с большим окном",
    object_brickWallLargeWindow_plural = "Кирпичная стена с большим окном",
    object_build_brickWallLargeWindow = "Кирпичная стена с большим окном",
    object_build_brickWallLargeWindow_plural = "Кирпичная стена с большим окном",
    object_brickWall4x1 = "Кирпичная короткая стена",
    object_brickWall4x1_plural = "Кирпичные короткие стены",
    object_build_brickWall4x1 = "Кирпичная короткая стена",
    object_build_brickWall4x1_plural = "Кирпичные короткие стены",
    object_brickWall2x2 = "Кирпичная квадратная стена",
    object_brickWall2x2_plural = "Кирпичные квадратные стены",
    object_build_brickWall2x2 = "Кирпичная квадратная стена",
    object_build_brickWall2x2_plural = "Кирпичные квадратные стены",
    object_brickRoofEnd = "Кирпичная торцевая стена крыши", --0.4
    object_brickRoofEnd_plural = "Торцевые стены кирпичной крыши", --0.4
    object_build_brickRoofEnd = "Торцевая стена кирпичной крыши", --0.4
    object_build_brickRoofEnd_plural = "Торцевые стены кирпичной крыши",--0.4
    object_splitLogWallLargeWindow = "Бревенчатая стена с большим окном",
    object_splitLogWallLargeWindow_plural = "Стена из бревен с большим окном",
    object_build_splitLogWallLargeWindow = "Стена из бревен с большим окном",
    object_build_splitLogWallLargeWindow_plural = "Стена из бревен с большим окном",
    object_mammothMeat = "Сырое мясо мамонта", --0.3.0 добавлено "Сырое"
    object_mammothMeat_plural = "Сырое мясо мамонта", --0.3.0 добавлено "Сырое"
    object_mammothMeatTBone = "Сырое мясо мамонта", --0.3.0 добавлено "Сырое"
    объект_mammothMeatTBone_plural = "Сырое мясо мамонта", --0.3.0 добавлено "Сырое"
    object_mammothMeatCooked = "Приготовленное мясо мамонта",
    object_mammothMeatCooked_plural = "Приготовленное мясо мамонта",
    object_mammothMeatTBoneCooked = "Приготовленное мясо мамонта",
    object_mammothMeatTBoneCooked_plural = "Приготовленное мясо мамонта",
    object_bronzeIngot = "Бронзовый слиток", --0.4
    object_bronzeIngot_plural = "Бронзовые слитки", --0.4

    --order
    order_idle = "Неработающий",
    order_resting = "Отдыхаю",
    order_multitask_social = "Социализация",
    order_multitask_social_inProgress = "Социализация",
    order_multitask_lookAt = "Смотреть",
    order_multitask_lookAt_inProgress = "Смотреть",

    order_moveToMotivation_bed = "Движение в сторону дома", --0.3.0
    order_moveToMotivation_warmth = "Движение к теплу", --0.3.0
    order_moveToMotivation_light = "Движение к свету", --0.3.0

    order_gather = "Собрать",
    order_gather_inProgress = "Собрать",
    order_chop = "Срубить",
    order_chop_inProgress = "Рубить",
    order_storeObject = "Магазин",
    order_storeObject_inProgress = "Хранить",
    order_transferObject = "Передача",
    order_transferObject_inProgress = "Передача",
    order_destroyContents = "Уничтожить содержимое",
    order_destroyContents_inProgress = "Уничтожить содержимое",
    order_pullOut = "Вырвать",
    order_pullOut_inProgress = "Вытащить",
    order_moveTo = "Переместить",
    order_moveTo_inProgress = "Перемещение",
    order_moveToLogistics = "Передача",
    order_moveToLogistics_inProgress = "Передача",
    order_flee = "Бежать",
    order_flee_inProgress = "Бегство",
    order_sneakTo = "Прокрасться",
    order_sneakTo_inProgress = "Красться",
    order_pickupObject = "Забрать",
    order_pickupObject_inProgress = "Взять",
    order_deliver = "Доставить",
    order_deliver_inProgress = "Доставить",
    order_removeObject = "Расчистить",
    order_removeObject_inProgress = "Расчистить",
    order_buildMoveComponent = "Строить",
    order_buildMoveComponent_inProgress = "Строить",
    order_buildActionSequence = "Строить",
    order_buildActionSequence_inProgress = "Строительство",
    order_eat = "Есть",
    order_eat_inProgress = "Ест",
    order_dig = "Копать",
    order_dig_inProgress = "Копка",
    order_mine = "Шахта",
    order_mine_inProgress = "Добыча",
    order_clear = "Расчистить",
    order_clear_inProgress = "Расчистить",
    order_follow = "Следовать",
    order_follow_inProgress = "Следовать",
    order_social = "Социальный",
    order_social_inProgress = "Общение",
    order_turn = "Поворот",
    order_turn_inProgress = "Поворот",
    order_fall = "Падение",
    order_fall_inProgress = "Падение",
    order_dropObject = "Падение",
    order_dropObject_inProgress = "Падение",
    order_sleep = "Сон",
    order_sleep_inProgress = "Уставший",
    order_light = "Зажечь",
    order_light_inProgress = "Поджиг",
    order_extinguish = "Потушить",
    order_extinguish_inProgress = "Потушить",
    order_throwProjectile = "Охотиться",
    order_throwProjectile_inProgress = "Охотиться",
    order_craft = "Создать",
    order_craft_inProgress = "Крафтинг",
    order_recruit = "Вербовка",
    order_recruit_inProgress = "Вербовка",
    order_sit = "Сидеть",
    order_sit_inProgress = "Сидеть",
    order_playInstrument = "Играть",
    order_playInstrument_inProgress = "Играть",
    order_butcher = "Мясник",
    order_butcher_inProgress = "Разделать",
    order_putOnClothing = "Надеть одежду",
    order_putOnClothing_inProgress = "Надеть одежду",
    order_takeOffClothing = "Снять одежду",
    order_takeOffClothing_inProgress = "Снять одежду",
    order_giveMedicineToSelf = "Лечить", --0.3.0
    order_giveMedicineToSelf_inProgress = "Лечить", --0.3.0
    order_giveMedicineToOtherSapien = "Лечить", --0.3.0
    order_giveMedicineToOtherSapien_inProgress = "Лечить", --0.3.0

    order_fertilize = "Мульчирование", --0.4
    order_fertilize_inProgress = "Мульчирование", --0.4
    order_deliverToCompost = "Компост", --0.4
    order_deliverToCompost_inProgress = "Компостирование", --0.4
    order_chiselStone = "Зубило", --0.4
    order_chiselStone_inProgress = "Долото", --0.4

    

    

    --resource
    resource_branch = "Ветка",
    resource_branch_plural = "Ветки",
    resource_burntBranch = "Сожженная ветка",
    resource_burntBranch_plural = "Сожженные ветки",
    resource_log = "Бревно",
    resource_log_plural = "Бревна",
    resource_rock = "Булыжник (твердый)", --0.4 добавлено "Твердый"
    resource_rock_plural = "Булыжники (твердый)", --0.4 добавлено "Hard"
    resource_rockSoft = "Булыжник (мягкий)", --0.4
    resource_rockSoft_plural = "Булыжники (мягкие)", --0.4
    resource_dirt = "Почва",
    resource_dirt_plural = "Почва",
    resource_hay = "Солома",
    resource_hay_plural = "Солома",
    resource_hayRotten = "Гнилое сено",
    resource_hayRotten_plural = "Гнилое сено",
    resource_grass = "Трава",
    resource_grass_plural = "Трава",
    resource_flaxDried = "Сухой Лен",
    resource_flaxDried_plural = "Сухой Лен",
    resource_sand  = "Песок",
    resource_sand_plural = "Песок",
    resource_rockSmall = "Камень (твердый)", --0.4 добавлено "Твердый"
    resource_rockSmall_plural = "Камени (твердый)", --0.4 добавлено "Hard"
    resource_rockSmallSoft = "Небольшой камень (мягкий)", --0.4
    resource_rockSmallSoft_plural = "Небольшие камни (мягкие)", --0.4
    resource_stoneBlockSoft = "Каменный блок (мягкий)", --0.4
    resource_stoneBlockSoft_plural = "Каменные блоки (мягкие)", --0.4
    resource_stoneBlockHard = "Каменные блоки (твердые)", --0.4
    resource_stoneBlockHard_plural = "Каменные блоки (твердые)", --0.4
    resource_flint = "Кремень",
    resource_flint_plural = "Кремень",
    resource_clay = "Глина",
    resource_clay_plural = "Глина",
    resource_copperOre = "Медная руда",
    resource_copperOre_plural = "Медная руда",
    resource_tinOre = "Руда олова",
    resource_tinOre_plural = "Руда олова",
    resource_manure = "Навоз", --0.4
    resource_manure_plural = "Навоз", --0.4
    resource_manureRotten = "Гнилой навоз", --0,4
    resource_manureRotten_plural = "Гнилой навоз", --0.4
    resource_rottenGoo = "Гнилая слизь", --0.4
    resource_rottenGoo_plural = "Гнилая слизь", --0.4
    resource_compost = "Компост", --0.4
    resource_compost_plural = "Компост", --0.4
    resource_compostRotten = "Гнилой компост", --0.4.1
    resource_compostRotten_plural = "Гнилой компост", --0.4.1
    resource_deadChicken = "Тушка курицы",
    resource_deadChicken_plural = "Куриные тушки",
    resource_deadChickenRotten = "Гнилая куриная тушка",
    resource_deadChickenRotten_plural = "Тухлые куриные тушки",
    resource_deadAlpaca = "Туша альпаки",
    resource_deadAlpaca_plural = "Туши альпак",
    resource_chickenMeat = "Сырое куриное мясо", --0.3.0 добавлено "Сырое"
    resource_chickenMeat_plural = "Сырое куриное мясо", --0.3.0 добавлено "Сырое"
    resource_chickenMeatCooked = "Приготовленное куриное мясо",
    resource_chickenMeatCooked_plural = "Приготовленное куриное мясо",
    resource_pumpkinCooked = "Запеченная тыква",
    resource_pumpkinCooked_plural = "Жареная тыква",
    resource_beetrootCooked = "Жареная свекла",
    resource_beetrootCooked_plural = "Обжаренная свекла",
    resource_flatbread = "Лепешка",
    resource_flatbread_plural = "Лепешки",
    resource_flatbreadRotten = "Заплесневелые лепешки",
    resource_flatbreadRotten_plural = "Заплесневелые лепешки",
    resource_alpacaMeat = "Сырое мясо альпаки", --0.3.0 добавлено "Сырое"
    resource_alpacaMeat_plural = "Сырое мясо альпаки", --0.3.0 добавлено "Сырое"
    resource_alpacaMeatCooked = "Приготовленное мясо альпаки",
    resource_alpacaMeatCooked_plural = "Приготовленное мясо альпаки",
    resource_stoneSpear = "Каменное копье",
    resource_stoneSpear_plural = "Каменные копья",
    resource_stoneSpearHead = "Каменный Наконечник Копья",
    resource_stoneSpearHead_plural = "Наконечники каменных копий",
    resource_stonePickaxe = "Каменная Кирка",
    resource_stonePickaxe_plural = "Stone Pickaxes",
    resource_stonePickaxeHead = "Каменный Наконечник Кирки",
    resource_stonePickaxeHead_plural = "Stone Pickaxe Heads",
    resource_stoneHatchet = "Каменный Топорик",
    resource_stoneHatchet_plural = "Каменные топоры",
    resource_stoneAxeHead = "Головы каменных топоров (Hard)", --0.4 добавлено (Hard)
    resource_stoneAxeHead_plural = "Головы каменных топоров (Hard)", --0.4 добавлено (Hard)
    resource_stoneAxeHeadSoft = "Голова каменного топора (мягкая)", --0.4
    resource_stoneAxeHeadSoft_plural = "Наконечники каменных топоров (мягкие)", --0.4
    resource_stoneHammerHead = "Голова каменного молота", --0.4
    resource_stoneHammerHead_plural = "Наконечники каменных молотов", --0.4
    resource_stoneHammer = "Каменный молот", --0.4
    resource_stoneHammer_plural = "Каменные молоты", --0.4
    resource_bronzeHammerHead = "Голова бронзового молота", --0.4
    resource_bronzeHammerHead_plural = "Головы бронзовых молотов", --0.4
    resource_bronzeHammer = "Бронзовый молот", --0.4
    resource_bronzeHammer_plural = "Бронзовые молоты", --0.4
    resource_stoneKnife = "Каменный Нож",
    resource_stoneKnife_plural = "Каменные Ножи",
    resource_stoneChisel = "Каменное долото", --0.4
    resource_stoneChisel_plural = "Каменные долото", --0.4
    resource_flintSpear = "Кремневое копье",
    resource_flintSpear_plural = "Кремневые копья",
    resource_boneSpear = "Костяное Копье",
    resource_boneSpear_plural = "Костяные копья",
    resource_bronzeSpear = "Бронзовое копье", --0.4
    resource_bronzeSpear_plural = "Бронзовые копья", --0.4
    resource_flintPickaxe = "Кремневая Кирка",
    resource_flintPickaxe_plural = "Кремневые кирки",
    resource_flintHatchet = "Кремневый Топорик",
    resource_flintHatchet_plural = "Кремневые топорики",
    resource_flintSpearHead = "Кремневый Наконечник Копья",
    resource_flintSpearHead_plural = "Наконечники кремневых копий",
    resource_bronzeSpearHead = "Бронзовые наконечники копий", --0.4
    resource_bronzeSpearHead_plural = "Наконечники бронзовых копий", --0.4
    resource_boneSpearHead = "Костяной Наконечник Копья",
    resource_boneSpearHead_plural = "Наконечники костяных копий",
    resource_flintPickaxeHead = "Кремневый Наконечник Кирки",
    resource_flintPickaxeHead_plural = "Наконечники кремневых кирок",
    resource_flintAxeHead = "Голова кремневого топора",
    resource_flintAxeHead_plural = "Головки кремневых топоров",
    resource_bronzeAxeHead = "Голова бронзового топора", --0.4
    resource_bronzeAxeHead_plural = "Наконечники бронзовых топоров", --0.4
    resource_bronzeHatchet = "Бронзовый топор", --0.4
    resource_bronzeHatchet_plural = "Бронзовые топоры", --0.4
    resource_bronzePickaxeHead = "Голова бронзовой кирки", --0.4
    resource_bronzePickaxeHead_plural = "Наконечники бронзовых кирок", --0.4
    resource_bronzePickaxe = "Бронзовая кирка", --0.4
    resource_bronzePickaxe_plural = "Бронзовые кирки", --0.4
    resource_flintKnife = "Каменный Нож",
    resource_flintKnife_plural = "Каменные Ножи",
    resource_boneKnife = "Костяной Нож",
    resource_boneKnife_plural = "Костяные Ножи",
    resource_bronzeKnife = "Бронзовый нож", --0.4
    resource_bronzeKnife_plural = "Бронзовые ножи", --0.4
    resource_bronzeChisel = "Бронзовое зубило", --0.4
    resource_bronzeChisel_plural = "Бронзовое зубило", --0.4
    resource_boneFlute = "Костяная Флейта",
    resource_boneFlute_plural = "Костяные Флейты",
    resource_logDrum = "Бревенчатый барабан",
    resource_logDrum_plural = "Бревенчатые барабаны",
    resource_balafon = "Балафон",
    resource_balafon_plural = "Балафоны",
    resource_woodenPole = "Деревянный шест",
    resource_woodenPole_plural = "Деревянные столбы",
    resource_splitLog = "Доски",
    resource_splitLog_plural = "Доски",
    resource_woolskin = "Шерстяная кожа",
    resource_woolskin_plural = "Шерстяные шкуры",
    resource_bone = "Кость",
    resource_bone_plural = "Кости",
    resource_unfiredUrnWet = "Необожженная урна (мокрая)",
    resource_unfiredUrnWet_plural = "Необожженные урны (мокрые)",
    resource_unfiredUrnDry = "Необожженная урна",
    resource_unfiredUrnDry_plural = "Необожженные урны",
    resource_firedUrn = "Обожженная урна",
    resource_firedUrn_plural = "Обожженные урны",
    resource_unfiredUrnHulledWheat = "Пшеница с шелухой (необожженная урна)",
    resource_unfiredUrnHulledWheat_plural = "Скорлупа пшеницы (необожженная урна)",
    resource_unfiredUrnHulledWheatRotten = "Пшеница с плесенью (необожженная урна)",
    resource_unfiredUrnHulledWheatRotten_plural = "Пшеница с плесенью (необожженная урна)",
    resource_firedUrnHulledWheat = "Пшеница с шелухой (обожженная урна)",
    resource_firedUrnHulledWheat_plural = "Пшеница с шелухой (обожженная урна)",
    resource_firedUrnHulledWheatRotten = "Пшеница с плесенью (обожженная урна)",
    resource_firedUrnHulledWheatRotten_plural = "Пшеница с плесенью (обожженная урна)",
    resource_quernstone = "Ручная мельница",
    resource_quernstone_plural = "Ручная мельница",
    resource_unfiredUrnFlour = "Мука (необожженная урна)",
    resource_unfiredUrnFlour_plural = "Мука (необожженная урна)",
    resource_unfiredUrnFlourRotten = "Заплесневелая мука (необожженная урна)",
    resource_unfiredUrnFlourRotten_plural = "Заплесневелая мука (необожженная урна)",
    resource_firedUrnFlour = "Мука (обожженная урна)",
    resource_firedUrnFlour_plural = "Мука (обожженная урна)",
    resource_firedUrnFlourRotten = "Заплесневелая мука (обожженная урна)",
    resource_firedUrnFlourRotten_plural = "Заплесневелая мука (обожженная урна)",

    --0.3.0 added group start
    resource_unfiredBowlWet = "Необожженная миска (мокрая)",
    resource_unfiredBowlWet_plural = "Необожженные миски (мокрые)",
    resource_unfiredBowlDry = "Необожженная чаша",
    resource_unfiredBowlDry_plural = "Необожженные миски",
    resource_firedBowl = "Обожженная чаша",
    resource_firedBowl_plural = "Обожженные миски",
    
    resource_unfiredBowlInjuryMedicine = "Медицина травм",
    resource_unfiredBowlInjuryMedicine_plural = "Медицина травм",
    resource_unfiredBowlBurnMedicine = "Медицина ожогов",
    resource_unfiredBowlBurnMedicine_plural = "Медицина ожогов",
    resource_unfiredBowlFoodPoisoningMedicine = "Лекарство от пищевого отравления",
    resource_unfiredBowlFoodPoisoningMedicine_plural = "Медицина пищевых отравлений",
    resource_unfiredBowlVirusMedicine = "Лекарство от вирусов (неопалимая купина)",
    resource_unfiredBowlVirusMedicine_plural = "Лекарство от вирусов (необжаренные миски)",
    resource_unfiredBowlMedicineRotten = "Гнилая медицина",
    resource_unfiredBowlMedicineRotten_plural = "Гнилая медицина",

    resource_firedBowlInjuryMedicine = "Медицина травм",
    resource_firedBowlInjuryMedicine_plural = "Медицина травм",
    resource_firedBowlBurnMedicine = "Медицина ожогов",
    resource_firedBowlBurnMedicine_plural = "Медицина ожогов",
    resource_firedBowlFoodPoisoningMedicine = "Медицина пищевых отравлений",
    resource_firedBowlFoodPoisoningMedicine_plural = "Лекарство от пищевого отравления",
    resource_firedBowlVirusMedicine = "Лекарство от вирусов",
    resource_firedBowlVirusMedicine_plural = "Лекарство от вирусов",
    resource_firedBowlMedicineRotten = "Гнилая медицина",
    resource_firedBowlMedicineRotten_plural = "Гнилая медицина",

    --0.3.0 group end

    resource_crucibleWet = "Тиглель (мокрый)", --0.4
    resource_crucibleWet_plural = "Тигли (мокрые)", --0.4
    resource_crucibleDry = "Тигель", --0.4
    resource_crucibleDry_plural = "Тигли", --0.4

    resource_branch_rotten = "Гнилая ветвь",
    resource_branch_rotten_plural = "Гнилые ветки",
    resource_breadDough = "Тесто",
    resource_breadDough_plural = "Тесто",
    resource_breadDoughRotten = "Гнилое хлебное тесто",
    resource_breadDoughRotten_plural = "Гнилое хлебное тесто",
    resource_flaxTwine = "Льняная Веревка",
    resource_flaxTwine_plural = "Льняная Веревка",
    resource_mudBrickWet = "Грязевой кирпич (мокрый)",
    resource_mudBrickWet_plural = "Грязевой кирпич (мокрый)",
    resource_mudBrickDry = "Грязевой кирпич (сухой)",
    resource_mudBrickDry_plural = "Грязевые кирпичи (сухие)",
    resource_firedBrick = "Обожженный кирпич",
    resource_firedBrick_plural = "Обожженный кирпич",
    resource_mudTileWet = "Необожженная плитка (мокрая)",
    resource_mudTileWet_plural = "Необожженная плитка (мокрая)",
    resource_mudTileDry = "Необожженная плитка",
    resource_mudTileDry_plural = "Негофрированная плитка",
    resource_firedTile = "Плитка",
    resource_firedTile_plural = "Плитка",
    resource_bronzeIngot = "Бронзовый слиток", --0.4
    resource_bronzeIngot_plural = "Бронзовые слитки", --0.4
    resource_mammothMeat = "Сырое мясо мамонта", --0.3.0 добавлено "Сырое"
    resource_mammothMeat_plural = "Сырое мясо мамонта", --0.3.0 добавлено "Сырое"
    resource_mammothMeatCooked = "Приготовленное мясо мамонта",
    resource_mammothMeatCooked_plural = "Приготовленное мясо мамонта",

    --resource group
    resource_group_seed = "Зерно",
    resource_group_seed_plural = "Семена",
    resource_group_container = "Большой контейнер", --0.3.0 добавлено "Большой"
    resource_group_container_plural = "Большие контейнеры", --0.3.0 добавлено "Большие"
    resource_group_bowl = "Миска", --0.3.0
    resource_group_bowl_plural = "Чаши", --0.3.0
    resource_group_campfireFuel = "Ветка/Бревно/Топливо",
    resource_group_campfireFuel_plural = "Ветка/Бревно/Топливо",
    resource_group_kilnFuel = "Branch/Log/Fuel",
    resource_group_kilnFuel_plural = "Branches/Logs/Fuel",
    resource_group_torchFuel = "Солома",
    resource_group_torchFuel_plural = "Солома",
    resource_group_brickBinder = "Связующее (сено или песок)",
    resource_group_brickBinder_plural = "Связующее (сено или песок)",
    resource_group_urnFlour = "Мука",
    resource_group_urnFlour_plural = "Мука",
    resource_group_urnHulledWheat = "Очищенная пшеница",
    resource_group_urnHulledWheat_plural = "Очищенная Пшеница",

    --0.3.0 group:
    resource_group_injuryMedicine = "Медицина травм",
    resource_group_injuryMedicine_plural = "Медицина травм",
    resource_group_burnMedicine = "Медицина ожогов",
    resource_group_burnMedicine_plural = "Медицина ожогов",
    resource_group_foodPoisoningMedicine = "Медицина пищевых отравлений",
    resource_group_foodPoisoningMedicine_plural = "Медицина пищевых отравлений",
    resource_group_virusMedicine = "Лекарство от вирусов",
    resource_group_virusMedicine_plural = "Вирусная медицина",

    --0.3.0 group end
    
    resource_group_fertilizer = "Навоз/компост", --0.4
    resource_group_fertilizer_plural = "Навоз/компост", --0.4
    resource_group_compostable = "Гнилой продукт", --0.4
    resource_group_compostable_plural = "Гнилые предметы", --0.4

    resource_group_rockSmallAny = "Маленький камень", --0.4 
    resource_group_rockSmallAny_plural = "Камни", --0.4
    resource_group_rockAny = "Булыжник", --0.4
    resource_group_rockAny_plural = "Булыжники", --0.4
    resource_group_stoneBlockAny = "Каменный блок", --0.4
    resource_group_stoneBlockAny_plural = "Каменные блоки", --0.4

    --desire
    desire_names_none = "Нет",
    desire_names_mild = "Мягкий",
    desire_names_moderate = "Умеренный",
    desire_names_strong = "Сильный",
    desire_names_severe = "Тяжелый",
    desire_sleepDescriptions_none = "Не устал",
    desire_sleepDescriptions_mild = "Слегка устал",
    desire_sleepDescriptions_moderate = "Умеренно устал",
    desire_sleepDescriptions_strong = "Очень устал",
    desire_sleepDescriptions_severe = "Полностью измотан",
    desire_foodDescriptions_none = "Только что поел",
    desire_foodDescriptions_mild = "Не очень голоден",
    desire_foodDescriptions_moderate = "Умеренно голоден",
    desire_foodDescriptions_strong = "Очень голоден",
    desire_foodDescriptions_severe = "Крайне голоден",
    desire_restDescriptions_none = "Очень хорошо отдохнувший",
    desire_restDescriptions_mild = "Довольно хорошо отдохнувший",
    desire_restDescriptions_moderate = "Хочет отдохнуть",
    desire_restDescriptions_strong = "Переутомился",
    desire_restDescriptions_severe = "Сильная усталость",

    -- mood
    mood_happySad_name = "Счастье",
    mood_happySad_severeNegative = "Крайне несчастлив",
    mood_happySad_moderateNegative = "Грустный",
    mood_happySad_mildNegative = "Немного подавлен",
    mood_happySad_mildPositive = "Позитивный",
    mood_happySad_moderatePositive = "Счастливый",
    mood_happySad_severeverePositive = "Очень счастлив",
    mood_confidentScared_name = "Уверенность",
    mood_confidentScared_severeNegative = "Испуганный",
    mood_confidentScared_moderateNegative = "Довольно испуган",
    mood_confidentScared_mildNegative = "Немного обеспокоен",
    mood_confidentScared_mildPositive = "Осторожно уверен",
    mood_confidentScared_moderatePositive = "Уверенный",
    mood_confidentScared_severePositive = "Очень уверенный",
    mood_loyalty_name = "Лояльность племени",
    mood_loyalty_severeNegative = "Неминуемо ухожу",
    mood_loyalty_moderateNegative = "Весьма раздражен",
    mood_loyalty_mildNegative = "Немного раздражен",
    mood_loyalty_mildPositive = "В некоторой степени лоялен",
    mood_loyalty_moderatePositive = "Лояльный",
    mood_loyalty_severePositive = "Очень лояльный",

    -- statusEffects
    statusEffect_justAte_name = "Только что съел",
    statusEffect_justAte_description = "Недавно съел немного еды",
    statusEffect_goodSleep_name = "Хороший сон",
    statusEffect_goodSleep_description = "Спал в кровати под каким-то укрытием",
    statusEffect_learnedSkill_name = "Изучил навык",
    statusEffect_learnedSkill_description = "Недавно выучил новый навык",
    statusEffect_wellRested_name = "Хорошо отдохнул",
    statusEffect_wellRested_description = "Просто хорошо отдохнул от работы",
    statusEffect_hadChild_name = "Родила ребенка",
    statusEffect_hadChild_description = "Недавно у вас родился ребенок",
    statusEffect_optimist_name = "Оптимист",
    statusEffect_optimist_description = "Постоянный эффект, вызванный чертой характера оптимиста",
    statusEffect_minorInjury_name = "Незначительная травма",
    statusEffect_minorInjury_description = "Просто несколько порезов и синяков. Заживут сами, но могут заразиться без лечения.", --0.3.0 изменено, чтобы добавить упоминание о лечении.
    statusEffect_majorInjury_name = "Серьезная травма",
    statusEffect_majorInjury_description = "Может двигаться, но больше не может выполнять работу. Заживет быстрее при правильном лечении или может стать критической.", --0.3.0 изменено для добавления упоминания о лечении
    statusEffect_criticalInjury_name = "Критическая травма",
    statusEffect_criticalInjury_description = "Угрожающая жизни травма. Может заживать медленно, но без лечения может привести к смерти.", --0.3.0 изменено для добавления упоминания о лечении

    --0.3.0 added group start:
    statusEffect_minorBurn_name = "Незначительный ожог",
    statusEffect_minorBurn_description = "Немного болезненный, но должен зажить сам по себе. Может заживать быстрее при правильном лечении",
    statusEffect_majorBurn_name = "Сильный ожог",
    statusEffect_majorBurn_description = "Препятствует определенной деятельности. Может медленно заживать без лечения или стать критическим.",
    statusEffect_criticalBurn_name = "Критический ожог",
    statusEffect_criticalBurn_description = "Ожог, угрожающий жизни",
    statusEffect_minorFoodPoisoning_name = "Незначительное пищевое отравление",
    statusEffect_minorFoodPoisoning_description = "Выздоровеет, но лечитесь правильными лекарствами, чтобы не стало хуже",
    statusEffect_majorFoodPoisoning_name = "Серьезное пищевое отравление",
    statusEffect_majorFoodPoisoning_description = "Больше не может работать. Может медленно восстанавливаться без лечения или может стать критическим",
    statusEffect_criticalFoodPoisoning_name = "Критическое пищевое отравление",
    statusEffect_criticalFoodPoisoning_description = "Состояние, угрожающее жизни",
    statusEffect_minorVirus_name = "Незначительные вирусные симптомы",
    statusEffect_minorVirus_description = "Небольшое сопение, должно пройти само по себе, но без лечения может стать хуже или распространиться на других сапиенсов",
    statusEffect_majorVirus_name = "Серьезная вирусная инфекция",
    statusEffect_majorVirus_description = "Препятствует определенной деятельности. Может стать критической и легко распространится на других сапиенсов",
    statusEffect_criticalVirus_name = "Критическая вирусная инфекция",
    statusEffect_criticalVirus_description = "Чрезвычайно заразен. Без лечения может привести к смерти",
    statusEffect_hypothermia_name = "Гипотермия",
    statusEffect_hypothermia_description = "Необходимо срочно согреться, иначе скоро наступит смерть",
    
    statusEffect_injuryTreated_name = "Травма вылечена",
    statusEffect_injuryTreated_description = "Травма была вылечена и теперь будет заживать быстрее.",
    statusEffect_burnTreated_name = "Ожог вылечен",
    statusEffect_burnTreated_description = "Ожог был вылечен и теперь будет заживать быстрее",
    statusEffect_foodPoisoningTreated_name = "Пищевое отравление вылечено",
    statusEffect_foodPoisoningTreated_description = "Начинаю чувствовать себя лучше",
    statusEffect_virusTreated_name = "Вирус вылечен",
    statusEffect_virusTreated_description = "Выздоравливаю быстрее благодаря правильному лечению",
    --0.3.0 group end

    statusEffect_unconscious_name = "Без сознания",
    statusEffect_unconscious_description = "Не в состоянии двигаться",
    statusEffect_wet_name = "Мокрый",
    statusEffect_wet_description = "Сапиенсы не любят быть мокрыми, от этого им становится еще холоднее. Дайте им высохнуть где-нибудь в тепле",
    statusEffect_wantsMusic_name = "Нужна музыка",
    statusEffect_wantsMusic_description = "Музыкальным сапиенсам необходимо время от времени играть или слушать музыку, иначе они начнут грустить",
    statusEffect_enjoyedMusic_name = "Наслаждается музыкой",
    statusEffect_enjoyedMusic_description = "Недавно играл или слушал музыку.",
    statusEffect_inDarkness_name = "Темнота",
    statusEffect_inDarkness_description = "Недостаточно света. Сапиенсы любят, чтобы было видно, что они делают",

    --negative
    statusEffect_hungry_name = "Голодный",
    statusEffect_hungry_description = "Нуждается в еде в ближайшее время",
    statusEffect_veryHungry_name = "Очень голоден", --0.3.0
    statusEffect_veryHungry_description = "Нуждается в еде очень скоро, иначе начнет голодать.", --0.3.0
    statusEffect_starving_name = "Голодает",
    statusEffect_starving_description = "Отчаянно нуждается в еде",
    statusEffect_sleptOnGround_name = "Спал на земле",
    statusEffect_sleptOnGround_description = "Не было свободных кроватей",
    statusEffect_sleptOutside_name = "Спал на улице",
    statusEffect_sleptOutside_description = "Сапиенсы любят спать под укрытием",
    statusEffect_tired_name = "Устал",
    statusEffect_tired_description = "Нуждается в отдыхе",
    statusEffect_overworked_name = "Переутомился",
    statusEffect_overworked_description = "Всем нужно время от времени отдыхать",
    statusEffect_exhausted_name = "Изможден",
    statusEffect_exhausted_description = "Отчаянно нуждается в отдыхе",
    statusEffect_exhaustedSleep_name = "Уставший",
    statusEffect_exhaustedSleep_description = "Отчаянно нуждается в сне",
    statusEffect_acquaintanceDied_name = "Друг умер",
    statusEffect_acquaintanceDied_description = "Знал кого-то, кто недавно умер",
    statusEffect_acquaintanceLeft_name = "Друг ушел",
    statusEffect_acquaintanceLeft_description = "Знал кого-то, кто недавно покинул племя",
    statusEffect_familyDied_name = "Член семьи умер",
    statusEffect_familyDied_description = "Умер близкий родственник или друг",
    statusEffect_pessimist_name = "Пессимист",
    statusEffect_pessimist_description = "Постоянный эффект, вызванный чертой характера пессимиста",
    statusEffect_cold_name = "Холодно",
    statusEffect_cold_description = "Нужно согреться",
    statusEffect_veryCold_name = "Очень Холодно",
    statusEffect_veryCold_description = "Высокий риск развития гипотермии",
    statusEffect_hot_name = "Жарко",
    statusEffect_hot_description = "Необходимо охладиться",
    statusEffect_veryHot_name = "Очень жарко",
    statusEffect_veryHot_description = "Высокий риск перегрева",

    --fuel
    fuelGroup_campfire = "Топливо для костра",
    fuelGroup_kiln = "Топливо для печей",
    fuelGroup_torch = "Топливо для факелов",
    fuelGroup_litObject = "Топливо",

    --stats
    stats_birth = "Рождения",
    stats_birth_description = "Количество рождений за предыдущий день",
    stats_recruit = "Вербовки",
    stats_recruit_description = "Количество сапиенсов, завербованных за предыдущий день",
    stats_death = "Смерти",
    stats_death_description = "Количество сапиенсов, умерших за предыдущий день",
    stats_leave = "Ушедшие",
    stats_leave_description = "Количество сапиенсов, покинувших племя за предыдущий день",
    stats_population = "Население",
    stats_population_description = "Общее количество сапиенсов в племени",
    stats_populationChild = "Детское население",
    stats_populationChild_description = "Количество детей в племени",
    stats_populationAdult = "Взрослое население",
    stats_populationAdult_description = "Количество взрослых в племени",
    stats_populationElder = "Население старшего возраста",
    stats_populationElder_description = "Количество старейшин в племени",
    stats_populationPregnant = "Беременное население",
    stats_populationPregnant_description = "Количество беременных женщин в племени",
    stats_populationBaby = "Население младенцев",
    stats_populationBaby_description = "Количество младенцев в племени",
    stats_averageHappiness = "Средний % счастья",
    stats_averageHappiness_description = "Средний процент счастья среди всех сапиенсов в племени",
    stats_averageLoyalty = "Средний процент лояльности",
    stats_averageLoyalty_description = "Средний процент лояльности по всем сапиенсам в племени",
    stats_averageSkill = "Среднее количество навыков",
    stats_averageSkill_description = "Среднее количество навыков, которыми обладает каждый сапиенс",
    stats_bedCount = "Количество кроватей",
    stats_bedCount_description = "Количество кроватей, доступных для использования вашими сапиенсами",
    stats_foodCount = "Количество еды",
    stats_foodCount_description = "Количество продуктов питания, хранящихся в ваших складских помещениях",
    stats_resource_description = function(values)
        return string.format("Количество %s в настоящее время хранятся в ваших складских помещениях", values.resourcePlural)
    end,
    stats_currentValue = function(values)
        return string.format("Текущий: %s", values.currentValue)
    end,

    -- nomadTribeBehavior
    nomadTribeBehavior_foodRaid_name = "Набег за едой",
    nomadTribeBehavior_friendlyVisit_name = "Посещение (дружественное)",
    nomadTribeBehavior_cautiousVisit_name = "Посещение (осторожное)",
    nomadTribeBehavior_join_name = "Хочет присоединиться к племени",
    nomadTribeBehavior_passThrough_name = "Проходить",
    nomadTribeBehavior_leave_name = "Уходит",

    -- manageUI
    manage_build = "Строить",
    manage_tribe = "Племя",
    manage_storageLogistics = "Дороги",
    
    -- build ui
    build_ui_build = "Строить",
    build_ui_place = "Декор",
    build_ui_plant = "Сажать",
    build_ui_path = "Тропы",

    --construct ui
    construct_ui_needsDiscovery = "Исследуйте предметы, чтобы сделать необходимый прорыв",
    construct_ui_unseenResources = "Найти или создать необходимый предмет",
    construct_ui_unseenTools = "Найти или создать необходимый инструмент",
    construct_ui_acceptOnly = "Принимать только",
    construct_ui_requires = "Требуется",
    construct_ui_rdisabledInResourcesPanel = "Использование этого ресурса было отключено в панели ресурсов племени",
    construct_ui_discoveryRequired = "Требуется обнаружение",
    construct_ui_discoveryRequired_plantsInfo = "Чтобы выращивать растения и деревья, вашему племени сначала нужно открыть для себя оббивку камня, копание и посадку",
    construct_ui_discoveryRequired_pathsInfo = "Тропы позволяют сапиенсам передвигаться быстрее. Чтобы проложить тропинки, вашему племени сначала нужно открыть копание.",

    --storage ui
    storage_ui_acceptOnly = "Только принимать",
    storage_ui_Unlimited = "Неограниченно",
    storage_ui_RouteDisabled = "Маршрут отключен",
    storage_ui_routeName = function(values)
        return string.format("Маршрут %d", values.count)
    end,
    storage_ui_returnToFirstStop = "Вернитесь на первую остановку, когда закончите",
    storage_ui_returnToFirstStop_toolTip = "После того как сапиенс сдаст предметы на конечной остановке, он снова вернется к первой остановке",
    storage_ui_removeRouteWhenComplete = "Удалить маршрут после завершения",
    storage_ui_removeRouteWhenComplete_toolTip = "Удалить этот маршрут, когда больше не будет остановок, требующих забора",
    storage_ui_maxSapiens = "Максимальное количество сапиенсов",
    storage_ui_clickToAddStops = "Нажмите на зоны хранения, чтобы добавить остановки",
    storage_ui_hit = "Удар",
    storage_ui_whenDone = "Когда сделано",
    storage_ui_NoDestinations = "Нет мест назначения",    
    --resources ui
    resources_ui_allowUse = "Разрешить использование",
    
    -- tribe ui
    tribe_ui_tribe = "Sapiens",
    tribe_ui_roles = "Роли",
    tribe_ui_stats = "Статистика",
    tribe_ui_resources = "Ресурсы",

    --settings ui
    settings_options = "Настройки",
    settings_exit = "Выход",
    settings_header = "Настройки: Основное",
    settings_general = "Основное",
    settings_graphics = "Графика",
    settings_KeyBindings = "Настройка Клавиш",
    settings_Debug = "Debug",
    settings_Exit = "Выход",
    settings_language = "Язык",
    settings_language_tip = "Install more languages from Steam Workshop via the 'Mods' panel in the main menu",
    settings_Controls = "Управление",
    settings_Controls_mouseSensitivity = "Чувствительность Мыши",
    settings_Controls_invertMouseLookY = "Инвертировать по Оси Y",
    settings_Controls_invertMouseWheelZoom = "Инвертировать Колесико Мыши", --b20
    settings_Controls_controllerLookSensitivity = "Чувствительность Контроллера (обзор)",
    settings_Controls_controllerZoomSensitivity = "Чувствительность Контроллера (масштаб)", --0.4
    settings_Controls_invertControllerLookY = "Инвертировать Ось Y Контроллера",
    settings_Controls_enableDoubleTapForFastMovement = "Движение Двойным Нажатием",
    settings_Controls_reticle = "Курсор", --0.4 - refers to the pointer/crosshairs image setting
    settings_Controls_reticleSize = "Размер Курсора", --0.4
    settings_Controls_reticleType_dot = "Dot", --0.4
    settings_Controls_reticleType_bullseye = "Bullseye", --0.4
    settings_Controls_reticleType_crosshairs = "Crosshairs", --0.4
    settings_Audio = "Звук",
    settings_Audio_MusicVolume = "Громкость Музыки",
    settings_Audio_SoundVolume = "Громкость Звуков",
    settings_Other = "Прочее",
    settings_allowLanConnections = "Allow Multiplayer LAN Connections",
    settings_pauseOnLostFocus = "При сворачивании ставить на паузу", --b19
    settings_pauseOnInactivity = "Пауза после неактивности", --0.4
    settings_enableTutorialForThisWorld = "Включить обучение для этой игры",
    settings_enableTutorialForNewWorlds = "Включить обучение для новой игры",
    settings_GeneralGraphics = "Основное",
    settings_graphics_brightness = "Яркость",
    settings_graphics_desktop = "Desktop",
    settings_graphics_Multi = "Multi",
    settings_graphics_Resolution = "Разрешение",
    settings_graphics_Display = "Экран",
    settings_graphics_window = "В окне",
    settings_graphics_Borderless = "Без рамки",
    settings_graphics_FullScreen = "Во весь экран",
    settings_graphics_Relaunch = "Перезапуск",
    settings_graphics_VSync = "VSync",
    settings_graphics_FOV = "FOV",
    settings_Performance = "Производительность",
    settings_Performance_RenderDistance = "Дистанция Отображения",
    settings_Performance_GrassDistance = "Дальность Травы",
    settings_Performance_grassDensity = "Плотность Травы",
    settings_Performance_animatedObjectsCount = "Макс. Анимированных Объектов",
    settings_Performance_ssao = "Глобальное Затемнение",
    settings_Performance_highQualityWater = "Качественные Отражения в Воде", --0.3.0
    settings_Performance_bloomEnabled = "Постэффекты", --0.3.0
    settings_Debug_display = "Debug Display",
    settings_Debug_Cloud = "Cloud",
    settings_Debug_setSunrise = "Set Sunrise",
    settings_Debug_setMidday = "Set Midday",
    settings_Debug_setSunset = "Set Sunset",
    settings_Debug_startLockCamera = "Lock Camera",
    settings_Debug_startServerProfile = "Profile Server",
    settings_Debug_startLogicProfile = "Profile Logic Thread",
    settings_Debug_startMainThreadProfile = "Profile Main Thread",
    settings_exitAreYouSure = "Вы уверены, что хотите выйти из Sapiens?",
    settings_exitAreYouSure_info = "Sapiens постоянно сохраняется во время игры.",
    settings_exitMainMenu = "Выход в Главное Меню",
    settings_exitDesktop = "Выход на Рабочий Стол",
    --stats ui
    ui_stats_days_ago = function(values)
        return string.format("%d дней назад", values.dayCount)
    end,
    ui_stats_now = "Сейчас",

    --roles ui
    ui_roles_allowed = "Назначение",
    ui_roles_disallowed = "Не назначено",

    -- resources ui
    ui_resources_allResourceType = function(values)
        return string.format("Все %s", values.resourceName)
    end,
    ui_resources_storedCount = function(values)
        return string.format("%s хранится", values.storedCount)
    end,
    ui_resources_decorations = "Украшение места",
    ui_resources_eating = "Прием пищи",
    ui_resources_tool = "Инструмент или оружие", --b13
    ui_resources_medicine = "Медицина", --0.3.0

    -- look at ui
    lookatUI_needs = "Потребности",
    lookatUI_missingStorage = "Поблизости нет подходящего или пустого места для хранения",
    lookatUI_missingCraftArea = "Поблизости нет доступного места для ремесла", --0.3.0 added "available"
    lookatUI_missingCampfire = "Нет доступного зажженного костра поблизости", --0.3.0 added "available"
    lookatUI_missingKiln = "Нет доступной зажженной печи поблизости", --0.3.0 added "available"
    lookatUI_missingStorageAreaContainedObjects = "Здесь не хранятся подходящие предметы",
    lookatUI_missingTaskAssignment = function(values)
        return "Ни один способный сапиенс не назначен \"" .. values.taskName .. "\" role"
    end,
    lookatUI_needsTools = function(values)-- b16
        local planInfoString = "Требуется "
        for i,missingToolInfo in ipairs(values.missingToolInfos) do
            planInfoString = planInfoString .. missingToolInfo.toolName
            if missingToolInfo.exampleObjectName and missingToolInfo.exampleObjectName ~= missingToolInfo.toolName then --0.4 modified to only add example if it is present and different.
                planInfoString = planInfoString .. " (eg. " .. missingToolInfo.exampleObjectName .. ")"
            end
            if i ~= #values.missingToolInfos then
                planInfoString = planInfoString .. ", "
            end
        end
        return planInfoString
    end,
    lookatUI_needsResources = function(values)-- b16
        local planInfoString = "Требуется "
        for i,missingResourceString in ipairs(values.missingResources) do
            planInfoString = planInfoString .. missingResourceString
            if i ~= #values.missingResources then
                planInfoString = planInfoString .. ", "
            end
        end
        return planInfoString
    end,
    lookatUI_inaccessible = "Слишком трудно добраться",
    lookatUI_terrainTooSteepFill = "Заполнение создаст слишком крутой склон",
    lookatUI_invalidUnderWater = "Требуется доступ с суши",
    lookatUI_terrainTooSteepDig = "Копание здесь создаст слишком крутой склон",
    lookatUI_needsLit = "Сначала нужно провести освещение",
    lookatUI_disabledDueToOrderLimit = "Все заняты работой",
    lookatUI_tooDark = "Темно! Зажгите факелы или дождитесь рассвета",
    lookatUI_tooDistant = "Поблизости нет способных сапиенсов с требуемой ролью",
    lookatUI_tooDistantWithRoleName = function(values)
        return "No capable sapiens near by with the \"" .. values.taskName .. "\" role"
    end,
    lookatUI_tooDistantRequiresCapable = function(values)
        return "Поблизости нет способных сапиенсов с \"" .. values.taskName .. "\" role (Requires heavy lifting)"
    end,
    lookatUI_missingSuitableTerrain = "Поблизости нет доступной местности требуемого типа", --0.4
    
    sapien_ui_roles = "Роли",
    sapien_ui_inventory = "Инвентарь",
    sapien_ui_relationships = "Семья",

    -- ui actions    
    ui_action_chooseTribe = "Вести это племя",
    ui_action_place = "Разместить",
    ui_action_plant = "Сажать",
    ui_action_build = "Строить",
    ui_action_craft = "Создать",
    ui_action_continue = "Продолжить",
    ui_action_craft_continuous = "Крафтить непрерывно",
    ui_action_assign = "Назначить",
    ui_action_cancel = "Отменить",
    ui_action_cancelling = "Отмена",
    ui_action_stop = "Остановить",
    ui_action_next = "Следующий",
    ui_action_choose = "Выбрать",
    ui_action_set = "Установить",
    ui_action_zoom = "Увеличить",
    ui_action_remove = "Удалить",
    ui_action_manageRoles = "Управлять ролями",
    ui_action_disallowAll = "Отключить все",
    ui_action_allowAll = "Назначить все",
    ui_action_allow = "Назначить",
    ui_action_disallow = "Отменить назначение",
    ui_action_selectMore = "Выбрать больше",
    ui_action_select = "Выбрать",
    ui_action_boxSelect = "Выбор поля",
    ui_action_radiusSelect = "Выбрать радиус",
    ui_action_editName = "Переименовать",
    ui_action_inspectRoute = "Осмотреть маршрут",
    ui_action_assignDifferentSapien = "Назначить другого сапиенса",
    ui_action_assignSapien = "Назначить сапиенса",
    ui_action_prioritize = "Приоритизировать",
    ui_action_manageSapien = function(values)
        return "Manage " .. values.name
    end,
    ui_action_join = "Присоединиться",
    ui_action_createWorld = "Создать Мир",
    ui_action_credits = "Титры",
    ui_action_exit = "Выход",
    ui_action_reportBug = "Сообщить об ошибке",
    ui_action_importReports = "Импортировать отчеты",
    ui_action_wishlist = "Добавить в список желаний",
    ui_action_wishlistNow = "Добавить в список желаний сейчас!",
    ui_action_sendFeedback = "Отправить отзыв",
    ui_action_apply = "Применить",
    ui_action_dontShowAgain = "Не показывать это снова",
    ui_action_attemptToPlayAnyway = "Попытка воспроизведения в любом случае",
    ui_action_setFillType = "Установить тип заливки",
    ui_action_update = "Обновить", --b20
    ui_action_OK = "OK", --b20

    --ui plans
    ui_plan_unavailable_stopOrders = "Сначала отмените другие заказы",
    ui_plan_unavailable_multiSelect = "Слишком много выбранных",
    ui_plan_unavailable_missingKnowledge = "Нехватает Знаний",
    ui_plan_unavailable_investigatedElsewhere = "Кем-то другим",
    ui_plan_unavailable_extinguishFirst = "Тушить первым",
    ui_plan_unavailable_alreadyTreated = "Уже лечится", --0.3.0, для лечебных задач, лечение уже проведено
    

    -- ui buildMode
    ui_buildMode_fail_needsAttachment = "Необходимо прикрепить к чему-то",
    ui_buildMode_fail_collidesWithObjects = "Что-то мешает",
    ui_buildMode_fail_tooSteep = "Склон слишком крутой",
    ui_buildMode_fail_underwater = "Нельзя строить под водой",
    ui_buildMode_plantFail_tooDistant = "Слишком далеко",
    ui_buildMode_plantFail_notTerrain = "Должен быть посажен в грунт",
    ui_buildMode_plantFail_badMedium = function(values)
        return "Cannot be planted in " .. values.terrainName
    end,
    ui_buildMode_fail_belowTerrain = "Невозможно строить ниже рельефа местности",
    fill_summary = function(values)
        if values.requiredResourceCount > 1 then
            return string.format("Заполните местность %d %s", values.requiredResourceCount, values.resourceTypeNamePlural)
        else
            return "Заполните местность " .. values.resourceTypeNamePlural
        end
    end,
    ui_cantDoTasks = function(values)
        if values.pregnant then
            return "Не может выполнять эти задачи из-за беременности."
        elseif values.hasBaby then
            return "Не может выполнять эти задачи во время вынашивания ребенка."
        elseif values.child then
            return "Дети не могут выполнять эти задачи."
        elseif values.elder then
            return "Старики не могут выполнять эти задачи."
        elseif values.maxAssigned then
            return "Максимальное количество назначенных ролей"
        end
        return "Не может выполнять задания из-за ограниченных возможностей."
    end,
    ui_partiallyCantDoTasks = function(values)
        if values.pregnant then
            return "Некоторые из этих задач не могут быть выполнены из-за беременности."
        elseif values.hasBaby then
            return "Некоторые из этих задач не могут быть выполнены во время вынашивания ребенка."
        elseif values.child then
            return "Дети не могут выполнять некоторые из этих задач."
        elseif values.elder then
            return "Старики не могут выполнять некоторые из этих задач."
        end
        return "Некоторые из этих задач не могут быть выполнены из-за ограниченных возможностей."
    end,
    ui_cantDoTasksShort = function(values)
        if values.pregnant then
            return "Беременные"
        elseif values.hasBaby then
            return "Переноска ребёнок"
        elseif values.child then
            return "Ребенок"
        elseif values.elder then
            return "Старик"
        elseif values.maxAssigned then
            return "Максимально назначенный"
        end
        return "Ограниченные возможности"
    end,
    ui_missingTaskAssignment = function(values)
        return "Not assigned the \"" .. values.taskName .. "\" role"
    end,
    ui_portionCount = function(values)
        if values.portionCount == 1 then
            return string.format("1 порция")
        else
            return string.format("%d порции", values.portionCount)
        end
    end,
    

    -- ui names
    ui_name_traits = "Черты",
    ui_name_skillFocus = "Фокус умений",
    ui_name_relationships = "Семья",
    ui_name_tasks = "Роли",
    ui_name_move = "Перемещение",
    ui_name_moveAndWait = "Двигаться и ждать",
    ui_name_assignBed = "Назначить кровать", --b20
    ui_name_mapMode = "Карта мира",
    ui_name_changeAssignedSapien = "Выбрать сапиенса для назначения",
    ui_name_tutorial = "Обучение",
    ui_name_terrain = "Местность",
    ui_name_craftCount = "Количество крафтов",
    ui_name_ipAddress = "IP Address/Host",
    ui_name_port = "Port (default 16161)",
    ui_name_notApplicable = "N/A",
    ui_name_today = "Сегодня",
    ui_name_yesterday = "Вчера",
    ui_daysAgo = function(values)
        return string.format("%d дней назад", values.count)
    end,
    ui_name_lastPlayed = "Last Played",
    ui_name_created = "Создано",
    ui_name_lastPlayedVersion = "Последняя сыгранная версия",
    ui_name_worldAge = "Возраст мира (игровые дни)", --b20
    ui_name_seed = "Зерно",
    ui_name_manage = "Управление", --b20
    ui_name_saves = "Сохранения",
    ui_name_load = "Загрузить",
    ui_name_deleteWorld = "Удалить мир",
    ui_name_changeMods = "Изменить моды", --b20
    ui_name_updateMod = "Обновить мод", --b20
    ui_name_steamOverlayDisabled = "Требуется Steam Overlay", --b20

    
    -- ui infos
    ui_info_deleteWorldAreYouSure = function(values)
        return string.format("Вы уверены, что хотите удалить мир %s? Это нельзя отменить, сохранение игры исчезнет навсегда.", values.worldName)
    end,    
    ui_info_bindingPopUpViewInstructions = "Нажмите и отпустите клавиши для назначения этой привязки.",
    ui_info_bindingTimeRemaining = function(values)
        return string.format("Возвращается in %d seconds...", values.seconds)
    end,
    ui_info_changeModAreYouSure = "Вы уверены, что хотите изменить моды для этого мира?\n\nЭто может привести к тому, что мир не загрузится, поэтому сначала нужно сделать резервную копию каталога мира.", --b20
    ui_info_updateModAreYouSure = function(values) --b20
        return string.format("Вы уверены, что хотите обновить мод %s?\n\nЭто не может быть отменено и может вызвать сбой загрузки мира.\n\nЭто скопирует последнюю версию (%s) мода в каталог этого мира, перезаписывая старую версию (%s).\n\nВы должны сначала создать резервную копию каталога мира.", values.modName, values.newVersion, values.oldVersion)
    end,  
    ui_info_steamOverlayDisabled = "Эта функция требует наличия Steam Overlay.\n\nВы можете включить Steam Overlay в приложении Steam, либо для всех игр, либо только для Sapiens.", --b20


    ui_pause = "Пауза",
    ui_play = "Начать",
    ui_fastForward = "Быстро",

    ui_objectBelongingToSapien = function(values) --b20
        return string.format("%s's %s", values.sapienName, values.objectName)
    end,  

    tribeUI_sapien = "Сапиен",
    tribeUI_distance = "Расстояние",
    tribeUI_age = "Возраст",
    tribeUI_happiness = "Счастлив",
    tribeUI_loyalty = "Лояльность",
    tribeUI_effects = "Эффекты",
    tribeUI_roles = "Роли",
    tribeUI_skills = "Навыки",
    tribeUI_population = "Население",

    --misc
    misc_no_summary_available = "Резюме недоступно",
    misc_missing_name = "Нет имени",
    misc_none_assigned = "Не назначено",
    misc_place_object_summary = "Поместить в любую точку мира для украшения",
    misc_undiscovered = "Не обнаружено",
    misc_dry = "Сухой",
    misc_newBreakthrough = "Новое Достижение!",
    misc_unlocks = "Открыто", --0.3.0 изменено с "Разблокировано"
    misc_pregnant = "Беременна",
    misc_carryingBaby = "Вынашивание ребенка",
    misc_unnamed = "Неназванный",
    misc_inside = "Под крышей",
    misc_outside = "На улице",
    misc_acceptAll = "Принимать все",
    misc_uncheckDestroyFirst = "Невозможно принять все с помощью Destroy All Items",
    misc_acceptNone = "Не принимать",
    misc_route = "Маршрут",
    misc_items = "Предметы",
    misc_specialOrders = "Специальные заказы",
    misc_allowItemUse = "Разрешить использование предмета",
    misc_itemUseNotAllowed = "Использование элемента не разрешено",
    misc_removeAllItems = "Удалить все предметы",
    misc_destroyAllItems = "Уничтожить все предметы",
    misc_routes = "Дороги",
    misc_addStops = "Добавить остановки",
    misc_addNewRoute = "Добавить новый маршрут",
    misc_addNewRouteStartingHere = "Добавить новый маршрут, начинающийся здесь",
    misc_setFillType = "Установить тип заполнения",
    misc_debug = "Отладка",
    misc_cheat = "Обманывать",
    misc_fmodCredit = "Для воспроизведения звука Sapiens использует FMOD Studio от Firelight Technologies Pty Ltd.",
    misc_version = "Версия",
    misc_demo = "Демо",
    misc_forums = "Форумы Sapiens",
    misc_discord = "Sapiens Discord",
    misc_twitter = "Sapiens в Twitter",
    misc_serverNotFound = "Не удалось найти сервер",
    misc_serverNotFound_info = "Сервер может быть не в сети или недоступен",
    misc_connectionLost = "Соединение потеряно",
    misc_connectionLost_info = "Соединение с сервером было потеряно",
    misc_random = "Случайно",
    misc_randomVariation = "Случайная вариация",
    misc_variations = "Вариации",
    misc_skilled = "Квалифицированный",
    misc_noSelection = "Без выбора",
    misc_unavailable = "Недоступно",
    misc_elsewhere = "Уже исследуется",
    misc_cantDoPlan = function(values)
        return string.format("Не могу %s", values.planName)
    end,
    
    misc_settings = "Настройки",
    misc_continuous = "Непрерывный",
    misc_Empty = "Пустой",
    misc_Unknown = "Неизвестный",
    misc_Rebinding = "Переплетать",
    misc_NotLoaded = "Не загружен",
    misc_Toggle = "Переключить",
    misc_Biome = "Биом",
    misc_BiomeDifficulty = "Сложность локации", --b20
    misc_BiomeDifficulty_veryEasy = "Очень легко", --b20
    misc_BiomeDifficulty_easy = "Легко", --b20
    misc_BiomeDifficulty_normal = "Нормально", --b20
    misc_BiomeDifficulty_hard = "Hard", --b20
    misc_BiomeDifficulty_veryHard = "Очень сложно", --b20
    misc_WIP_Panel = "Эта панель еще не готова, скоро будет готова!",
    misc_decorate_with = function(values)--b13
        return string.format("Украсить %s", values.name)
    end,

    misc_compostNotEnoughMaterialStored = "Накоплено недостаточно материала, добавьте больше гнилых элементов", --0.4
    misc_compostNextInLessThanAnHour = "Следующий компост будет готов через < 1 часа", --0.4
    misc_compostNextInXHours = function(values) --0.4
        return string.format("Следующий компост готов в %d часы", values.hours)
    end,
    misc_compostPreviousWasLessThanAnHour = "Последний компост был произведен < 1 часа назад", --0.4
    misc_compostPreviousWasXHours = function(values) --0.4
        return string.format("Последний произведенный компост %d несколько часов назад", values.hours)
    end,
    
    misc_disabled = "Отключен", --0.4
    misc_maxQuantity = "Макс. количество", --0.4
    misc_max = "Максимум", --0.4

    --loading
    loading_connecting = "Подключение к серверу",
    loading_connected = "Подключен к серверу",
    loading_loadingShaders = "Загрузка шейдеров",
    loading_waiting = "Ожидание сервера",
    loading_generating = "Генерация",
    loading_world = "Загрузка",
    loading_downloadingData = "Загрузка данных/модов мира",
    loading_downloading = "Загрузка",
    loading_loading = "Загрузка",

    -- lifeStages
    lifeStages_child = "Ребенок",
    lifeStages_adult = "Взрослый",
    lifeStages_elder = "Старик",

    --sapienTrait
    sapienTrait_charismatic = "Харизматичный",
    sapienTrait_loyal = "Лояльный",
    sapienTrait_courageous = "Мужественный",
    sapienTrait_courageous_opposite = "Боязливый",
    sapienTrait_strong = "Сильный",
    sapienTrait_focused = "Сосредоточенный",
    sapienTrait_logical = "Логичный",
    sapienTrait_creative = "Творческий",
    sapienTrait_clever = "Быстро обучаемый",
    sapienTrait_clever_opposite = "Медленный ученик",
    sapienTrait_lazy = "Ленивый",
    sapienTrait_lazy_opposite = "Энергичный",
    sapienTrait_longSleeper = "Долго спящий",
    sapienTrait_longSleeper_opposite = "Рано встающий",
    sapienTrait_glutton = "Обжора",
    sapienTrait_glutton_opposite = "Маленький едок",
    sapienTrait_optimist = "Оптимист",
    sapienTrait_optimist_opposite = "Пессимист",
    sapienTrait_musical = "Музыкальный",
    sapienTrait_musical_opposite = "Глухой",
    sapienTrait_immune = "Сильный иммунитет", --0.3.0
    sapienTrait_immune_opposite = "Слабый иммунитет", --0.3.0

    --skill
    skill_gathering = "Разнорабочий",
    skill_gathering_description = "Таскать предметы, убирать траву и собирать ресурсы с растений и деревьев",
    skill_basicBuilding = "Строительство",
    skill_basicBuilding_description = "Строить базовые предметы, такие как кровати и ремесленные/складские помещения, а также размещать предметы",
    skill_woodBuilding = "Стр. из Досок",
    skill_woodBuilding_description = "Строить сооружения из дерева",
    skill_basicResearch = "Изучение",
    skill_basicResearch_description = "Исследовать объекты, чтобы совершить открытия и продвинуть знания племени",
    skill_diplomacy = "Дипломатия",
    skill_diplomacy_description = "Вдохновить других сапиенсов присоединиться к вашему племени и остаться в нем, или убедить их уйти",
    skill_fireLighting = "Разведение Огня",
    skill_fireLighting_description = "Огонь обеспечивает тепло и свет, а также позволяет приготовить пищу, чтобы повысить ее питательную ценность.",
    skill_knapping = "Разбить Камни",
    skill_knapping_description = "Для создания примитивных каменных орудий и раскалывания на мелкие камни",
    skill_flintKnapping = "Работы с кремнем",
    skill_flintKnapping_description = "Создавать кремневые инструменты, которые служат дольше и острее",
    skill_boneCarving = "Резьба по Кости",
    skill_boneCarving_description = "Make sharp blades and musical instruments from bone.",
    skill_flutePlaying = "Музыка",--the key is flutePlaying, but the translation should be for playing all instruments eg "Музыка"
    skill_flutePlaying_description = "Music helps to unite your tribe, increasing loyalty and happiness for those near by.",
    skill_pottery = "Гончарство",
    skill_pottery_description = "Изготовление урн и глиняных кирпичей",
    skill_potteryFiring = "Керамика",
    skill_potteryFiring_description = "Обжигать урны и кирпичи",
    skill_spinning = "Прядение Льна",
    skill_spinning_description = "Создавать бечевки и веревки из растительных волокон",
    skill_thatchBuilding = "Стр. из Соломы",
    skill_thatchBuilding_description = "Строить простые укрытия из сена, тростника и веток",
    skill_mudBrickBuilding = "Каменная кладка", --0.4 изменен с кирпичного строительства на каменную кладку, теперь применяется ко всем зданиям из кирпича/блоков
    skill_mudBrickBuilding_description = "Строить сооружения из кирпичей и каменных блоков.", --0.4 изменено на "кирпичи и каменные блоки" с "глинобитные кирпичи".
    skill_brickBuilding = "Постройки из Кирпича", --deprecated (0.4)
    skill_brickBuilding_description = "Строить сооружения из обожженного кирпича.", --deprecated (0.4)
    skill_tiling = "Черепица",
    skill_tiling_description = "Строить крыши, полы и дорожки из керамической плитки",
    skill_basicHunting = "Охота",
    skill_basicHunting_description = "Охотиться на мелкую добычу, бросая простые снаряды",
    skill_spearHunting = "Ул. Охота",
    skill_spearHunting_description = "Охотиться на более крупную и быструю добычу, метая копья",
    skill_butchery = "Мясник",
    skill_butchery_description = "Разделка туш на мясо, шкуры и кости",
    skill_campfireCooking = "Готовка",
    skill_campfireCooking_description = "Готовьте мясо, чтобы обеспечить большую питательную ценность",
    skill_baking = "Выпечка",
    skill_baking_description = "Замешивать муку в тесто для хлеба и выпекать его, чтобы создать питательное блюдо",
    skill_treeFelling = "Рубка деревьев",
    skill_treeFelling_description = "Рубить деревья с помощью ручных инструментов",
    skill_woodWorking = "Деревообработка",
    skill_woodWorking_description = "Делать вещи из веток и бревен",
    skill_toolAssembly = "Инструменты",
    skill_toolAssembly_description = "Создавать более сложные инструменты, соединяя несколько компонентов",
    skill_medicine = "Медицина", --0.3.0
    skill_medicine_description = "Делать и применять припарки и лекарства, чтобы помочь раненым или больным.", --0.3.0
    skill_digging = "Копка",
    skill_digging_description = "Копать и заполнять почву, пески и глины",
    skill_mining = "Горное дело",
    skill_mining_description = "Добывать твердые материалы, такие как камень и руда.", --0.4 добавлено "и руда".
    skill_planting = "Посев",
    skill_planting_description = "Сажать семена для выращивания деревьев и культур",
    skill_mulching = "Мульчирование",
    skill_mulching_description = "Улучшить почву с помощью навоза или компоста",
    skill_threshing = "Молотьба",
    skill_threshing_description = "Обмолотить зерна, чтобы они были готовы к помолу или приготовлению пищи",
    skill_grinding = "Помол", --0.3.0 добавлено Зерно
    skill_grinding_description = "Измельчать зерна, чтобы открыть содержащиеся в них питательные вещества",
    skill_blacksmithing = "Кузнечное дело", --0.4
    skill_blacksmithing_description = "Переплавка руды и создание инструментов из металла", --0.4
    skill_chiselStone = "Резьба по Камню", --0.4
    skill_chiselStone_description = "Выбивать каменные блоки прямо из скалистой земли.", --0.4

    --storage
    storage_rockSmall = "Камни",
    storage_seed = "Семена",
    storage_rock = "Булыжники",
    storage_log = "Бревна",
    storage_woodenPole = "Деревянные столбы",
    storage_woolskin = "Шерстяные шкуры",
    storage_bone = "Кости",
    storage_pineCone = "Сосновые Шишки",
    storage_pineConeBig = "Большие сосновые шишки",
    storage_deadChicken = "Тушки цыплят",
    storage_beetroot = "Свеклу",
    storage_flower = "Цветы", --0.3.0
    storage_gingerRoot = "Корни имбиря", --0.3.0
    storage_turmericRoot = "Корни Куркумы", --0.3.0
    storage_garlic = "Чеснок", --0.3.0
    storage_aloeLeaf = "Листья алоэ", --0.3.0
    storage_wheat = "Пшеница",
    storage_flax = "Лен",
    storage_knife = "Ножи",
    storage_axeHead = "Наконечник Топора",
    storage_hammerHead = "Голова Молотка", --0.4
    storage_hammer = "Молотки", --0.4
    storage_pickaxeHead = "Наконечник Кирки",
    storage_pickaxe = "Кирки",
    storage_hatchet = "Топоры",
    storage_branch = "Ветки",
    storage_spearHead = "Spear Heads",
    storage_raspberry = "Малина",
    storage_peach = "Персики",
    storage_flatbread = "Лепешки",
    storage_spear = "Копья",
    storage_dirt = "Почва",
    storage_flint = "Кремень",
    storage_clay = "Глина",
    storage_sand = "Песок",
    storage_orange = "Апельсины",
    storage_splitLog = "Доски",
    storage_chickenMeat = "Куриное Мясо",
    storage_hayGrass = "Солома",
    storage_deadAlpaca = "Туши альпак",
    storage_apple = "Яблоки",
    storage_elderberry = "Ягоды Бузины", --0.3.0
    storage_banana = "Бананы",
    storage_coconut = "Кокосы",
    storage_alpacaMeat = "Мясо альпаки",
    storage_gooseberry = "Крыжовник",
    storage_pumpkin = "Тыквы",
    storage_urn = "Урны",
    storage_bowl = "Чаши", --0.3.0
    storage_quernstone = "Ручная мельница",
    storage_breadDough = "Тесто",
    storage_brick = "Кирпичи",
    storage_mammothMeat = "Мясо мамонта",
    storage_flaxTwine = "Льняная Веревка",
    storage_boneFlute = "Костяные Флейты",
    storage_logDrum = "Бревенчатые барабаны",
    storage_balafon = "Балафоны",
    storage_tile = "Плитка",

    storage_copperOre = "Медная руда", --0.4
    storage_tinOre = "Руда олова", --0.4
    storage_manure = "Навоз", --0.4
    storage_rottenGoo = "Гнилая слизь", --0.4
    storage_compos = "Компост", --0.4
    storage_crucible = "Крусиблы", --0.4
    storage_ingot = "Слитки", --0.4
    storage_chisel = "Зубила", --0.4
    storage_stoneBlock = "Каменные блоки", --0.4

    -- constructable_classification
    constructable_classification_build = "Здания",
    constructable_classification_build_action = "Строить",
    constructable_classification_plant = "Растения/деревья",
    constructable_classification_plant_action = "Сажать",
    constructable_classification_craft = "Изготовленные предметы",
    constructable_classification_craft_action = "Создать",
    constructable_classification_path = "Тропы",
    constructable_classification_path_action = "Строить",
    constructable_classification_place = "Объект места",
    constructable_classification_place_action = "Разместить",
    constructable_classification_fill = "Заполнить местность",
    constructable_classification_fill_action = "Заполнить",
    constructable_classification_research = "Открытия",
    constructable_classification_research_action = "название исследования",
    constructable_classification_fertilize = "Мульчировать", --0.4
    constructable_classification_fertilize_action = "Мульча", --0.4

    --evolution
    evolution_dryAction = "Сушит",
    evolution_rotAction = "Сгнивает",
    evolution_despawnAction = "Уходит",
    evolution_time_verySoon = "Очень скоро",
    evolution_time_fewHours = "Через несколько часов",
    evolution_time_fewDays = "Через несколько дней",
    evolution_time_nextYear = "В следующем году",
    evolution_time_fewYears = "Через несколько лет",
    evolution_time_whenUsable = "Когда можно использовать", --0.3.0. Will stay in current state until "Allow use" is selected
    evolution_timeFunc = function(values)
        return values.actionName .. " " .. values.time
    end,

    -- time
    time_year = "Год",
    time_year_plural = "Лет",
    time_day = "День",
    time_day_plural = "Дней",
    time_second = "Секунда",
    time_second_plural = "Секунды",
    time_hour = "Час", --0.4
    time_hour_plural = "Часы", --0.4

    --weather
    weather_temperatureZone_veryCold = "Очень Холодно",
    weather_temperatureZone_cold = "Холодно",
    weather_temperatureZone_moderate = "Тепло",
    weather_temperatureZone_hot = "Жарко",
    weather_temperatureZone_veryHot = "Очень жарко",

    -- keyMaps
    keygroup_game = "Игра",
    keygroup_menu = "Меню",
    keygroup_movement = "Движение",
    keygroup_building = "Здание",
    keygroup_textEntry = "Ввод текста",
    keygroup_debug = "Отладка",
    keygroup_multiSelect = "Мультивыбор",
    keygroup_cinematicCamera = "Кинематографическая камера",

    -- key_game
    key_game_escape = "Закрыть/скрыть",
    key_game_chat = "Чат",
    key_game_toggleMap = "Карта",
    key_game_confirm = "Подтвердить/Ввести",
    key_game_confirmSpecial = "Вторичное подтверждение",
    key_game_menu = "Открыть меню",
    key_game_buildMenu = "Открыть меню сборки",
    key_game_buildMenu2 = "Открыть меню сборки (альтернативное)",
    key_game_tribeMenu = "Открыть меню племени",
    key_game_routesMenu = "Открыть меню маршрутов",
    key_game_settingsMenu = "Открыть меню настроек",
    key_game_zoomToNotification = "Увеличить до уведомления",
    key_game_pause = "Пауза/Снять паузу",
    key_game_speedFast = "Переключить время ускорения",
    key_game_speedSlowMotion = "Замедление скорости игры",
    key_game_radialMenuShortcut1 = "Ярлык радиального меню 1",
    key_game_radialMenuShortcut2 = "Ярлык радиального меню 2",
    key_game_radialMenuShortcut3 = "Ярлык радиального меню 3",
    key_game_radialMenuShortcut4 = "Ярлык радиального меню 4",
    key_game_radialMenuShortcut5 = "Ярлык радиального меню 5",
    key_game_radialMenuShortcut6 = "Ярлык радиального меню 6", --0.3.0
    key_game_radialMenuAutomateModifier = "Модификатор параметров радиального меню", --0.4 modified, changed "Automate" to "Options"
    key_game_radialMenuDeconstruct = "Радиальное меню Удалить/уничтожить",
    key_game_moveCommandAddWaitOrderModifier = "Переместить Сапиена - добавить модификатор порядка ожидания", --0.4
    key_game_zoomModifier = "Модификатор масштабирования щелчком мыши",
    key_game_multiselectModifier = "Модификатор щелчка с множественным выбором",
    key_game_radialMenuClone = "Построение радиального меню Подробнее",--b13

    -- key_menu
    key_menu_up = "Up",
    key_menu_down = "Down",
    key_menu_left = "Left",
    key_menu_right = "Right",
    key_menu_select = "Выбрать",
    key_menu_selectAlt = "Выбрать (альтернатива)",
    key_menu_back = "Назад",
    
    -- key_movement
    key_movement_forward = "Forward",
    key_movement_back = "Back",
    key_movement_left = "Left",
    key_movement_right = "Right",
    key_movement_slow = "Slow",
    key_movement_fast = "Fast",
    key_movement_forwardAlt = "Forward (Alternative)",
    key_movement_backAlt = "Back (Alternative)",
    key_movement_leftAlt = "Left (Alternative)",
    key_movement_rightAlt = "Right (Alternative)",
    key_movement_zoomIn = "Zoom In", --0.4
    key_movement_zoomOut = "Zoom Out", --0.4

    key_building_cancel = "Отмена",
    key_building_confirm = "Подтвердить",
    key_building_zAxisModifier = "Axis Switch / Disable Snapping",
    key_building_adjustmentModifier = "Placement Fine Tune Modifier",
    key_building_noBuildOrderModifier = "Placement No Build Order Modifier",
    key_building_rotateX = "Rotate 90 on X axis",
    key_building_rotateY = "Rotate 90 on Y axis",
    key_building_rotateZ = "Rotate 90 on Z axis",
    key_textEntry_backspace = "Backspace",
    key_textEntry_send = "Отправка/Ввод",
    key_textEntry_newline = "Новая строка",
    key_textEntry_prevCommand = "Предыдущий",
    key_textEntry_nextCommand = "Следующий",

    -- key_multiSelect
    key_multiSelect_subtractModifier = "Модификатор Вычитание",

    -- key_debug
    key_debug_reload = "Перезагрузка",
    key_debug_lockCamera = "Заблокировать камеру",
    key_debug_setDebugObject = "Установить объект отладки",

    -- key_cinematicCamera
    key_cinematicCamera_startRecord1 = "Начать запись 1",
    key_cinematicCamera_startRecord2 = "Запуск записи 2",
    key_cinematicCamera_startRecord3 = "Начать запись 3",
    key_cinematicCamera_startRecord4 = "Запуск записи 4",
    key_cinematicCamera_startRecord5 = "Начать запись 5",
    key_cinematicCamera_play1 = "Воспроизвести 1",
    key_cinematicCamera_play2 = "Воспроизвести 2",
    key_cinematicCamera_play3 = "Воспроизвести 3",
    key_cinematicCamera_play4 = "Воспроизвести 4",
    key_cinematicCamera_play5 = "Воспроизвести 5",
    key_cinematicCamera_stop = "Остановить воспроизведение",
    key_cinematicCamera_insertKeyframe = "Вставить ключевой кадр",
    key_cinematicCamera_saveKeyframe = "Сохранить ключевой кадр",
    key_cinematicCamera_removeKeyframe = "Удалить ключевой кадр",
    key_cinematicCamera_nextKeyframe = "Следующий ключевой кадр",
    key_cinematicCamera_prevKeyframe = "Предыдущий ключевой кадр",
    key_cinematicCamera_increaseKeyframeDuration = "+ Продолжительность ключевого кадра",
    key_cinematicCamera_decreaseKeyframeDuration = "- Keyframe Duration",

    -- selection groups
    selectionGroup_branch_objectName = "Ветка",
    selectionGroup_branch_plural = "Ветки",
    selectionGroup_branch_descriptive = "Любые филиалы",
    selectionGroup_log_objectName = "Бревно",
    selectionGroup_log_plural = "Бревна",
    selectionGroup_log_descriptive = "Любые журналы",
    selectionGroup_rock_objectName = "Камень",
    selectionGroup_rock_plural = "Камни",
    selectionGroup_rock_descriptive = "Любые камни",
    selectionGroup_smallRock_objectName = "Маленький камень",
    selectionGroup_smallRock_plural = "Камни",
    selectionGroup_smallRock_descriptive = "Любые мелкие камни",
    
    selectionGroup_stoneBlock_objectName = "Каменные блоки", --0.4
    selectionGroup_stoneBlock_plural = "Каменные блоки", --0.4
    selectionGroup_stoneBlock_descriptive = "Любые каменные блоки", --0.4
    
    -- notifications
    notification_becamePregnant = function(values)
        return values.name .. " is pregnant"
    end,
    notification_babyBorn = function(values)
            local gender = "Девушка"
            if not values.babyIsFemale then
                gender = "Мальчик"
            end
        return values.parentName .. "родила ребенка " .. gender
    end,
    notification_babyGrew = function(values)
        return values.parentName .. "'ребенок вырос и ребенок был назван " .. values.childName
    end,
    notification_agedUp = function(values)
            if values.lifeStageName then
            return values.name .. " теперь является " .. string.lower(values.lifeStageName)
            end
        return values .. " постарел"
    end,
    notification_died = function(values)
        return values.name .. " умер от " .. string.lower(values.deathReason) --0.3.0 changed from "has died. reason:"
    end,
    notification_left = function(values)
        return values.name .. " покинул племя."
    end,
    notification_lowLoyalty = function(values)
        return values.name .. " может скоро покинуть племя."
    end,
    notification_recruited = function(values)
        return values.name .. " присоединился к вашему племени"
    end,
    notification_skillLearned = function(values)
        return values.name .. " узнал " .. values.skillName .. " skill"
    end,
    notification_newTribeSeen = function(values)
        return "Было замечено еще одно племя"
    end,
    notification_discovery = function(values)
        return "Ваше племя открыло для себя " .. values.skillName .. "!"
    end,
    notification_craftableDiscovery = function(values) --0.3.0
        return "Ваше племя узнало, как создавать " .. values.craftablePlural .. "!"
    end,
    notification_researchNearlyDone = function(values)
        return "Прорыв почти завершен!"
    end,
    notification_mammothKill = function(values)
        return values.name .. " убил мамонта"
    end,

    --[[notification_minorInjuryByMob = function(values) --0.3.0 these have been removed, replaced by notification_triggerActionHuntingMob combined with notification_minorInjury
        return values.name .. " был ранен " .. values.mobTypeName
    end,]]
    --[[notification_majorInjuryByMob = function(values)
        return values.name .. " был серьезно ранен " .. values.mobTypeName
    end,
    notification_criticalInjuryByMob = function(values)
        return values.name .. " был тяжело ранен " .. values.mobTypeName
    end,]]

    --b13
    notification_majorInjuryDeveloped = function(values)
        return values.name .. "'травма стала основной"
    end,
    notification_criticalInjuryDeveloped = function(values)
        return values.name .. "'травма стала критической"
    end,
    --/b13

    
    --0.3.0
    notification_triggerActionCrafting = function(values)
        return "ремесленничество " .. string.lower(values.craftablePlural)
    end,
    notification_triggerActionResearching = function(values)
        return "исследование"
    end,
    notification_triggerActionDeliveringFuel = function(values)
        return "доставка топлива в " .. string.lower(values.objectName)
    end,
    notification_triggerActionHuntingMob = function(values)
        return "охота " .. getAorAn(string.lower(values.mobTypeName)) .. " " .. string.lower(values.mobTypeName) --0.3.6 modified
    end,
    notification_triggerActionBasic = function(values)  --values.actionName is also available
        return string.lower(values.actionInProgress)
    end,
    
    notification_minorInjury = function(values)
        return values.name .. " был ранен во время " .. values.triggerAction
    end,
    notification_majorInjury = function(values)
        return values.name .. " был серьезно ранен во время " .. values.triggerAction
    end,
    notification_criticalInjury = function(values)
        return values.name .. " был тяжело ранен во время " .. values.triggerAction
    end,
    notification_minorInjuryBy = function(values) --0.3.6 added
        return values.name .. " был ранен " .. getAorAn(string.lower(values.objectName)) .. " " .. string.lower(values.objectName)
    end,
    notification_majorInjuryBy = function(values) --0.3.6 added
        return values.name .. " был серьезно ранен " .. getAorAn(string.lower(values.objectName)) .. " " .. string.lower(values.objectName)
    end,
    notification_criticalInjuryBy = function(values) --0.3.6 added
        return values.name .. " был тяжело ранен " .. getAorAn(string.lower(values.objectName)) .. " " .. string.lower(values.objectName)
    end,
    notification_minorBurn = function(values)
        return values.name .. " был сожжен, пока " .. values.triggerAction
    end,
    notification_majorBurn = function(values)
        return values.name .. " сильно обгорел, пока " .. values.triggerAction
    end,
    notification_criticalBurn = function(values)
        return values.name .. " олучил серьезные ожоги во время " .. values.triggerAction
    end,
    notification_majorBurnDeveloped = function(values)
        return values.name .. "'ожог стал основным"
    end,
    notification_criticalBurnDeveloped = function(values)
        return values.name .. "'ожог стал критическим"
    end,
    notification_minorFoodPoisoning = function(values)
        return values.name .. " у него расстройство желудка после еды " .. values.resourceName
    end,
    notification_minorFoodPoisoningFromContamination = function(values)
        return values.name .. " у него расстройство желудка после еды " .. values.resourceName .. " contaminated by " .. values.contaminationResourceName
    end,
    notification_majorFoodPoisoningDeveloped = function(values)
        return values.name .. " теперь у него серьезный случай пищевого отравления"
    end,
    notification_criticalFoodPoisoningDeveloped = function(values)
        return values.name .. " сейчас находится в критическом состоянии из-за пищевого отравления"
    end,
    notification_minorVirus = function(values)
        return values.name .. " подхватил вирус и проявляет незначительные симптомы"
    end,
    notification_majorVirusDeveloped = function(values)
        return values.name .. "'симптомы ухудшились, теперь у них серьезная инфекция"
    end,
    notification_criticalVirusDeveloped = function(values)
        return values.name .. " сейчас находится в критическом состоянии из-за вирусной инфекции"
    end,
    notification_starving = function(values)
        return values.name .. " голодает"
    end,
    notification_starvingRemoved = function(values)
        return values.name .. " больше не голодает"
    end,
    notification_veryHungry = function(values)
        return values.name .. " очень голоден"
    end,
    notification_veryHungryRemoved = function(values)
        return values.name .. " больше не голоден"
    end,
    notification_hypothermia = function(values)
        return values.name .. " развилась гипотермия"
    end,
    notification_hypothermiaRemoved = function(values)
        return values.name .. " больше не страдает гипотермией"
    end,

    notification_minorInjuryHealed = function(values)
        return values.name .. "'травма полностью зажила"
    end,
    notification_majorInjuryBecameMinor = function(values)
        return values.name .. "'травма улучшается"
    end,
    notification_criticalInjuryBecameMajor = function(values)
        return values.name .. "'травма больше не является критической"
    end,
    notification_minorBurnHealed = function(values)
        return values.name .. "'ожог полностью зажил"
    end,
    notification_majorBurnBecameMinor = function(values)
        return values.name .. "'ожог улучшается"
    end,
    notification_criticalBurnBecameMajor = function(values)
        return values.name .. "'ожог больше не является критическим"
    end,
    notification_minorFoodPoisoningHealed = function(values)
        return values.name .. "'пищевое отравление полностью прошло"
    end,
    notification_majorFoodPoisoningBecameMinor = function(values)
        return values.name .. "'болезнь пищевого отравления улучшается"
    end,
    notification_criticalFoodPoisoningBecameMajor = function(values)
        return values.name .. "'болезнь пищевого отравления больше не является критической"
    end,
    notification_minorVirusHealed = function(values)
        return values.name .. " больше не болен и не заразен"
    end,
    notification_majorVirusBecameMinor = function(values)
        return values.name .. "'вирусная инфекция проходит"
    end,
    notification_criticalVirusBecameMajor = function(values)
        return values.name .. "'вирусная инфекция больше не является критической"
    end,

    notification_windDestruction = function(values) --0.4. values.name is not a sapien's name, it is an object's name like "Thatch Roof/Hut"
        return "A " .. values.name .. " был поврежден ветром"
    end,
    notification_rainDestruction = function(values) --0.4. values.name is not a sapien's name, it is an object's name like "Thatch Roof/Hut"
        return "A " .. values.name .. " был поврежден дождем"
    end,
    
    notification_addWindBlownAdjective = function(values) --0.4 Used in a wind storm eg: "Bob was majorly injured by a 'flying banana'"
        return "летающим " .. string.lower(values.objectName)
    end,

    deathReason_criticalInjury = "Критическая травма",
    deathReason_oldAge = "Старость",
    deathReason_burn = "Критический ожог",
    deathReason_foodPoisoning = "Пищевое отравление",
    deathReason_virus = "Вирусная инфекция", 
    deathReason_starvation = "Голодание", 
    deathReason_hypothermia = "Гипотермия",
    
    --/0.3.0
    

    -- menues
    menu_createWorld = "Создать Мир",
    menu_worldName = "Название Мира",
    menu_seed = "Зерно",
    menu_seaLevel = "Уровень Моря",
    menu_rainfall = "Осадки",
    menu_temperature = "Температура",
    menu_continentSize = "Размеры Континента",
    menu_continentHeight = "Высота Континента", --0.4 modified
    menu_featureSize = "Горы", --0.4 modified
    menu_featureHeight = "Высота Гор", --0.4 modified
    menu_mods = "Моды",

    --bug reporting
    reporting_uploading = "Загрузка",
    reporting_zipFailed = "Извините, что-то пошло не так при создании пакета отчета.",
    reporting_connectionFailed = "Извините, не удалось подключиться к серверу ошибок.",
    reporting_uploadFailed = "Извините, загрузка пакета отчета об ошибке не удалась.",
    reporting_fileTooLarge = "Извините, созданный пакет отчета об ошибке слишком велик для загрузки.",
    reporting_error = "Извините, что-то пошло не так",
    reporting_uploadComplete = "Спасибо за ваш отчет, он был отправлен успешно.",
    reporting_cancelled = "Загрузка отменена.",
    reporting_creating = "Спасибо. Создаю отчет...",
    reporting_infoText = "Пожалуйста, помогите нам сделать Sapiens лучше! Отчет будет загружен в фоновом режиме после того, как вы нажмете кнопку отправить. Спасибо.",
    reporting_pleaseWriteATitle = "Пожалуйста, дайте краткое описание этого сообщения об ошибке.",
    reporting_bugTitle = "Краткое описание",
    reporting_bugDescription = "Более подробное описание",
    reporting_email = "Контактный адрес электронной почты (необязательно)",
    reporting_sendLogFiles = "Отправить файлы журнала",
    reporting_sendWorldSaveFiles = "Отправить файлы сохранения мира",
    reporting_submitViaEmail = "Отправить по электронной почте",
    reporting_submitViaForums = "Отправить через форумы",
    reporting_sendBugReport = "Отправить Отчет об Ошибке",
    reporting_sendCrashReport = "Отправить отчет об аварии",

    reporting_crashNotification = "Похоже, что Sapiens потерпел крушение, когда вы играли.\n\
Мы хотим исправить ошибку, вызвавшую это, поэтому, пожалуйста, пришлите нам отчет о сбое. Спасибо!",

    --mods
    mods_cautionCaps = "CAUTION!",

    mods_cautionInfo = "Моды могут содержать и выполнять как Lua, так и C код, который может иметь доступ к вашей системе, файлам и сети.\n\n\
Моды в Sapiens никак не защищены в песочнице, поэтому к ним следует относиться как к совершенно отдельным приложениям и с особой осторожностью. Они могут нанести вред вашему компьютеру.\n\n\
Даже моды, установленные из Steam Workshop, могут быть небезопасны. Устанавливайте и включайте моды только от авторов, которым вы доверяете.",
    mods_enableMods = "Включить моды",
    mods_notAddedToWorkshop = "Not added to Steam Workshop.",
    mods_addedToWorkshop = "Added to Steam Workshop. Click upload to update mod files on Steam.",
    mods_modDeveloperTools = "Mod Developer Tools",
    mods_AddToSteamWorkshop = "Add To Steam Workshop",
    mods_ContactingSteam = "Contacting Steam",
    mods_acceptAgreement = "You need to accept the Steam Workshop legal agreement first. After you have accepted, click upload.",
    mods_idReceived = "ID received. By submitting this item, you agree to the workshop terms of service at:\nhttp://steamcommunity.com/sharedfiles/workshoplegalagreement\nClick upload to update mod files on Steam.",
    mods_failedToSaveID = "Failed to save Steam ID to",
    mods_failedToAddToSteam = "Failed to add to Steam.",
    mods_UploadToSteam = "Upload To Steam",
    mods_replaceDescription = "Send updated info (eg. description) from modInfo.lua", --0.3.0
    mods_Uploadcomplete = "Upload complete.",
    mods_failedToUploadToSteam = "Failed to upload to Steam.",
    mods_nameDefault = "No Name",
    mods_descriptionDefault = "No Description",
    mods_versionDefault = "No Version",
    mods_developerDefault = "Unknown Developer",
    mods_version = "Версия",
    mods_developer = "Developer",
    mods_gameMods = "Game mods",
    mods_gameMods_info = "App-wide, applies to all worlds.",
    mods_worldMods = "World mods",
    mods_worldMods_info = "Only configurable per world.", --b20 changed from "Only configurable when creating a new world.", as now they can be changed for existing worlds in the saves menu
    mods_configureWorldMods = "Configure mods for this world",
    mods_configureWorldMods_info = "World mods enabled here apply to this world only. The currently installed versions of enabled mods will be copied and stored with the world save on creation. You can also enable/disable or update world mods from the \"Saves\" panel later.", --b20 changed as now they can be changed for existing worlds in the saves menu
    mods_configureGameMods = "Настройка игровых модификаций",
    mods_configureGameMods_info = "Game mods apply to the entire game, and affect your experience in every world. Only these type of app-wide mods can be enabled here.\nWorld mods affect worlds more directly, and can be enabled from the Mods button in the world creation screen, or from the \"Saves\" panel.",
    mods_findMods = "Find mods on Steam->",
    mods_makeMods = "Make your own mods->",
    mods_websiteLink = "Website ->",
    mods_steamLink = "Steam Page ->",
    mods_filesLink = "Files Location ->",
    mods_visitSteamWorkshopLink = "Visit Steam Workshop->",
    mods_steamWorkshop = "Steam Workshop",

    mods_steamWorkshop_info = "You can browse Steam Workshop to find and install mods, which can then be enabled in the game.\n\
Ensure you have the Steam overlay enabled. Once you find a mod you want on Steam Workshop, you install it by clicking '+ Subscribe'. However, Steam will then need to download the mod in the background before it will become available. For quick results, you may need to restart Steam, wait until the download has completed, and then relaunch Sapiens.\n\
BE CAREFUL! Install mods at your own risk. Even when installed from Steam Workshop, mods can contain and run code that could harm your computer. Only install and enable mods from mod authors that you trust.",

    -- graphics drivers
    gfx_updateRequiredTitle = "Пожалуйста, обновите драйвер вашей видеокарты.",
    gfx_updateRequired_info = "The driver that has been detected on this system is out of date.\n\nIf you do not update your driver, it will likely cause graphical glitches and/or the game might crash and exit to the desktop while playing.\n\nPlease download and install the latest driver from your graphics card manufacturer. Your graphics card is:",

    --intro
    intro_a = function(values)
        return "На протяжении тысячелетий сапиенсы исследовали " .. values.worldName .. ".\n\nМаленькие племена разбросаны по всему миру. Путешествия, собирательство, охота и выживание."
    end,
    intro_b = "Эти сапиенсы счастливы, но их ограничивает недостаток знаний и амбиций.\n\nВ одиночку они могут выжить, но никогда не смогут полностью раскрыть свой потенциал.",
    intro_c = "Вам предстоит стать хранителем племени сапиенсов. Вы дадите им направление и цель.\n\nВаша цель - побудить их учиться, развиваться и расти, и в конечном итоге создать процветающую цивилизацию сапиенсов.",
    intro_d = "Те, кого вы выберете для руководства, станут родоначальниками всего человеческого рода.\n\nВыбирайте свое племя с умом.",

    -- gameFailSequence
    gameFailSequence_a = "Поскольку их потребности не удовлетворялись, численность ваших сапиенсов сокращалась.\n\nК сожалению, последний оставшийся член вашего племени только что ушел..",
    gameFailSequence_b = "К счастью, рядом есть другие небольшие племена, готовые последовать вашему примеру.\n\nВыберите новое племя для продолжения.",

    --tips/tutorial
    tutorial_skip = "Пропустить Обучение",
    tutorial_skipAreYouSure = "Вы уверены, что хотите пропустить обучение?\nВы можете включить его снова позже в меню настроек.",
    tutorial_or = "или",

    -- choose tribe
    tutorial_title_chooseTribe = "Выберите племя для руководства",
    tutorial_subtitle_mapNavigation = "Навигация по карте",
    tutorial_use = "Использовать",
    tutorial_toMoveAnd = "Двигаться и",
    tutorial_toZoom = "увеличить",
    tutorial_subtitle_chooseTribe_title = "Вести племя",
    tutorial_subtitle_chooseTribe_a = "- Увеличить масштаб, затем кликнуть на несколько разных племен",
    tutorial_subtitle_chooseTribe_b = "и выберите одно из них для руководства",
    -- Gathering hay
    tutorial_title_basicControls = "Сбор сена",
    tutorial_basicControls_storyText = "Вашим сапиенсам нужно будет где-то спать сегодня ночью, а из сена получается отличная кровать. Давайте уберем немного травы, чтобы она высохла и могла быть использована для постели",
    tutorial_basicControls_navigation = "Перемещайтесь по миру",
    tutorial_basicControls_issueOrder = "Прикажите своему племени очистить траву",
    tutorial_issueOrder_instructions_a = "- Нажмите на травянистую землю рядом с вашим племенем и выберите",
    tutorial_issueOrder_instructions_b = "Расчистить",
    tutorial_basicControls_clearHexes = function(values)
        return string.format("Очистить %d травяную плитку", values.count) 
    end,

    -- storingResources
    tutorial_title_storingResources = "Зоны для Хранения",
    tutorial_storingResources_storyText = "Для хранения и управления всеми ресурсами, которые находит и изготавливает ваше племя, вам понадобятся Зоны для Хранения.\n\nКаждая область хранения хранит только один тип ресурсов, поэтому по мере продвижения вам нужно будет построить много других, по крайней мере, по одному для каждого типа ресурсов.",
    tutorial_storingResources_build = function(values)
        return string.format("Построй %d зону для хранения", values.count) 
    end,
    tutorial_storingResources_subTitle_accessWith = "- Получить доступ к меню сборки с помощью",
    tutorial_storingResources_subTitle_andPlace = "- Размещайте места хранения рядом с вашим племенем",
    tutorial_storingResources_store = function(values)
        return string.format("Склад %d %s", values.count, values.typeName) 
    end,
    tutorial_storingResources_storeTip_a = "- Возможно, вам придется подождать, пока трава высохнет",
    tutorial_storingResources_storeTip_b = "Вы можете собирать ветки с деревьев",

    -- game speed controls
    tutorial_title_speedControls = "Управление скоростью игры",
    tutorial_subtitle_togglePause = "Включить паузу с",
    tutorial_subtitle_toggleFastForward = "Включить перемотку вперед",

    --multiselect
    tutorial_title_multiselect = "Выбор нескольких объектов",
    tutorial_description_multiselect = "Вы можете выбрать сразу много объектов или тайлов местности, а затем отдать или отменить приказы для всех них одновременно.\n\nЭто особенно полезно при расчистке больших площадей или сборе урожая с большого количества деревьев.",
    tutorial_task_multiselect = function(values)
        return string.format("Издать любой приказ о %d или несколько вещей одновременно", values.count) 
    end,
    tutorial_task_multiselect_subtitle = "- Нажмите на любой объект или наземную плитку",
    tutorial_task_multiselect_subtitle_b = "- Нажмите \"Выбрать еще\"",
    tutorial_task_multiselect_subtitle_c = "- Издать любой приказ для всех из них",

    -- beds
    tutorial_title_beds = "Сон на кроватях",
    tutorial_beds_storyText = "Сапиенсы будут счастливее, если будут спать на кровати, а не на твердой земле. Так что теперь, когда у нас накопилось достаточно сена, давайте построим несколько кроватей",
    tutorial_beds_build = function(values)
        return string.format("Place %d or more beds", values.count) 
    end,
    tutorial_beds_subTitle_accessWith = "- Доступ к меню сборки с помощью",
    tutorial_beds_subTitle_andPlace = "- Разместить кровати рядом с вашим племенем",
    tutorial_beds_waitForBuild = "Подождите, пока кровати будут завершены",
    tutorial_beds_waitForBuild_tip = "- При необходимости очистите больше травы, чтобы создать больше сена",

    --roleAssignment
    tutorial_title_roleAssignment = "Как назначать роли",
    tutorial_description_roleAssignment = "Когда сапиенс открывает для себя новую технологию, он становится специалистом в ней, и ему автоматически назначается роль, позволяющая выполнять задания, связанные с этим навыком.\n\nРоли сапиенсам тоже следует назначать вручную. Это поможет занять всех, и позволит вам сосредоточить ваше племя на тех областях, где они больше всего нужны.",
    tutorial_task_roleAssignment = "Назначить сапиенса на новую роль",
    tutorial_task_roleAssignment_subtitle_a = "- Нажать",
    tutorial_task_roleAssignment_subtitle_b = "затем выберите меню племени",
    tutorial_task_roleAssignment_subtitle_c = "- Выберите \"Роли\"",
    tutorial_task_roleAssignment_subtitle_d = "- Назначить сапиенса на любую роль",
    
    -- research
    tutorial_title_research = "Исследуйте для прогресса",
    tutorial_research_storyText = "Чтобы продвигаться вперед, sapiens должны исследовать окружающий их мир.Это приводит к технологическим прорывам, которые открывют новые возможности для созидания и крафта.",
    tutorial_research_branch = "Исследуйте ветку",
    tutorial_research_rock = "Исследуйте камень",
    tutorial_research_hay = "Исследуйте солому",
    
    -- tools
    tutorial_title_tools = "Зоны для Крафта и Инструменты",
    tutorial_tools_storyText = "Понимая, что такое обтесывание камней, сапиенсы теперь могут создавать инструменты.\n\nРучные топоры и ножи очень полезны для начала, поэтому ваше племя должно создать несколько таких топоров уже сейчас.\n\nЛучший способ управлять ремесленной деятельностью вашего племени - сначала построить специальные ремесленные зоны.",
    tutorial_tools_buildCraftAreas = function(values)
        return string.format("Построить %d ремесленные участки", values.count) 
    end,
    tutorial_tools_craftHandAxes = function(values)
        return string.format("Изготовление и хранение %d каменных ручных топоров", values.count) 
    end,
    tutorial_tools_craftKnives = function(values)
        return string.format("Изготовление и хранение %d каменных ножей", values.count) 
    end,
    
    -- fire
    tutorial_title_fire = "Разожгите огонь",
    tutorial_fire_storyText = "Огонь - важное раннее открытие, которое дает свет ночью, помогает согревать племя в холодное время года и позволяет готовить пищу..\n\nСейчас самое время развести костер.",
    tutorial_fire_place = "Разведите костер",
    tutorial_fire_waitForBuild = "Подождите, пока костер будет разведен и зажжен",
    
    -- thatchBuilding
    tutorial_title_thatchBuilding = "Постройки из соломы",
    tutorial_thatchBuilding_storyText = "С новым пониманием строительства из соломы, сейчас самое время для племени начать работу над некоторыми основными структурами.\n\nСапиенсы будут счастливее, если их кровати будут под навесом, а ресурсы, хранящиеся под крышей, будут храниться дольше.",
    tutorial_thatchBuilding_place = "Постройте соломенный навес/крышу",
    tutorial_thatchBuilding_waitForBuild = "Дождитесь, пока структура будет готова",
    
    -- food
    tutorial_title_food = "Голод и еда",
    tutorial_food_storyText = "Ваши сапиенсы начинают голодать. Сапиенсы не собирают фрукты самостоятельно, вам нужно отдавать приказы по сбору, охоте и хранению пищи.\n\nОднако не собирайте все сразу, большинство плодов продержатся на дереве до следующего сезона, но быстро сгниют, если их сорвать и оставить на улице",
    tutorial_food_storeTask = function(values)
        return string.format("Собрать и сохранить %d пищевых ресурсов", values.count) 
    end,
    tutorial_food_storeTask_subTitle = "Фрукты растут на некоторых видах деревьев и кустарников",
    
    -- farming
    tutorial_title_farming = "Сельское хозяйство",
    tutorial_farming_storyText = "Теперь, когда насущные потребности племени удовлетворены, нам нужно начать планировать на будущее.\n\nПо мере роста племени им нужно будет выращивать достаточно продукции, чтобы прокормить всех..",
    tutorial_farming_digging = "Откройте земляные работы",
    tutorial_farming_planting = "Откройте посадку",
    tutorial_farming_plantXTrees = function(values)
        return string.format("Посадить %d плодоносящих деревьев или растений", values.count) 
    end,
    
    -- music
    tutorial_title_music = "Играем музыку",
    tutorial_music_storyText = "Музыка делает сапиенсов счастливее и преданнее, а музыкальные сапиенсы могут даже грустить, если долгое время не слышали и не слушали музыку",
    tutorial_music_discoverBoneCarving = "Откройте для себя резьбу по кости",
    tutorial_music_playFlute = "Играть на музыкальном инструменте", --0.3.0 changed to "musical instrument" as drums and balafons now count for completion too
    
    -- routes
    tutorial_title_routes = "Маршруты и логистика",
    tutorial_routes_storyText = "Сапиенсы могут перемещать ресурсы из одной зоны хранения в другую с помощью маршрутов.\n\nМаршруты полезны для распределения ресурсов там, где они необходимы. Они также могут использоваться для передачи ресурсов на большие расстояния",
    tutorial_routes_create = "Создать маршрут передачи",
    tutorial_routes_create_subtitle_a = "- Вызовите меню и нажмите кнопку \"Маршруты\"",
    tutorial_routes_create_subtitle_b = "- Добавить новый маршрут, затем нажмите кнопку \"Добавить остановки\"",
    tutorial_routes_create_subtitle_c = "- Щелкните на исходной области хранения",
    tutorial_routes_create_subtitle_d = "- Затем нажмите на пустую область хранения назначения",
    tutorial_routes_doTransfer = "Перенести любой предмет из одной области хранения в другую",
    
    -- paths
    tutorial_title_paths = "Тропы и дороги",
    tutorial_paths_storyText = "Сапиенсы могут быстрее передвигаться по тропам, что делает ваше племя более эффективным",
    tutorial_paths_buildXPaths = function(values)
        return string.format("Построить %d сегментов пути", values.count)  
    end,
    
    -- woodBuilding
    tutorial_title_woodBuilding = "Строительство из дерева",
    tutorial_woodBuilding_storyText = "Хижины из соломы лучше, чем ничего, но вашему племени придется начать строить из более современных материалов, чтобы их новая цивилизация выдержала испытание временем",
    tutorial_woodBuilding_chopTree = "Срубить дерево",
    tutorial_woodBuilding_splitLog = "Распилить бревно",
    tutorial_woodBuilding_buildWall = "Построить что-нибудь, используя расколотые бревна.", --0.3.0 -changed from "build a split log wall" as any split log buildable now counts
    -- advancedTools
    tutorial_title_advancedTools = "Изготовление усовершенствованных инструментов",
    tutorial_advancedTools_storyText = "Присоединив простые каменные инструменты к деревянной рукоятке, ваше племя сможет сделать более совершенные инструменты, которые прослужат дольше, позволят выполнять некоторые задачи быстрее и откроют возможность охотиться на более крупную добычу.",
    tutorial_advancedTools_driedFlax = function(values)
        return string.format("Найти, собрать и сохранить %d сушеного льна", values.count) 
    end,
    tutorial_advancedTools_twine = function(values)
        return string.format("Изготовление и хранение %d бечевка/веревка", values.count) 
    end,
    tutorial_advancedTools_pickAxe = "Создать топор для кирки",
    tutorial_advancedTools_spear = "Создать копье",
    tutorial_advancedTools_hatchet = "Создать топор",
    -- cookingMeat
    tutorial_title_cookingMeat = "Приготовление мяса",
    tutorial_cookingMeat_storyText = "После удачной охоты вашим сапиенсам нужно подготовить тушу, чтобы она была готова к употреблению. Для этого им нужно разделать тушу, а затем приготовить мясо",
    tutorial_cookingMeat_butcher = "Разделывать тушу",
    tutorial_cookingMeat_cook = "Приготовить мясо",
    -- worldMap
    tutorial_title_worldMap = "Карта мира",
    tutorial_worldMap_task = "Посмотреть на мир сверху с помощью",
    -- recruitment
    tutorial_title_recruitment = "Вербовка",
    tutorial_recruitment_storyText = "Иногда кочевые племена будут бродить по этой местности или приходить в поисках пищи.\n\nЭто хорошая возможность для роста племени, поскольку многие решат присоединиться, если мы их пригласим..",
    tutorial_recruitment_task = "Пригласить посетителя присоединиться к племени",

    -- orderLimit
    tutorial_recruitment_task = "Пригласить посетителя присоединиться к племени",
    tutorial_orderLimit_storyText = function(values)
        return string.format("Ваши сапиенсы всегда будут выбирать ближайший доступный заказ, который соответствует их роли и потребностям, поэтому важно не ставить в очередь слишком много заказов, которые на самом деле не нужны.\n\nЧтобы помочь вам в этом, в племени существует ограничение в %d заказов на одного сапиенса. После этого они будут игнорировать новые заказы, пока не будут выполнены предыдущие.\n\nЕсли заказ отмечен желтым треугольником с \"Достигнуто максимальное количество заказов\", затем вы можете установить приоритет в радиальном меню.",
            values.allowedPlansPerFollower)
    end,
    tutorial_orderLimit_task = "Установите приоритет в любом обозначенном порядке \"Достигнуто максимальное количество заказов\"",
    
    -- notifications
    tutorial_title_notifications = "Уведомления",
    tutorial_notifications_task = "Увеличить масштаб последнего уведомления",

    --food poisoning added 0.3.0
    tutorial_title_foodPoisoning = "Пищевое отравления",
    tutorial_foodPoisoning_storyText = "Сапиенсы могут получить пищевое отравление, если сырое и вареное мясо хранятся вместе.\n\nВы можете предотвратить это, управляя областями хранения, чтобы разрешить хранение только определенных типов объектов.",
    tutorial_foodPoisoning_configureRawMeat = "Настройте зону хранения таким образом, чтобы в ней можно было хранить только сырое мясо",
    tutorial_foodPoisoning_configureCookedMeat = "Настройте зону хранения таким образом, чтобы в ней можно было хранить только приготовленное мясо",
    --/0.3.0

    -- completion
    tutorial_title_completion = "Обучение завершен!",
    tutorial_completion_storyText = "Молодец!\n\nВаше племя только начинает свою работу, но дальше вы уже сами по себе.\n\nПродолжайте исследовать, заниматься ремеслом, изучать и развивать свое племя. Заботьтесь о своих сапиенсах, стройте шумный город, ведите свое племя к новому и процветающему будущему.\n\nУдачи!",

    --done
    tutorial_subtitle_movement = "Движение:",
    tutorial_subtitle_zoom = "Увеличение:",
    tutorial_subtitle_movementSpeed = "Двигаться быстрее или медленнее:",
    tutorial_title_worldNavigation = "Навигация по миру",
    tutorial_title_investigate = "Исследования и прорывы",
    tutorial_subtitle_investigateLine1 = "Исследование предметов приводит к открытиям, которые открывают новые возможности для ремесла и строительства",
    tutorial_subtitle_investigateLine2 = "Выберите камень или ветку и исследуйте ее",
    buildContext_title = "Управление",
    buildContext_placeTitle = "Разместить: ",
    buildContext_place = "Разместить",
    buildContext_placeRefine = "Разместить и расчистить: ",
    buildContext_placeWithoutBuild = "Разместить без постройки: ",
    buildContext_cancel = "Отмена: ",
    buildContext_rotate = "Вращение: ",
    buildContext_rotate90 = "Вращение на 90 градусов: ",
    buildContext_moveXZ = "Двигать горизонтально: ",
    buildContext_moveY = "Двигать вверх/вниз: ",
    buildContext_disableSnapping = "Без привязки: ",

    --mouse
    mouse_left = "Левая кнопка мыши",
    mouse_right = "Правая кнопка мыши",
    mouse_left_drag = "Перетащить с помощью ",
    mouse_right_drag = "Перетаскивать правой кнопкой мыши",
    mouse_wheel = "Колесико мыши",
    creditsText_dave = "Создано Дэвидом Фрэмптоном",
    creditsText_music = "Оригинальный саундтрек Джона Консалакиса и Дэвида Фрэмптона",
    creditsText_soundtrackLinkText = "Детали саундтрека",
    creditsText = [[
Озвучивание Эммы Фрэмптон, Итана Фрэмптона и Дэвида Фрэмптона
Управление сообществом: Милла Кутсос
Рекламные иллюстрации от JГ©rГ©my Forveille
Рендеринг атмосферы на основе работ Эрика Брюнетона
Аудио движок: FMOD Studio от Firelight Technologies Pty Ltd.
Физика: Bullet Physics
Сериализация: Зерно - Грант, В. Шейн и Вурхис, Рэндольф (2017)
Сетевые технологии: Enet - Ли Зальцман
Sapiens использует удивительную библиотеку LuaJIT от Майка Палла.
Sapiens также использует LuaBridge от Натана Рида, Винни Фалько и других.
Вокал в Sapiens звучит на "toki pona", конструируемом языке Сони Ланг - tokipona.org
Переводчик на Русский язык Steam name: GRINGO
Большое спасибо за огромную поддержку, тестирование, отзывы и помощь от многих других людей. Особенно большое спасибо альфа-тестерам, а также членам сообщества Discord-сервера и тем, кто оставлял отзывы на видеоролики devlog на YouTube. Я не смог бы создать Sapiens без вас.

И больше всего спасибо моей замечательной жене Эмме, которая поддерживала нашу семью и меня на протяжении всего этого очень долгого периода разработки, жертвуя своей карьерой, чтобы у меня было время работать над своей. Эта игра - такой же результат тяжелой работы, жертв и преданности Эммы, как и моя.
]],

    -- orderStatus
    -- values for these function usally include .name, the noun variant of the inProgressName. Also planName, which is the name of the plan, instead of the in-progress variant provided with planText.

    orderStatus_deliverTo = function(values)
        return values.inProgressName .. " " .. values.heldObjectName .. " на " .. values.retrievedObjectName .. values.logisticsPostfix
    end,
    orderStatus_deliverForConstruction = function(values)
        if values.planText then
            if values.retrievedObjectConstructableTypeName then
                return values.inProgressName .. " " .. values.heldObjectName .. " для " .. values.planText .. " " .. values.retrievedObjectConstructableTypeName .. values.logisticsPostfix
            else
                return values.inProgressName .. " " .. values.heldObjectName .. " для " .. values.planText .. values.logisticsPostfix
            end
        end
        return values.inProgressName .. " " .. values.heldObjectName .. " для строительства в " .. values.retrievedObjectName
    end,
    orderStatus_deliverForFuel = function(values)
        return values.inProgressName .. " " .. values.heldObjectName .. " за топливом на " .. values.retrievedObjectName
    end,
    orderStatus_pickupObject = function(values)
        if values.planText then
            if values.retrievedObjectConstructableLocationName then
                return values.inProgressName .. " " .. values.pickupObjectName .. " для " .. values.planText .. " на " .. values.retrievedObjectConstructableLocationName
            elseif values.retrievedObjectConstructableTypeName then
                return values.inProgressName .. " " .. values.pickupObjectName .. " для " .. values.planText .. " " .. values.retrievedObjectConstructableTypeName
            else
                return values.inProgressName .. " " .. values.pickupObjectName .. " для " .. values.planText
            end
        end
        return values.inProgressName .. " " .. values.pickupObjectName
    end,
    orderStatus_pickupObjectToEat = function(values)
        return values.inProgressName .. " " .. values.pickupObjectName .. " есть"
    end,
    orderStatus_pickupObjectToWear = function(values)
        return values.inProgressName .. " " .. values.pickupObjectName .. " носить"
    end,
    orderStatus_pickupObjectToPlayWith = function(values)
        return values.inProgressName .. " " .. values.pickupObjectName .. " играть с"
    end,
    orderStatus_crafting = "ремесленничество",
    orderStatus_research = "исследование",
    orderStatus_moveObjectForAction = function(values)
        return "Moving " .. values.objectName .. " для " .. values.action
    end,
    orderStatus_talkingTo = function(values)
        return "Разговор с " .. values.objectName
    end,
    --b13
    orderStatus_getLogisticsPostfix = function(values)
        return " (" .. values.routeName .. ")"
    end,
    orderStatus_addLogisticsPostfix = function(values)
        return values.inProgressName .. " " .. values.logisticsPostfix
    end,
    orderStatus_buildConstructablePlan = function(values)
        return values.planText .. " " .. values.retrievedObjectConstructableTypeName
    end,
    --/b13

    --0.3.0
    
    orderStatus_butchering = "butchering",

    orderStatus_getObjectNameSingleGeneric = function(values) --for things without names. eg chopping "a coconut tree"
        return getAorAn(values.objectName) .. " " .. values.objectName
    end,
    orderStatus_getObjectNameSingleNamed = function(values) -- for named things eg. hunting "Sam The Mammoth"
        return values.objectName
    end,
    orderStatus_getObjectNamePlural = function(values) 
        return values.objectPlural
    end,

    orderStatus_addObjectNameSingleGeneric = function(values) --for things without names. eg chopping "a coconut tree"
        return values.inProgressName .. " " .. getAorAn(values.objectName) .. " " .. values.objectName
    end,
    orderStatus_addObjectNameSingleNamed = function(values) -- for named things eg. hunting "Sam The Mammoth"
        return values.inProgressName .. " " .. values.objectName
    end,
    orderStatus_addObjectNamePlural = function(values) 
        return values.inProgressName .. " " .. values.objectPlural
    end,

    -- 0.3.3
    orderStatus_addWarmingUp = function(values) 
        return values.currentText .. " (Warming up)"
    end,
    --/0.3.0

    --0.4
    orderStatus_deliverToCompost = function(values)
        return values.inProgressName .. " " .. values.heldObjectName .. " at " .. values.retrievedObjectName
    end,
    --/0.4
}

local function getTimeSplit(durationSeconds, dayLength, yearLength)
    local result = {
        years = 0,
        days = 0,
        hours = 0,
    }
    
    if durationSeconds >= yearLength then
        result.years = math.floor(durationSeconds / yearLength)
        durationSeconds = durationSeconds - result.years * yearLength
    end
    
    if durationSeconds >= dayLength then
        result.days = math.floor(durationSeconds / dayLength)
        durationSeconds = durationSeconds - result.days * dayLength
    end
    
    if durationSeconds > 0 then
        result.hours = math.floor(durationSeconds / dayLength * 24)
    end

    return result
end

local function getTimeDurationDescriptionFromSplitTime(timeSplit)
    local result = ""
    local empty = true
    if timeSplit.years > 0 then
        local postfix = " год"
        if timeSplit.years > 1 then
            postfix = " лет"
        end
        result = mj:tostring(timeSplit.years) .. postfix
        empty = false
    end

    if timeSplit.days > 0 then
        local postfix = " день"
        if timeSplit.days > 1 then
            postfix = " дни"
        end

        if not empty then
            result = result .. ", "
        end
        
        result = result .. mj:tostring(timeSplit.days) .. postfix
        empty = false
    end
    
    if timeSplit.hours > 0 then
        local postfix = " час"
        if timeSplit.hours > 1 then
            postfix = " часы"
        end

        if not empty then
            result = result .. ", "
        end
        
        result = result .. mj:tostring(timeSplit.hours) .. postfix
        empty = false
    else 
        if empty then
        return "< 1 hour"
        end
    end

    return result
end

function localizations.getTimeDurationDescription(durationSeconds, dayLength, yearLength)
    local timeSplit = getTimeSplit(durationSeconds, dayLength, yearLength)
    return getTimeDurationDescriptionFromSplitTime(timeSplit)
end

function localizations.getTimeRangeDescription(durationSecondsMin, durationSecondsMax, dayLength, yearLength)
    local minHourCount = math.floor(durationSecondsMin / dayLength * 24)
    local maxHourCount = math.floor(durationSecondsMax / dayLength * 24)
    if minHourCount == maxHourCount then
        return localizations.getTimeDurationDescription(durationSecondsMin, dayLength, yearLength)
    end

    if minHourCount == 0 then
        local maxDescription = localizations.getTimeDurationDescription(durationSecondsMax, dayLength, yearLength)
        return "< " .. maxDescription
    end
    
    local timeSplitMin = getTimeSplit(durationSecondsMin, dayLength, yearLength)
    local timeSplitMax = getTimeSplit(durationSecondsMax, dayLength, yearLength)

    if (timeSplitMin.years == 0 and timeSplitMax.years == 0) then
        if (timeSplitMin.days == 0 and timeSplitMax.days == 0) then
        return mj:tostring(timeSplitMin.hours) .. " - " .. mj:tostring(timeSplitMax.hours) .. " hours"
        end
        if (timeSplitMin.hours == 0 and timeSplitMax.hours == 0) then
        return mj:tostring(timeSplitMin.days) .. " - " .. mj:tostring(timeSplitMax.days) .. " days"
        end
    elseif (timeSplitMin.days == 0 and timeSplitMax.days == 0) and (timeSplitMin.hours == 0 and timeSplitMax.hours == 0) then
        return mj:tostring(timeSplitMin.years) .. " - " .. mj:tostring(timeSplitMax.years) .. " years"
    end

    local minDescription = getTimeDurationDescriptionFromSplitTime(timeSplitMin)
    local maxDescription = getTimeDurationDescriptionFromSplitTime(timeSplitMax)

    return minDescription .. " - " .. maxDescription

    --[[local minHourCount = math.floor(durationSecondsMin / dayLength * 24)
    local maxHourCount = math.floor(durationSecondsMax / dayLength * 24)
    if minHourCount == maxHourCount then
        return localizations.getTimeDurationDescription(durationSecondsMin, dayLength, yearLength)
    end

    local maxDescription = localizations.getTimeDurationDescription(durationSecondsMax, dayLength, yearLength)
    if minHourCount == 0 then
        return "< " .. maxDescription
    end

    local minDescription = localizations.getTimeDurationDescription(durationSecondsMin, dayLength, yearLength)
    return minDescription .. " - " .. maxDescription]]
end

function localizations.getBiomeForestDescription(biomeTags)
    local typeString = nil

    if biomeTags.coniferous then
        if biomeTags.birch then
            typeString = "сосна и береза"
        elseif biomeTags.bamboo then
            typeString = "сосна и бамбук"
        else
            typeString = "сосна"
        end
    else 
        typeString = "береза"
    end
    
    if not typeString then
        return "Нет деревьев."
    end

    local forestString = true
    if biomeTags.mediumForest then
        forestString = string.format("%s лес.", mj:capitalize(typeString))
    elseif biomeTags.denseForest then
        forestString = string.format("Плотный %s лес.", typeString)
    elseif biomeTags.sparseForest then
        forestString = string.format("%s деревья.", mj:capitalize(typeString))
    elseif biomeTags.verySparseForest then
        forestString = string.format("Очень мало %s деревья.", typeString)
    else
        return "Нет деревьев."
    end

    return forestString

end

function localizations.getBiomeMainDescription(biomeTags)
    local descriptionString = nil
    if biomeTags.tropical then
        descriptionString = "Тропический"
    elseif biomeTags.polar or biomeTags.icecap or biomeTags.heavySnowSummer or biomeTags.medSnowSummer or biomeTags.lightSnowSummer then
        descriptionString = "Ледяной"
    elseif biomeTags.temperate then
        descriptionString = "Умеренный"
    elseif biomeTags.dry then
        descriptionString = "Сухой"
    end

    local mainAdded = false

    local function addMain(value)
        if descriptionString then
            descriptionString = descriptionString .. " " .. value .. "."
        else
            descriptionString = mj:capitalize(value) .. "."
        end
        mainAdded = true
    end

    if biomeTags.desert then
        addMain("пустыня")
    elseif biomeTags.steppe then
        addMain("степь")
    elseif biomeTags.rainforest then
        addMain("тропический лес")
    elseif biomeTags.savanna then
        addMain("савана")
    elseif biomeTags.tundra then
        addMain("тундра")
    end

    if not mainAdded then
        if not descriptionString then
        return ""
        end
        return descriptionString .. "."
    end
    return descriptionString
end

function localizations.getBiomeTemperatureDescription(biomeTags)
    
    local descriptionString = nil

    if biomeTags.temperatureSummerVeryHot then
        descriptionString = "Очень Жаркое Лето."
    elseif biomeTags.temperatureSummerHot then
        descriptionString = "Жаркое Лето."
    elseif biomeTags.temperatureSummerCold then
        descriptionString = "Холодное Лето."
    elseif biomeTags.temperatureSummerVeryCold then
        descriptionString = "Очень Холодное Лето."
    else
        descriptionString = "Умеренное Лето."
    end
    if biomeTags.temperatureWinterVeryHot then
        descriptionString = descriptionString .. " Очень жаркая Зима."
    elseif biomeTags.temperatureWinterHot then
        descriptionString = descriptionString .. " Жаркая Зима."
    elseif biomeTags.temperatureWinterCold then
        descriptionString = descriptionString .. " Холодная Зима."
    elseif biomeTags.temperatureWinterVeryCold then
        descriptionString = descriptionString .. " Очень холодная Зима."
    else
        descriptionString = descriptionString .. " Умеренная Зима."
    end

    return descriptionString
end

function localizations.getBiomeFullDescription(biomeTags) --b13
    return localizations.getBiomeMainDescription(biomeTags) .. " " .. localizations.getBiomeForestDescription(biomeTags) .. " " .. localizations.getBiomeTemperatureDescription(biomeTags)
end

--mj:log("localizations count:", #(localizations.localizations))
        
return localizations