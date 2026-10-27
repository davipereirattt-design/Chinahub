-- [[ MM2 EXOTIC STYLE - AUTO FARM COM CONTROLE DE VELOCIDADE ]] --

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Remove interface anterior se já existir
if CoreGui:FindFirstChild("MM2ExoticStyleFarm") then
    CoreGui.MM2ExoticStyleFarm:Destroy()
end

-- Variáveis de Controle
getgenv().ExoticCandyFarm = false
getgenv().FarmSpeed = 16 -- Velocidade padrão de movimento

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
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -120)
MainFrame.Size = UDim2.new(0, 260, 0, 220)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(140, 80, 255)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- Título
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(140, 80, 255)
Title.Size = UDim2.new(1, 0, 0, 38)
Title.Font = Enum
