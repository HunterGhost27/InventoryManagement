local containers = {}

--  =======================
--  CONTEXT-MENU RESPONDERS
--  =======================

Ext.RegisterNetListener(UCL.Channel.ContextMenu, function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)

    --  ================
    --  CONTAINER UNPACK
    --  ================

    if payload.actionID == 27801 then
        local item = Ext.GetItem(payload.ItemNetID)
        if not containers[item.MyGuid] then containers[item.MyGuid] = {} end
        local containedItems = item:GetInventoryItems()
        for _, itemName in pairs(containedItems) do
            containers[item.MyGuid][itemName] = true
            Osi.ItemToInventory(itemName, payload.CharacterGUID, -1, 1, 0)
        end
    end

    --  ================
    --  CONTAINER REPACK
    --  ================

    if payload.actionID == 27802 then
        local item = Ext.GetItem(payload.ItemNetID)
        for itemName, _ in pairs(containers[item.MyGuid]) do
            Osi.ItemToInventory(itemName, item.MyGuid, -1, 1, 0)
        end
    containers[item.MyGuid] = nil
    end
end)