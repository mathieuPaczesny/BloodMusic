local L = {}
L["Subtitle"] = "아래 옵션을 수정하여 Blood Lust 동안 재생될 음악을 제어하세요."
L["Help"] = "도움이 필요하신가요? https://discord.gg/FyxWDPMqe8"
L["LabelSound"] = "소리 재생을 위한 오디오 채널을 선택하세요."
L["MasterCanal"] = "주요"
L["MusicCanal"] = "음악"
L["SFXCanal"] = "효과"
L["AmbienceCanal"] = "환경"
L["DialogCanal"] = "대화"
L["HowAddSong"] = "노래 추가 방법"
L["Step1"] = "1. 오디오 파일을 Interface/Sounds 폴더에 추가하세요. Sounds 폴더가 없으면 생성하세요."
L["Step2"] = "2. 파일 이름과 확장자를 복사하세요 (MP3 형식만 허용됩니다)."
L["Step3"] = "3. 파일을 인식할 수 있도록 World of Warcraft를 다시 시작하세요."
L["Step4"] = "4. 왼쪽 하단의 '추가'를 클릭하고 파일 이름을 입력하세요. 예: monaudio.mp3."
L["ManageSongs"] = "재생된 음악을 관리하세요."
L["Stop"] = "중지"
L["Play"] = "재생"
L["Remove"] = "제거"
L["AddSong"] = "노래 추가"
L["EnterFileName"] = "오디오 파일 이름과 확장자를 입력하세요:"
L["Add"] = "추가"
L["Cancel"] = "취소"
L["Test"] = "테스트"
L["Loaded"] = "로드됨"
L["BadExt"] = "오류: 파일은 MP3 형식이어야 합니다."
L["ErreurCantPlaySong"] = "오류: 소리를 재생할 수 없습니다."
L["NoFile"] = "사용 가능한 오디오 파일이 없습니다."

-- Enregistrez les chaînes localisées
if GetLocale() == "koKR" then
    for k, v in pairs(L) do
        _G[k] = v
    end
end