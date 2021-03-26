Ext.RegisterListener('SessionLoaded', function()
    UCL.ContextMenu:Register({
        ['Any::Item'] = {
            {
                text = 'Gather All',
                actionID = 27801,
                isUnavailable = function(r) return not r.InputEvents:isPressed('LSHIFT') end,
                isLegal = true,
                isDisabled = false,
                clickSound = true,
            }
        }
    })
end)