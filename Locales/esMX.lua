local L = {}
L["Subtitle"] = "Modifica las opciones a continuación para controlar la música que se reproducirá durante el Blood Lust."
L["Help"] = "¿Necesitas ayuda? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Elige el canal de audio para la reproducción del sonido."
L["MasterCanal"] = "Principal"
L["MusicCanal"] = "Música"
L["SFXCanal"] = "Efectos"
L["AmbienceCanal"] = "Ambiente"
L["DialogCanal"] = "Diálogo"
L["HowAddSong"] = "Cómo añadir una canción"
L["Step1"] = "1. Agrega tu archivo de audio en el directorio Interface/Sounds. Si la carpeta Sounds no existe, créala."
L["Step2"] = "2. Copia el nombre del archivo y su extensión (asegúrate de que esté en formato MP3 únicamente)."
L["Step3"] = "3. Reinicia World of Warcraft para que el archivo sea reconocido."
L["Step4"] = "4. Haz clic en 'Agregar' en la parte inferior izquierda e ingresa el nombre del archivo, por ejemplo: monaudio.mp3."
L["ManageSongs"] = "Gestiona la música reproducida."
L["Stop"] = "Detener"
L["Play"] = "Reproducir"
L["Remove"] = "Eliminar"
L["AddSong"] = "Agregar una canción"
L["EnterFileName"] = "Ingresa el nombre del archivo de audio con su extensión:"
L["Add"] = "Agregar"
L["Cancel"] = "Cancelar"
L["Test"] = "Probar"
L["Loaded"] = "Cargado"
L["BadExt"] = "Error: El archivo debe estar en formato MP3."
L["ErreurCantPlaySong"] = "Error: No se puede reproducir el sonido."
L["NoFile"] = "No hay archivo de audio disponible."

-- Enregistrez les chaînes localisées
if GetLocale() == "esMX" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end