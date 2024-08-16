local L = {}
L["Subtitle"] = "修改下面的選項以控制在 Blood Lust 期間播放的音樂。"
L["Help"] = "需要幫助嗎？ https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "選擇用於聲音播放的音頻頻道。"
L["MasterCanal"] = "主頻道"
L["MusicCanal"] = "音樂"
L["SFXCanal"] = "音效"
L["AmbienceCanal"] = "環境"
L["DialogCanal"] = "對話"
L["HowAddSong"] = "如何添加音樂"
L["Step1"] = "1. 將您的音頻文件添加到 Interface/Sounds 目錄中。如果 Sounds 文件夾不存在，請創建它。"
L["Step2"] = "2. 複製文件名及其擴展名（確保文件格式為 MP3）。"
L["Step3"] = "3. 重新啟動《魔獸世界》以使文件被識別。"
L["Step4"] = "4. 點擊左下角的「添加」，然後輸入文件名，例如：monaudio.mp3。"
L["ManageSongs"] = "管理播放的音樂。"
L["Stop"] = "停止"
L["Play"] = "播放"
L["Remove"] = "移除"
L["AddSong"] = "添加音樂"
L["EnterFileName"] = "輸入音頻文件的名稱及其擴展名："
L["Add"] = "添加"
L["Cancel"] = "取消"
L["RestoreDefaultSongs"] = "恢復預設聲音"
L["Loaded"] = "已加載"
L["BadExt"] = "錯誤：文件必須為 MP3 格式。"
L["ErreurCantPlaySong"] = "錯誤：無法播放聲音。"
L["NoFile"] = "沒有可用的音頻文件。"

-- Enregistrez les chaînes localisées
if GetLocale() == "zhTW" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end