local L = {}
L["Subtitle"] = "Modifique as opções abaixo para controlar a música que será reproduzida durante o Blood Lust."
L["Help"] = "Precisa de ajuda? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "Escolha o canal de áudio para a reprodução do som."
L["MasterCanal"] = "Principal"
L["MusicCanal"] = "Música"
L["SFXCanal"] = "Efeitos"
L["AmbienceCanal"] = "Ambiente"
L["DialogCanal"] = "Diálogo"
L["HowAddSong"] = "Como adicionar uma música"
L["Step1"] = "1. Adicione seu arquivo de áudio no diretório Interface/Sounds. Se a pasta Sounds não existir, crie-a."
L["Step2"] = "2. Copie o nome do arquivo e sua extensão (certifique-se de que está no formato MP3 apenas)."
L["Step3"] = "3. Reinicie o World of Warcraft para que o arquivo seja reconhecido."
L["Step4"] = "4. Clique em 'Adicionar' no canto inferior esquerdo e insira o nome do arquivo, por exemplo: monaudio.mp3."
L["ManageSongs"] = "Gerencie as músicas reproduzidas."
L["Stop"] = "Parar"
L["Play"] = "Reproduzir"
L["Remove"] = "Remover"
L["AddSong"] = "Adicionar uma música"
L["EnterFileName"] = "Digite o nome do arquivo de áudio com sua extensão:"
L["Add"] = "Adicionar"
L["Cancel"] = "Cancelar"
L["RestoreDefaultSongs"] = "Restaurar sons padrão"
L["Loaded"] = "Carregado"
L["BadExt"] = "Erro: O arquivo deve estar no formato MP3."
L["ErreurCantPlaySong"] = "Erro: O som não pode ser reproduzido."
L["NoFile"] = "Nenhum arquivo de áudio disponível."

-- Enregistrez les chaînes localisées
if GetLocale() == "ptBR" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end