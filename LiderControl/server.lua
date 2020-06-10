local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_banking")
isTransfer = false



convidado = {}
for i = 1, 2 do
  convidado[i] = {}

end

------------------------------------------------------API VRP-----------------------------------------------------

RegisterServerEvent('convidarorg')

AddEventHandler('convidarorg', function(jogador1, idvrp)--Recebe os valores do arquivo hitman_c.lua, os valores são as informações que o jogador coloca no /contrato, player = jogador que colocou o contrato, nick = vitima, valor = valor do contrato

local user_id = vRP.getUserId({source})
local src = vRP.getUserSource({user_id})

if idvrp ~= nil then

  joblider = vRP.getUserGroupByType({user_id, 'job'})
  convidado[1][1] = joblider
  convidado [1][2] = idvrp


  ---------------------------------convite das orgs, job = emprego do lider

  if joblider == "[PF] Delegado Chefe" or joblider == "Assassino" then


    vRPclient.notify(idvrp,{"~w~[~r~Convite~w~]~r~ ~g~O lider: ".. joblider.." te convidou. Digite /aceitarconvite "})
  else
    vRPclient.notify(src,{"~w~[~r~Convite~w~]~r~ ~g~Você precisa ser um lider para usar o comando /convidarorg id"})
  end
else
  vRPclient.notify(src,{"~w~[~r~Convite~w~]~r~ ~g~Use /convidarorg id"})
  --TriggerClientEvent('chatMessage', -1, '^7[^1Contrato^7]^2', {0,0,0} --[[ this table is just rgb ]], 'Use o comando /contrato nick valor')
end



end)


------------------------------------------------------API VRP-----------------------------------------------------

RegisterServerEvent('aceitarconvite')

AddEventHandler('aceitarconvite', function()--Recebe os valores do arquivo hitman_c.lua, os valores são as informações que o jogador coloca no /contrato, player = jogador que colocou o contrato, nick = vitima, valor = valor do contrato

local user_id = vRP.getUserId({source})
local src = vRP.getUserSource({user_id})
local org

if convidado[1][1] ~= nil and convidado [1][2] ~=nil then--convidado[1][1] = nome da org do lider, convidaddo[1][2] = id do usuario a ser convidado
  --vRPclient.notify(src,{convidado[1][1].." "..convidado[1][2]})
  if user_id == tonumber(convidado[1][2]) then

    if convidado[1][1] == '[PF] Delegado Chefe' then

      org = "[PF] Agente"

    end

    if convidado[1][1] == '[PMESP] Comandante' then

      org = "[PMESP] Recruta"

    end
    if convidado[1][1] == '[ROTA] Comandante' then

      org = "[ROTA] Soldado"

    end
    if convidado[1][1] == '[Unimed] Diretor' then

      org = "[Unimed] Estagiario"

    end
    if convidado[1][1] == '[MAFIA] Chefe' then

      org = "[MAFIA] Membro"

    end
    if convidado[1][1] == '[M.C] Lider' then

      org = "[M.C] Membro"

    end
    if convidado[1][1] == '[C.V] Dono do Morro' then

      org = "[C.V] Vapor"

    end
    if convidado[1][1] == '[P.C.C] Lider' then

      org = "[P.C.C] Vapor"

    end
    if convidado[1][1] == '[F.D.N] Dono do Morro' then

      org = "[F.D.N] Vapor"

    end
    if convidado[1][1] == '[A.D.A] Dono' then

      org = "[A.D.A] Membro"

    end



    vRP.addUserGroup({user_id,org})

    vRPclient.notify(src,{"~w~[~r~Convite~w~]~r~ ~g~Você entrou na organização com o cargo: "..org})


  else
    vRPclient.notify(src,{"~w~[~r~Convite~w~]~r~ ~g~Nenhum convite encontrado para você"})
  end
end


end)



------------------------------------------------------API VRP-----------------------------------------------------

RegisterServerEvent('expulsar')

AddEventHandler('expulsar', function(idvrp)--Recebe os valores do arquivo hitman_c.lua, os valores são as informações que o jogador coloca no /contrato, player = jogador que colocou o contrato, nick = vitima, valor = valor do contrato

idvrp = tonumber(idvrp)

function batata()

      vRP.addUserGroup({idvrp,"Civil"})
      vRPclient.notify(idvrp,{"Você foi expulso da sua organização"})

end






local user_id = vRP.getUserId({source})
local src = vRP.getUserSource({user_id})
local joblider = vRP.getUserGroupByType({user_id, 'job'})
local jobmembro = vRP.getUserGroupByType({idvrp, 'job'})
local isLider = false

if idvrp ~= nil then





  idvrp = tonumber(idvrp)

  
  
  

  if joblider == "[PF] Delegado Chefe" then
	isLider = true
    if jobmembro.find(jobmembro, "PF") then

	batata()

    end
end

  if joblider == "[PMESP] Comandante" then
	isLider = true
    if jobmembro.find(jobmembro, "PMESP") then

	batata()

    end
end
  if joblider == "[ROTA] Comandante" then
	isLider = true
    if jobmembro.find(jobmembro, "ROTA") then

	batata()

    end
end
  if joblider == "[Unimed] Diretor" then
	isLider = true
    if jobmembro.find(jobmembro, "Unimed") then

	batata()

    end
end
  if joblider == "[MAFIA] Chefe" then
	isLider = true
    if jobmembro.find(jobmembro, "MAFIA") then

	batata()

    end
end
  if joblider == "[M.C] Lider" then
	isLider = true
    if jobmembro.find(jobmembro, "M.C") then

	batata()

    end
end
  if joblider == "[C.V] Dono do Morro" then
	isLider = true
    if jobmembro.find(jobmembro, "C.V") then

	batata()

    end
end
  if joblider == "[P.C.C] Lider" then
	isLider = true
    if jobmembro.find(jobmembro, "P.C.C") then

	batata()

    end
end
  if joblider == "[F.D.N] Dono do Morro" then
	isLider = true
    if jobmembro.find(jobmembro, "F.D.N") then

	batata()

    end
end
  if joblider == "[A.D.A] Dono" then
	isLider = true
    if jobmembro.find(jobmembro, "A.D.A") then

	batata()

    end
end
	
	
	
	
	
	
	if isLider == false then
   vRPclient.notify(src,{"~g~Apenas lideres podem usar o comando"})
   else
   isLider = false
	end
  
else
  vRPclient.notify(src,{"~g~Use /expulsar ID"})
end


end)


