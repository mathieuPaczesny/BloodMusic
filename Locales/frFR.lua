local L = {}
L["Subtitle"] = "Modifiez les options ci-dessous pour contrôler la musique qui sera jouée pendant la Blood Lust."
L["Help"] = "Besoin d'aide ? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Choisissez le canal audio pour la diffusion du son."
L["MasterCanal"] = "Principal"
L["MusicCanal"] = "Musique"
L["SFXCanal"] = "Effets"
L["AmbienceCanal"] = "Ambiance"
L["DialogCanal"] = "Discussion"
L["HowAddSong"] = "Comment ajouter une musique"
L["Step1"] = "1. Ajoutez votre fichier audio dans le répertoire Interface/Sounds. Si le dossier Sounds n'existe pas, créez-le."
L["Step2"] = "2. Copiez le nom du fichier ainsi que son extension (assurez-vous qu'il soit au format MP3 uniquement)."
L["Step3"] = "3. Redémarrez World of Warcraft pour que le fichier soit pris en compte."
L["Step4"] = "4. Cliquez sur \"Ajouter\" en bas à gauche et entrez le nom du fichier, par exemple : monaudio.mp3."
L["ManageSongs"] = "Configurez les musiques diffusés."
L["Stop"] = "Stop"
L["Play"] = "Play"
L["Remove"] = "Supprimer"
L["AddSong"] = "Ajouter une musique"
L["EnterFileName"] = "Saisissez le nom du fichier audio avec son extension :"
L["Add"] = "Ajouter"
L["Cancel"] = "Annuler"
L["Test"] = "Tester"
L["Loaded"] = "Chargé"
L["BadExt"] = "Erreur : Le fichier doit être au format MP3."
L["ErreurCantPlaySong"] = "Erreur : Le son ne peut pas être lu."
L["NoFile"] = "Aucun fichier audio disponible."

-- Enregistrez les chaînes localisées
if GetLocale() == "frFR" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end
