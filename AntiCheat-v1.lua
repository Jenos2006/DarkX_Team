--[
Note:
THIS IS A SERVER SCRIPT AND NOT A STARTER-PLAYER SCRIPT!
by Dark X Team 
]--

local Players = game:GetService("Players")
local CHECK_INTERVAL = 2 -- Interval in seconds between checks
local MAX_TELEPORT_DISTANCE = 50 -- Max distance a player can move in CHECK_INTERVAL seconds
local MAX_FLY_TIME = 5 -- Max time a player can stay in the air
local JUMP_DETECTION_INTERVAL = 0.1 -- Interval for detecting jumps
local MAX_JUMPS = 1 -- Max jumps allowed before landing


local function checkPlayerStats(player)
    local character = player.Character
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local lastPosition = character.PrimaryPart.Position
        local airTime = 0
        local jumpCount = 0
        local lastJumpTime = tick()

        -- Check jumps in shorter intervals
        while character.Parent and humanoid do
            wait(JUMP_DETECTION_INTERVAL)

            -- Check WalkSpeed and JumpPower
            if humanoid.WalkSpeed > 16 then
                player:Kick("WalkSpeed hacking detected!")
            elseif humanoid.JumpPower > 50 then
                player:Kick("JumpPower hacking detected!")
            end

            -- Check for teleporting
            local currentPosition = character.PrimaryPart.Position
            local distanceMoved = (currentPosition - lastPosition).magnitude

            if distanceMoved > MAX_TELEPORT_DISTANCE then
                player:Kick("Teleporting detected!")
            end

            -- Check for flying
            if humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                airTime = airTime + JUMP_DETECTION_INTERVAL
                if airTime > MAX_FLY_TIME then
                    player:Kick("Flying detected!")
                end
            else
                airTime = 0
            end

            -- Check for double jumping
            if humanoid:GetState() == Enum.HumanoidStateType.Jumping then
                if tick() - lastJumpTime < JUMP_DETECTION_INTERVAL then
                    jumpCount = jumpCount + 1
                    if jumpCount > MAX_JUMPS then
                        player:Kick("Double jumping detected!")
                    end
                else
                    jumpCount = 1
                end
                lastJumpTime = tick()
            elseif humanoid:GetState() == Enum.HumanoidStateType.Landed then
                jumpCount = 0
            end

            lastPosition = currentPosition
        end
    end
end

-- Check for new players
local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function(character)
        -- Wait until character is fully loaded
        character:WaitForChild("HumanoidRootPart")
        wait(1)
        checkPlayerStats(player)
    end)
end

Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        onPlayerAdded(player)
    end
end

print("Anti-Cheat is now active! Script by Dark X Team.")
