local L = {}
L["Subtitle"] = "Modify the options below to control the music that will be played during Blood Lust."
L["Help"] = "Need help? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Choose the audio channel for sound playback."
L["MasterCanal"] = "Master"
L["MusicCanal"] = "Music"
L["SFXCanal"] = "Sound Effects"
L["AmbienceCanal"] = "Ambience"
L["DialogCanal"] = "Dialogue"
L["HowAddSong"] = "How to add a song"
L["Step1"] = "1. Add your audio file to the Interface/Sounds directory. If the Sounds folder does not exist, create it."
L["Step2"] = "2. Copy the file name and its extension (make sure it is in MP3 format only)."
L["Step3"] = "3. Restart World of Warcraft for the file to be recognized."
L["Step4"] = "4. Click on 'Add' at the bottom left and enter the file name, for example: myaudio.mp3."
L["ManageSongs"] = "Manage the played music."
L["Stop"] = "Stop"
L["Play"] = "Play"
L["Remove"] = "Remove"
L["AddSong"] = "Add a song"
L["EnterFileName"] = "Enter the audio file name with its extension:"
L["Add"] = "Add"
L["Cancel"] = "Cancel"
L["Test"] = "Test"
L["Loaded"] = "Loaded"
L["BadExt"] = "Error: The file must be in MP3 format."
L["ErreurCantPlaySong"] = "Error: The sound cannot be played."
L["NoFile"] = "No audio file available."

-- Enregistrez les chaînes localisées
if GetLocale() == "enUS" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end