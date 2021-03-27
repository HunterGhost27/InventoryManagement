PersistentVars.unpackedContainers = {}   --  Track Unpacked Containers

Ext.RegisterListener('SessionLoaded', function()    --  Wait for UCL to Load

    --  =========================
    --  CONTEXT-MENU REGISTRATION
    --  =========================

    UCL.ContextMenu:Register({
        ['Any::Item'] = {
            {
                text = function(r) return PersistentVars.unpackedContainers[r.Target.MyGuid] and 'Repack' or 'Unpack' end,
                actionID = function(r) return PersistentVars.unpackedContainers[r.Target.MyGuid] and ActionID.Repack or ActionID.Unpack end,
                isUnavailable = function(r)
                    local _, container = assert(r.Target.GetInventoryItems, r.Target)
                    return not IsValid(container)
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
    if payload.actionID == ActionID.Unpack or payload.actionID == ActionID.Repack then
        local item = Ext.GetItem(payload.ItemNetID)
        PersistentVars.unpackedContainers[item.MyGuid] = payload.actionID == ActionID.Unpack and true or false   --  Set unpackedContainer Status
    end
end)
