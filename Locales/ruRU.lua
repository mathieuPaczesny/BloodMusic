local L = {}
L["Subtitle"] = "Измените параметры ниже, чтобы контролировать музыку, которая будет воспроизводиться во время Blood Lust."
L["Help"] = "Нужна помощь? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Выберите аудиоканал для воспроизведения звука."
L["MasterCanal"] = "Основной"
L["MusicCanal"] = "Музыка"
L["SFXCanal"] = "Эффекты"
L["AmbienceCanal"] = "Окружение"
L["DialogCanal"] = "Диалог"
L["HowAddSong"] = "Как добавить музыку"
L["Step1"] = "1. Добавьте ваш аудиофайл в каталог Interface/Sounds. Если папка Sounds не существует, создайте её."
L["Step2"] = "2. Скопируйте имя файла и его расширение (убедитесь, что это формат MP3)."
L["Step3"] = "3. Перезапустите World of Warcraft, чтобы файл был распознан."
L["Step4"] = "4. Нажмите 'Добавить' в нижнем левом углу и введите имя файла, например: monaudio.mp3."
L["ManageSongs"] = "Управляйте воспроизводимой музыкой."
L["Stop"] = "Остановить"
L["Play"] = "Воспроизвести"
L["Remove"] = "Удалить"
L["AddSong"] = "Добавить музыку"
L["EnterFileName"] = "Введите имя аудиофайла с его расширением:"
L["Add"] = "Добавить"
L["Cancel"] = "Отменить"
L["RestoreDefaultSongs"] = "Восстановить звуки по умолчанию"
L["Loaded"] = "Загружено"
L["BadExt"] = "Ошибка: файл должен быть в формате MP3."
L["ErreurCantPlaySong"] = "Ошибка: звук не может быть воспроизведен."
L["NoFile"] = "Нет доступных аудиофайлов."


-- Enregistrez les chaînes localisées
if GetLocale() == "ruRU" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end