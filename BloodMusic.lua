local addonName, addonTable = ...

-- Liste des fichiers audio initiale
BloodMusicDB = BloodMusicDB or { soundFiles = {}, selectedChannel = "Master", archivedFiles = {} }

-- Vérifie si l'ID du sort correspond à Blood Lust ou Heroism
local function IsBloodLustAura(spellID)
    local bloodLustIDs = {
        [80353] = true,  -- Time Warp
        [32182] = true,  -- Heroism
        [2825] = true,   -- Blood Lust
        [264667] = true, -- Primal Rage
        [146555] = true, -- Ancient Hysteria
        [178207] = true, -- Drums of the Mountain
        [256740] = true, -- Drums of the Maelstrom
        [230935] = true, -- Drums of the Rising Sun
        [309658] = true, -- Drums of the Chieftain
        [350249] = true, -- Drums of the Wild
        [368245] = true, -- Drums of the Thunder
        [390386] = true, -- Drums of the Dread
        [381301] = true, -- Drums of the Frenzy
        [386540] = true, -- Drums of the Frenzy
        [441076] = true,  -- Drums of the Fury
        [449609] = true, -- test
    }
    return bloodLustIDs[spellID]
end

local currentPlayingSoundID = nil -- Variable pour stocker l'identifiant du son en cours
local currentPlayingSoundPath = nil -- Variable pour stocker le fichier du son en cours
local isPlaying = false -- Variable pour suivre l'état de lecture
local finalSoundFiles = {} -- tous les sons a affichés peut importe l'état

-- default songs
local defaultSoundFiles = {
    "Interface/AddOns/BloodMusic/Sounds/avengers-endgame.mp3",
    "Interface/AddOns/BloodMusic/Sounds/dragon-ball-super.mp3",
    "Interface/AddOns/BloodMusic/Sounds/kingsman.mp3",
    "Interface/AddOns/BloodMusic/Sounds/obiwan-starwars.mp3",
    "Interface/AddOns/BloodMusic/Sounds/warriors-league-of-legends.mp3",
    "Interface/AddOns/BloodMusic/Sounds/world-of-warcraft-a-call-to-arms.mp3",
}

-- donne le nom du fichier
local function getFileName(fileName)
    local baseName = string.match(fileName, "([^/\\]+%.mp3)$")
    return baseName or fileName
end

local function initPannelOptions()
    
    -- table pour les fichiers supprimés de la liste
    if not BloodMusicDB.archivedFiles then
        BloodMusicDB.archivedFiles = {}
    end

    -- Initialise la liste des sons si elle n'existe pas encore
    -- Ajouter les fichiers audio du DB qui sont activés
    for _, filePath in ipairs(BloodMusicDB.soundFiles) do
        if BloodMusicDB.soundFiles[filePath] then
            table.insert(finalSoundFiles, filePath)
        end
    end

    -- Ajouter les fichiers audio par défaut qui ne sont pas déjà dans finalSoundFiles
    for _, defaultPath in ipairs(defaultSoundFiles) do
        if not BloodMusicDB.archivedFiles[defaultPath] then
            local found = false
            for _, finalPath in ipairs(finalSoundFiles) do
                if finalPath == defaultPath then
                    found = true
                    break
                end
            end
            if not found then
                table.insert(finalSoundFiles, defaultPath)
            end
        end
    end

    local optionsPanel = CreateFrame("Frame", addonName .. "OptionsPanel", UIParent)
    optionsPanel.name = addonName

    local title = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", 16, -32)
    title:SetText(addonName)

    local subtitle = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    subtitle:SetPoint("TOPLEFT", 16, -64)
    subtitle:SetText(_G["Subtitle"])
    local help = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    help:SetPoint("TOPLEFT", 16, -84)
    help:SetText(_G["Help"])


    -- Créer le menu déroulant des canaux sonores
    local labelSoundCanal = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    labelSoundCanal:SetPoint("TOPLEFT", 16, -120)
    labelSoundCanal:SetText(_G["LabelSound"])
    labelSoundCanal:SetJustifyH("LEFT") -- Alignement horizontal à gauche
    labelSoundCanal:SetJustifyV("TOP") -- Alignement vertical au sommet

    local ChannelDropdown = CreateFrame("FRAME", addonName .. "ChannelDropdown", optionsPanel, "UIDropDownMenuTemplate")
    ChannelDropdown:SetPoint("TOPRIGHT", labelSoundCanal, "BOTTOMRIGHT", 350, 18)

    -- Liste des canaux sonores
    local channels = {
        { text = _G["MasterCanal"], value = "Master" },
        { text = _G["MusicCanal"], value = "Music" },
        { text = _G["SFXCanal"], value = "SFX" },
        { text = _G["AmbienceCanal"], value = "Ambience" },
        { text = _G["DialogCanal"], value = "Dialog" },
    }

    local selectedChannel = "Master"  -- Canal sonore par défaut

    -- Fonction pour gérer la sélection dans le menu déroulant
    local function OnClick(self)
        selectedChannel = self.value
        BloodMusicDB.selectedChannel = selectedChannel
        UIDropDownMenu_SetText(ChannelDropdown, self:GetText())
    end

    -- Initialisation du menu déroulant
    local function InitializeDropdown(self, level)
        local info = UIDropDownMenu_CreateInfo()
        for _, channel in pairs(channels) do
            info.text = channel.text
            info.value = channel.value
            info.func = OnClick
            UIDropDownMenu_AddButton(info)
        end
    end

    UIDropDownMenu_Initialize(ChannelDropdown, InitializeDropdown)
    UIDropDownMenu_SetWidth(ChannelDropdown, 150)
    UIDropDownMenu_SetText(ChannelDropdown, BloodMusicDB.selectedChannel or "Master")

    -- logo

    local icon = optionsPanel:CreateTexture(nil, "ARTWORK")
    icon:SetSize(64, 64) -- Taille de l'icône
    icon:SetPoint("TOPRIGHT", -16, -16)
    icon:SetTexture("Interface/AddOns/" .. addonName .. "/icon.png")

    local separator = optionsPanel:CreateTexture(nil, "ARTWORK")
    separator:SetTexture("Interface/GLUES/COMMON/GLUECREDITS-FADE")
    separator:SetSize(1, 64)
    separator:SetPoint("LEFT", title, "RIGHT", 8, 0)

    local addSoundHelper = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    addSoundHelper:SetPoint("TOPLEFT", 16, -160)
    addSoundHelper:SetText(_G["HowAddSong"])

    local soundHelper1 = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    soundHelper1:SetPoint("TOPLEFT", 16, -180)
    soundHelper1:SetText(_G["Step1"])
    soundHelper1:SetFont("Fonts\\FRIZQT__.TTF", 10)
    local soundHelper2 = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    soundHelper2:SetPoint("TOPLEFT", 16, -200)
    soundHelper2:SetText(_G["Step2"])
    soundHelper2:SetFont("Fonts\\FRIZQT__.TTF", 10)
    local soundHelper3 = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    soundHelper3:SetPoint("TOPLEFT", 16, -220)
    soundHelper3:SetText(_G["Step3"])
    soundHelper3:SetFont("Fonts\\FRIZQT__.TTF", 10)
    local soundHelper4 = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    soundHelper4:SetPoint("TOPLEFT", 16, -240)
    soundHelper4:SetText(_G["Step4"])
    soundHelper4:SetFont("Fonts\\FRIZQT__.TTF", 10)

    -- Créer un cadre de défilement pour la liste
    local listSoundsTitle = optionsPanel:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    listSoundsTitle:SetPoint("TOPLEFT", 16, -290)
    listSoundsTitle:SetText(_G["ManageSongs"])

    local scrollFrame = CreateFrame("ScrollFrame", addonName .. "ScrollFrame", optionsPanel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 16, -310)
    scrollFrame:SetSize(600, 210)

    local scrollChild = CreateFrame("Frame", nil, scrollFrame)
    scrollChild:SetSize(580, 800)
    scrollFrame:SetScrollChild(scrollChild)

    -- Fonction de création de la liste des sons avec checkbox et bouton de suppression
    local function generateListItem()
        local totalHeight = 0
        local itemHeight = 30

        local playStopButtons = {}

        for _, item in pairs(scrollChild.listItem or {}) do
            item:Hide()
        end

        scrollChild.listItem = {}

        -- Ajoute les sons à la liste
        local yOffset = -10 -- Positionnement vertical des cases à cocher

        for i, fileName in ipairs(finalSoundFiles) do
            local shortFileName = getFileName(fileName)

            -- Créer un cadre pour chaque ligne (texte + boutons)
            local lineFrame = CreateFrame("Frame", addonName .. "LineFrame" .. i, scrollChild)
            lineFrame:SetSize(600, 30)

            local checkButton = CreateFrame("CheckButton", addonName .. "CheckButton" .. i, lineFrame, "InterfaceOptionsCheckButtonTemplate")
            checkButton:SetPoint("LEFT", lineFrame, "LEFT", 0, 0)
            checkButton.Text:SetText(shortFileName)
            checkButton:SetChecked(BloodMusicDB.soundFiles[fileName] or false)
            checkButton:SetSize(30, 30)

            checkButton:SetScript("OnClick", function(self)
                BloodMusicDB.soundFiles[fileName] = self:GetChecked()
            end)

            -- Bouton "Play/Stop" avec texte
            local playStopButton = CreateFrame("Button", addonName .. "PlayStopButton" .. i, lineFrame, "UIPanelButtonTemplate")
            playStopButton:SetSize(80, 20)
            playStopButton:SetPoint("RIGHT", lineFrame, "RIGHT", -100, 0)
            if isPlaying and currentPlayingSoundPath == fileName then
                playStopButton:SetText(_G["Stop"])
            else
                playStopButton:SetText(_G["Play"])
            end

            playStopButton:SetScript("OnClick", function(self)
                if isPlaying then
                    -- Arrêter le son en cours
                    StopSound(currentPlayingSoundID, 500)
                    currentPlayingSoundID = nil
                    self:SetText(_G["Play"]) -- Change le texte en "Play"
                    isPlaying = false
                else
                    -- Jouer le son
                    if isPlaying then
                        StopSound(currentPlayingSoundID, 500)
                    end
                    
                    willPlay, soundHandle = PlaySoundFile(fileName, BloodMusicDB.selectedChannel)
                    if willPlay then
                        currentPlayingSoundPath = fileName
                        isPlaying = willPlay
                        currentPlayingSoundID = soundHandle
                        self:SetText(_G["Stop"]) -- Change le texte en "Stop"
                    else
                        print("|cFFFF0000 ".._G["ErreurCantPlaySong"].."|r")
                    end
                    generateListItem()
                end
            end)

            -- Stocker le bouton de play/stop dans la table
            playStopButtons[fileName] = playStopButton

            -- Bouton de suppression
            local deleteButton = CreateFrame("Button", addonName .. "DeleteButton" .. i, lineFrame, "UIPanelButtonTemplate")
            deleteButton:SetSize(80, 20)
            deleteButton:SetPoint("RIGHT", lineFrame, "RIGHT", -10, 0)
            deleteButton:SetText(_G["Remove"])
            deleteButton:SetScript("OnClick", function()
                -- Arrêter le son en cours si nécessaire
                if currentPlayingSoundID and currentPlayingFileName == fileName then
                    StopSound(currentPlayingSoundID, 500)
                    currentPlayingSoundID = nil
                end
                
                BloodMusicDB.archivedFiles[fileName] = true
                -- Supprimer le fichier de la liste des fichiers actifs
                BloodMusicDB.soundFiles[fileName] = nil
                table.remove(finalSoundFiles, i)
                generateListItem() -- Recrée les cases à cocher après suppression
            end)

            -- Positionner le cadre de la ligne
            lineFrame:SetPoint("TOPLEFT", 0, yOffset)
            yOffset = yOffset - 30 -- Ajuste la position verticale pour la prochaine ligne

            scrollChild.listItem[fileName] = lineFrame
            totalHeight = totalHeight + itemHeight
        end

        scrollChild:SetHeight(totalHeight)

    end

    generateListItem()

    -- Bouton pour ajouter un nouveau fichier audio
    local addButton = CreateFrame("Button", addonName .. "AddButton", optionsPanel, "UIPanelButtonTemplate")
    addButton:SetSize(200, 30)
    addButton:SetPoint("BOTTOMLEFT", 16, 16)
    addButton:SetText(_G["AddSong"])
    addButton:SetScript("OnClick", function()
        StaticPopup_Show("ADD_SOUND_POPUP")
    end)

    -- Popup pour entrer le nom du fichier
    StaticPopupDialogs["ADD_SOUND_POPUP"] = {
        text = _G["EnterFileName"],
        button1 = _G["Add"],
        button2 = _G["Cancel"],
        hasEditBox = true,
        maxLetters = 255,
        editBoxWidth = 200,
        OnAccept = function(self)
            local fileName = "Interface/Sounds/"..self.editBox:GetText()
            if fileName and fileName ~= "" then
                if string.match(fileName, "%.mp3$") then
                    table.insert(soundFiles, fileName)
                    BloodMusicDB.soundFiles[fileName] = BloodMusicDB.soundFiles[fileName] or false
                    generateListItem() -- Recrée les cases à cocher pour inclure le nouveau fichier
                    BloodMusicDB.soundFiles = soundFiles -- Mise à jour de la liste des sons dans BloodMusicDB
                else
                    print("|cFFFF0000".._G["BadExt"].."|r")
                end
            end
        end,
        OnCancel = function(self)
            self.editBox:SetText("")
        end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
    }

    -- Bouton pour restaurer les sons par defaut
    local testButton = CreateFrame("Button", addonName .. "TestButton", optionsPanel, "UIPanelButtonTemplate")
    testButton:SetSize(220, 30)
    testButton:SetPoint("BOTTOMRIGHT", -16, 16)
    testButton:SetText(_G["RestoreDefaultSongs"])
    testButton:SetScript("OnClick", function()
        BloodMusicDB.archivedFiles = {}
        finalSoundFiles = {}
        -- Initialise la liste des sons si elle n'existe pas encore
        -- Ajouter les fichiers audio du DB qui sont activés
        for _, filePath in ipairs(BloodMusicDB.soundFiles) do
            if BloodMusicDB.soundFiles[filePath] then
                table.insert(finalSoundFiles, filePath)
            end
        end

        -- Ajouter les fichiers audio par défaut qui ne sont pas déjà dans finalSoundFiles
        for _, defaultPath in ipairs(defaultSoundFiles) do
            if not BloodMusicDB.archivedFiles[defaultPath] then
                local found = false
                for _, finalPath in ipairs(finalSoundFiles) do
                    if finalPath == defaultPath then
                        found = true
                        break
                    end
                end
                if not found then
                    table.insert(finalSoundFiles, defaultPath)
                end
            end
        end

        generateListItem()

    end)

    local category = Settings.RegisterCanvasLayoutCategory(optionsPanel, addonName)
    Settings.RegisterAddOnCategory(category)
end

-- Fonction pour vérifier les auras appliquées et lancé le sond pour la bl
local last_aura_bl_id = nil
local function CheckAuras(unit, info)
    if info.isFullUpdate then
		return
	end
    if info.addedAuras then
        for _, v in pairs(info.addedAuras) do
            local aura = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, v.auraInstanceID)
            if aura ~= nil and aura.spellId ~= nil then
                if IsBloodLustAura(aura.spellId) then
                    last_aura_bl_id = v.auraInstanceID
                    -- Arrêter le son en cours si nécessaire
                    if isPlaying then
                        StopSound(currentPlayingSoundID, 500)
                        currentPlayingSoundID = nil
                        isPlaying = false
                    end
    
                    -- Crée une liste des sons actifs (cochés)
                    
                    local soundFiles = finalSoundFiles
                    local activeSounds = {}
                    for i, fileName in ipairs(soundFiles) do
                        local checkButton = _G[addonName .. "CheckButton" .. i]
                        if checkButton and checkButton:GetChecked() then
                            table.insert(activeSounds, fileName)
                        end
                    end
    
                    -- Joue un son aléatoire parmi les sons sélectionnés
                    if #activeSounds > 0 then
                        local randomIndex = math.random(#activeSounds)
                        local filePath = activeSounds[randomIndex]
                        local willPlay, soundHandle = PlaySoundFile(filePath, BloodMusicDB.selectedChannel)
                        if willPlay then
                            currentPlayingSoundID = soundHandle
                            currentPlayingSoundPath = filePath
                            isPlaying = true
                        else
                            print("|cFFFF0000".._G["ErreurCantPlaySong"].."|r")
                        end
                    else
                        print("|cFFFF0000".._G["NoFile"].."|r")
                    end
                end
            end
        end
    end
    if info.removedAuraInstanceIDs  then
        for _, v in pairs(info.removedAuraInstanceIDs) do
            
            if last_aura_bl_id ~= nil and last_aura_bl_id == v then
                if isPlaying then
                    StopSound(currentPlayingSoundID, 500)
                    currentPlayingSoundID = nil
                    isPlaying = false
                end
            end
		end
    end   
end

-- Création du cadre pour les événements
local eventFrame = CreateFrame("Frame")
eventFrame:RegisterUnitEvent("UNIT_AURA", "player")
eventFrame:SetScript("OnEvent", function(self, event, unit, info)
    if event == "UNIT_AURA" and unit == "player" then
        CheckAuras(unit, info)
    end
end)

-- Création du cadre pour les options
local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, name)
    if name == addonName then
        initPannelOptions()
        -- L'addon est prêt
        print("|cFFFF0000Blood Music: |r" .. _G["Loaded"])
    end
end)
