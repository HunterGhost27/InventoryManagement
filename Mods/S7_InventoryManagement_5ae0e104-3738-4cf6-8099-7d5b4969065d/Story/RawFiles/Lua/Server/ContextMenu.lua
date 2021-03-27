PersistentVars.containers = {}

--  =======================
--  CONTEXT-MENU RESPONDERS
--  =======================

local contextMenuResponder = {

    --  CONTAINER UNPACK
    --  ================

    [Actions.Unpack] = function(payload)
        local item = Ext.GetItem(payload.ItemNetID)
        if not PersistentVars.containers[item.MyGuid] then PersistentVars.containers[item.MyGuid] = {} end
        local containedItems = item:GetInventoryItems()
        for _, itemName in pairs(containedItems) do
            PersistentVars.containers[item.MyGuid][itemName] = true
            Osi.ItemToInventory(itemName, payload.CharacterGUID, -1, 1, 0)
        end
    end,

    --  CONTAINER REPACK
    --  ================

    [Actions.Repack] = function(payload)
        local item = Ext.GetItem(payload.ItemNetID)
        ForEach(PersistentVars.containers[item.MyGuid], function(itemName, _)
            if not Osi.ItemGetOwner(itemName) == payload.CharacterGUID then return end
            Osi.ItemToInventory(itemName, item.MyGuid, -1, 1, 0)
        end)
        PersistentVars.containers[item.MyGuid] = nil
    end
}

--  ==================
--  RESPONDER LISTENER
--  ==================

Ext.RegisterNetListener(UCL.Channel.ContextMenu, function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if contextMenuResponder[payload.actionID] then contextMenuResponder[payload.actionID](payload) end
end)