Ext.RegisterListener('InputEvent', function(inputEvent)
    if not IsValid(inputEvent) then return end
    if inputEvent.EventId == UCL.InputEvents.Alias.LCLICK then
        local container = UCL.ContainerInventory.Container
        if not container then return end
        local payload = {
            eventId = inputEvent.EventId,
            itemNetId = UCL.PartyInventory.MousedOverItem.NetID,
            containerNetId = UCL.ContainerInventory.Container.NetID
        }
        Ext.PostMessageToServer(Channel.QuickAdd, Ext.JsonStringify(payload))
    end
end)