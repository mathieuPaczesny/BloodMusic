local L = {}
L["Subtitle"] = "Ändern Sie die Optionen unten, um die Musik zu steuern, die während des Blood Lust abgespielt wird."
L["Help"] = "Brauchen Sie Hilfe? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Wählen Sie den Audiokanal für die Tonwiedergabe."
L["MasterCanal"] = "Haupt"
L["MusicCanal"] = "Musik"
L["SFXCanal"] = "Effekte"
L["AmbienceCanal"] = "Umgebung"
L["DialogCanal"] = "Gespräch"
L["HowAddSong"] = "So fügen Sie einen Song hinzu"
L["Step1"] = "1. Fügen Sie Ihre Audiodatei in das Verzeichnis Interface/Sounds ein. Wenn der Ordner Sounds nicht existiert, erstellen Sie ihn."
L["Step2"] = "2. Kopieren Sie den Dateinamen und die Dateiendung (stellen Sie sicher, dass es sich nur um MP3-Format handelt)."
L["Step3"] = "3. Starten Sie World of Warcraft neu, damit die Datei erkannt wird."
L["Step4"] = "4. Klicken Sie auf 'Hinzufügen' unten links und geben Sie den Dateinamen ein, zum Beispiel: monaudio.mp3."
L["ManageSongs"] = "Verwalten Sie die abgespielte Musik."
L["Stop"] = "Stopp"
L["Play"] = "Abspielen"
L["Remove"] = "Entfernen"
L["AddSong"] = "Einen Song hinzufügen"
L["EnterFileName"] = "Geben Sie den Namen der Audiodatei mit ihrer Endung ein:"
L["Add"] = "Hinzufügen"
L["Cancel"] = "Abbrechen"
L["Test"] = "Testen"
L["Loaded"] = "Geladen"
L["BadExt"] = "Fehler: Die Datei muss im MP3-Format vorliegen."
L["ErreurCantPlaySong"] = "Fehler: Der Ton kann nicht abgespielt werden."
L["NoFile"] = "Keine Audiodatei verfügbar."

-- Enregistrez les chaînes localisées
if GetLocale() == "deDE" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end