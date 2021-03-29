Ext.RegisterListener('InputEvent', function(inputEvent)
    if not IsValid(inputEvent) then return end
    if inputEvent.EventId == UCL.InputEvents.Alias.MCLICK then
        local container = UCL.ContainerInventory.Container
        local mousedOverItem = UCL.PartyInventory.MousedOverItem
        if not container or not mousedOverItem then return end
        local payload = {
            eventId = inputEvent.EventId,
            itemNetId = UCL.PartyInventory.MousedOverItem.NetID,
            containerNetId = UCL.ContainerInventory.Container.NetID
        }
        Ext.PostMessageToServer(Channel.QuickAdd, Ext.JsonStringify(payload))
    end
end)

Ext.RegisterListener('InputEvent', function(inputEvent)
    if not IsValid(inputEvent) then return end
    if inputEvent.EventId == UCL.InputEvents.Alias.MCLICK then
        local container = UCL.ContainerInventory.MiddleClickedItem
        if not container then return end
        local payload = {
            eventId = inputEvent.EventId,
            itemNetId = container.NetID,
            containerNetId = UCL.ContainerInventory.Container.NetID,
        }
        Ext.PostMessageToServer(Channel.QuickAdd .. "Return", Ext.JsonStringify(payload))
    end
end)