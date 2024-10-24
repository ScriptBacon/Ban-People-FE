-- Configurações
local adminPassword = "sua_senha_admin"
local banList = {}

-- Função para banir jogadores
local function banPlayer(playerName)
    table.insert(banList, playerName)
    print(playerName .. " foi banido!")
end

-- Função para verificar se um jogador está banido
local function isBanned(playerName)
    for _, bannedName in pairs(banList) do
        if bannedName == playerName then
            return true
        end
    end
    return false
end

-- Comando para banir jogadores
local function commandBan(player, cmd, ...)
    local playerName = ...
    if player.Password == adminPassword then
        banPlayer(playerName)
    else
        print("Acesso negado!")
    end
end

-- Evento para verificar se um jogador está banido ao entrar
local function onPlayerJoin(player)
    if isBanned(player.Name) then
        player:Kick("Você foi banido!")
    end
end

-- Registrar eventos e comandos
game:GetService("Players").PlayerAdded:Connect(onPlayerJoin)
game:GetService("Commands"):AddCommand("ban", commandBan)
```
