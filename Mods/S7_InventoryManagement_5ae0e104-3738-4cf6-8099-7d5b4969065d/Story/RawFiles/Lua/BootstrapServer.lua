Ext.Require('Auxiliary.lua')

Ext.RegisterNetListener(UCL.Channel.ContextMenu, function(channel, payload)
    local payload = Ext.JsonStringify(payload) or {}
    if payload.actionID ~= 27801 then return end

    Ext.Print('GATHER ALL!')
end)