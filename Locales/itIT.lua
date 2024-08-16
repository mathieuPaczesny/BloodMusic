local L = {}
L["Subtitle"] = "Modifica le opzioni qui sotto per controllare la musica che verrà riprodotta durante il Blood Lust."
L["Help"] = "Hai bisogno di aiuto? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Scegli il canale audio per la riproduzione del suono."
L["MasterCanal"] = "Principale"
L["MusicCanal"] = "Musica"
L["SFXCanal"] = "Effetti"
L["AmbienceCanal"] = "Ambiente"
L["DialogCanal"] = "Dialogo"
L["HowAddSong"] = "Come aggiungere una canzone"
L["Step1"] = "1. Aggiungi il tuo file audio nella cartella Interface/Sounds. Se la cartella Sounds non esiste, creala."
L["Step2"] = "2. Copia il nome del file e la sua estensione (assicurati che sia solo in formato MP3)."
L["Step3"] = "3. Riavvia World of Warcraft affinché il file venga riconosciuto."
L["Step4"] = "4. Clicca su 'Aggiungi' in basso a sinistra e inserisci il nome del file, ad esempio: monaudio.mp3."
L["ManageSongs"] = "Gestisci la musica riprodotta."
L["Stop"] = "Arresta"
L["Play"] = "Riproduci"
L["Remove"] = "Rimuovi"
L["AddSong"] = "Aggiungi una canzone"
L["EnterFileName"] = "Inserisci il nome del file audio con la sua estensione:"
L["Add"] = "Aggiungi"
L["Cancel"] = "Annulla"
L["Test"] = "Test"
L["Loaded"] = "Caricato"
L["BadExt"] = "Errore: Il file deve essere in formato MP3."
L["ErreurCantPlaySong"] = "Errore: Il suono non può essere riprodotto."
L["NoFile"] = "Nessun file audio disponibile."

-- Enregistrez les chaînes localisées
if GetLocale() == "itIT" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end