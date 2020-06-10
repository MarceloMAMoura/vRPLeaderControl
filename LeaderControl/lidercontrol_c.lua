------------------------------------/conviddarorg id_vrp-------------------------------------



RegisterCommand("convidarorg", function(source, args)



TriggerServerEvent('convidarorg', NetworkPlayerGetName(PlayerId()), args[1])



end)


RegisterCommand("aceitarconvite", function(source, args)



TriggerServerEvent('aceitarconvite')



end)


RegisterCommand("expulsar", function(source, args)



TriggerServerEvent('expulsar', args[1])



end)


RegisterCommand("promover", function(source, args)



TriggerServerEvent('promover', args[1])



end)
