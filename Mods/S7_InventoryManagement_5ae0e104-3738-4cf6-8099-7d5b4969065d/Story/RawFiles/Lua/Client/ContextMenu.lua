local unpackedContainers = {}   --  Track Unpacked Containers

Ext.RegisterListener('SessionLoaded', function()    --  Wait for UCL to Load

    --  =========================
    --  CONTEXT-MENU REGISTRATION
    --  =========================

    UCL.ContextMenu:Register({
        ['Any::Item'] = {
            {
                text = 'Unpack',
                actionID = 27801,
                isUnavailable = function(r)
                    local shiftPressed = r.InputEvents:isPressed('LSHIFT')  --  Shift key pressed
                    local _, containerInventory = pcall(r.Target.GetInventoryItems, r.Target) -- Check if item is a container
                    return unpackedContainers[r.Target.MyGuid] or not IsValid(#containerInventory) or not shiftPressed -- Checks if Shift is pressed, Item is a valid container and is not already unpacked
                end,
                isLegal = true,
                isDisabled = false,
                clickSound = true,
            },
            {
                text = 'Repack',
                actionID = 27802,
                isUnavailable = function(r)
                    local shiftPressed = r.InputEvents:isPressed('LSHIFT')  --  Shift key is pressed
                    return not unpackedContainers[r.Target.MyGuid] or not shiftPressed -- Checks if shift is pressed and Item is unpacked
                end,
                isLegal = true,
                isDisabled = false,
                clickSound = true,
            }
        }
    })
end)

--  ======================
--  TRACK CONTAINER STATUS
--  ======================

Ext.RegisterNetListener(UCL.Channel.ContextMenu, function(channel, payload)
    local payload = Ext.JsonParse(payload) or {}
    Destringify(payload)
    if payload.actionID == 27801 or payload.actionID == 27802 then
        local item = Ext.GetItem(payload.ItemNetID)
        unpackedContainers[item.MyGuid] = payload.actionID == 27801 and true or false   --  Set unpackedContainer Status
    end
end)
