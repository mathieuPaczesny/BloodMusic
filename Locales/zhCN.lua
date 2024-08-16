local L = {}
L["Subtitle"] = "修改下面的选项以控制在 Blood Lust 期间播放的音乐。"
L["Help"] = "需要帮助吗？ https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "选择用于声音播放的音频频道。"
L["MasterCanal"] = "主频道"
L["MusicCanal"] = "音乐"
L["SFXCanal"] = "音效"
L["AmbienceCanal"] = "环境"
L["DialogCanal"] = "对话"
L["HowAddSong"] = "如何添加音乐"
L["Step1"] = "1. 将您的音频文件添加到 Interface/Sounds 目录中。如果 Sounds 文件夹不存在，请创建它。"
L["Step2"] = "2. 复制文件名及其扩展名（确保文件格式为 MP3）。"
L["Step3"] = "3. 重新启动《魔兽世界》以使文件被识别。"
L["Step4"] = "4. 点击左下角的“添加”，然后输入文件名，例如：monaudio.mp3。"
L["ManageSongs"] = "管理播放的音乐。"
L["Stop"] = "停止"
L["Play"] = "播放"
L["Remove"] = "移除"
L["AddSong"] = "添加音乐"
L["EnterFileName"] = "输入音频文件的名称及其扩展名："
L["Add"] = "添加"
L["Cancel"] = "取消"
L["RestoreDefaultSongs"] = "恢复默认声音"
L["Loaded"] = "已加载"
L["BadExt"] = "错误：文件必须为 MP3 格式。"
L["ErreurCantPlaySong"] = "错误：无法播放声音。"
L["NoFile"] = "没有可用的音频文件。"


-- Enregistrez les chaînes localisées
if GetLocale() == "zhCN" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end