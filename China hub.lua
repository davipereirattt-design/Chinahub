-- [[ MM2 AUTO FARM - ESTILO EXOTIC HUB / SEM ERROS ]] --

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Remove interface anterior se já existir para evitar duplicidade
if CoreGui:FindFirstChild("MM2ExoticStyleFarm") then
    CoreGui.MM2ExoticStyleFarm:Destroy()
end

-- Variável de Controle Global do Farm
getgenv().ExoticCandyFarm = false

-- Criando a Interface Gráfica Principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2ExoticStyleFarm"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Janela Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 18, 30)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -110)
MainFrame.Size = UDim2.new(0, 260, 0, 190)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(140, 80, 255) -- Estilo Hub moderno (Roxo/Neon)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Título
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(1
    
