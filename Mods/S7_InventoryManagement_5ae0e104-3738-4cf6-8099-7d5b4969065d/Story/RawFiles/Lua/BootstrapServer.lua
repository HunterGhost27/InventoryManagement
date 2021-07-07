Ext.Require('Auxiliary.lua')
Ext.Require('Server/ContextMenu.lua')

Ext.RegisterNetListener(Channel.QuickAdd, function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    if not IsValid(payload) then return end

    local item = Ext.GetItem(payload.itemNetId)
    local container = Ext.GetItem(payload.containerNetId)
    Osi.ItemToInventory(item.MyGuid, container.MyGuid, -1, 1, 0)
end)

Ext.RegisterNetListener(Channel.QuickAdd .. "Return", function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    if not IsValid(payload) then return end
    
    local item = Ext.GetItem(payload.itemNetId)
    Osi.ItemToInventory(item.MyGuid, Osi.CharacterGetHostCharacter(), -1, 1, 0)
end)