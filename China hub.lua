-- [[ MM2 HALLOWEEN CANDY FARM + UI CORRIGIDA ]] --

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Remove interface anterior se já existir
if CoreGui:FindFirstChild("MM2HalloweenFarm") then
    CoreGui.MM2HalloweenFarm:Destroy()
end

-- Variável de Controle Global
getgenv().CandyFarm = false

-- Criando a UI Principal (Tema Halloween)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2HalloweenFarm"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Janela Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 20, 35)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -100)
MainFrame.Size = UDim2.new(0, 250, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 102, 0)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Título
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 102, 0)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "🎃 MM2 Candy Farm 🎃"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Botão de Minimizar (Abrir/Fechar a UI)
local ToggleUIButton = Instance.new("TextButton")
ToggleUIButton.Parent = ScreenGui
ToggleUIButton.BackgroundColor3 = Color3.fromRGB(255, 102, 0)
ToggleUIButton.Position = UDim2.new(0.05, 0, 0.1, 0)
ToggleUIButton.Size = UDim2.new(0, 45, 0, 45)
ToggleUIButton.Font = Enum.Font.GothamBold
ToggleUIButton.Text = "👻"
ToggleUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleUIButton.TextSize = 20

local ToggleUICorner = Instance.new("UICorner")
ToggleUICorner.CornerRadius = UDim.new(1, 0)
ToggleUICorner.Parent = ToggleUIButton

local isOpen = true
ToggleUIButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    MainFrame.Visible = isOpen
end)

-- Botão de Ligar/Desligar o Farm de Doces
local FarmButton = Instance.new("TextButton")
FarmButton.Parent = MainFrame
FarmButton.BackgroundColor3 = Color3.fromRGB(45, 35, 60)
FarmButton.Position = UDim2.new(0.1, 0, 0.35, 0)
FarmButton.Size = UDim2.new(0.8, 0, 0, 45)
FarmButton.Font = Enum.Font.GothamBold
FarmButton.Text = "Auto Candies: [OFF]"
FarmButton.TextColor3 = Color3.fromRGB(255, 100, 100)
FarmButton.TextSize = 14
FarmButton.ZIndex = 2 -- Garante que o botão fique acima de tudo

local FarmCorner = Instance.new("UICorner")
FarmCorner.CornerRadius = UDim.new(0, 8)
FarmCorner.Parent = FarmButton

local FarmStroke = Instance.new("UIStroke")
FarmStroke.Color = Color3.fromRGB(255, 102, 0)
FarmStroke.Thickness = 1
FarmStroke.Parent = FarmButton

-- Status
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0.1, 0, 0.75, 0)
StatusLabel.Size = UDim2.new(0.8, 0, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Aguardando..."
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
StatusLabel.TextSize = 12

-- Ação do Botão Corrigida
FarmButton.MouseButton1Click:Connect(function()
    getgenv().CandyFarm = not getgenv().CandyFarm
    
    if getgenv().CandyFarm then
        FarmButton.Text = "Auto Candies: [ON]"
        FarmButton.TextColor3 = Color3.fromRGB(100, 255, 100)
        StatusLabel.Text = "Status: Ativado! Procurando..."
        print("[MM2 Farm] Ativado com sucesso!")
    else
        FarmButton.Text = "Auto Candies: [OFF]"
        FarmButton.TextColor3 = Color3.fromRGB(255, 100, 100)
        StatusLabel.Text = "Status: Parado"
        print("[MM2 Farm] Desativado.")
    end
end)

-- [[ LÓGICA DE FLUTUAÇÃO E FARM DE DOCES (SEM KICK) ]] --
task.spawn(function()
    while true do
        task.wait(0.2)
        if getgenv().CandyFarm then
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
                    local hrp = char.HumanoidRootPart
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    
                    -- Ativa flutuação para não cair
                    humanoid.PlatformStand = true
                    
                    local foundCandy = false
                    
                    for _, obj in ipairs(Workspace:GetDescendants()) do
                        if not getgenv().CandyFarm then break end
                        
                        if obj.Name == "Candy" or obj.Name == "CoinVisual" or obj.Name == "Drop" then
                            local parentPart = obj:IsA("BasePart") and obj or obj.Parent
                            
                            if parentPart and parentPart:IsA("BasePart") then
                                foundCandy = true
                                StatusLabel.Text = "Status: Pegando doce!"
                                
                                local targetCFrame = parentPart.CFrame + Vector3.new(0, 3, 0)
                                
                                -- Desliza suavemente até o doce (evita kick)
                                for i = 1, 4 do
                                    if not getgenv().CandyFarm then break end
                                    hrp.CFrame = hrp.CFrame:Lerp(targetCForm or targetCFrame, 0.5)
                                    task.wait(0.02)
                                end
                                
                                hrp.CFrame = targetCFrame
                                task.wait(0.1)
                            end
                        end
                    end
                    
                    if not foundCandy then
                        StatusLabel.Text = "Status: Procurando pelo mapa..."
                    end
                end
            end)
        else
            -- Restaura o personagem ao desligar
            pcall(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    char:FindFirstChildOfClass("Humanoid").PlatformStand = false
                end
            end)
        end
    end
end)
