local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vRP_banking")
isTransfer = false



convidado = {}
for i = 1, 2 do
  convidado[i] = {}

end

------------------------------------------------------/convidarorg-----------------------------------------------------

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


------------------------------------------------------/aceitarconvite-----------------------------------------------------

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



------------------------------------------------------/expulsar id-----------------------------------------------------

RegisterServerEvent('expulsar')

AddEventHandler('expulsar', function(idvrp)--Recebe os valores do arquivo hitman_c.lua, os valores são as informações que o jogador coloca no /contrato, player = jogador que colocou o contrato, nick = vitima, valor = valor do contrato

idvrp = tonumber(idvrp)

function expulsar()

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

      expulsar()

    end
  end

  if joblider == "[PMESP] Comandante" then
    isLider = true
    if jobmembro.find(jobmembro, "PMESP") then

      expulsar()

    end
  end
  if joblider == "[ROTA] Comandante" then
    isLider = true
    if jobmembro.find(jobmembro, "ROTA") then

      expulsar()

    end
  end
  if joblider == "[Unimed] Diretor" then
    isLider = true
    if jobmembro.find(jobmembro, "Unimed") then

      expulsar()

    end
  end
  if joblider == "[MAFIA] Chefe" then
    isLider = true
    if jobmembro.find(jobmembro, "MAFIA") then

      expulsar()

    end
  end
  if joblider == "[M.C] Lider" then
    isLider = true
    if jobmembro.find(jobmembro, "M.C") then

      expulsar()

    end
  end
  if joblider == "[C.V] Dono do Morro" then
    isLider = true
    if jobmembro.find(jobmembro, "C.V") then

      expulsar()

    end
  end
  if joblider == "[P.C.C] Lider" then
    isLider = true
    if jobmembro.find(jobmembro, "P.C.C") then

      expulsar()

    end
  end
  if joblider == "[F.D.N] Dono do Morro" then
    isLider = true
    if jobmembro.find(jobmembro, "F.D.N") then

      expulsar()

    end
  end
  if joblider == "[A.D.A] Dono" then
    isLider = true
    if jobmembro.find(jobmembro, "A.D.A") then

      expulsar()

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



------------------------------------------------------/promover id-----------------------------------------------------




RegisterServerEvent('promover')

AddEventHandler('promover', function(idvrp)--Recebe os valores do arquivo hitman_c.lua, os valores são as informações que o jogador coloca no /contrato, player = jogador que colocou o contrato, nick = vitima, valor = valor do contrato
idvrp = tonumber(idvrp)
local user_id = vRP.getUserId({source})
local src = vRP.getUserSource({user_id})
local joblider = vRP.getUserGroupByType({user_id, 'job'})
local jobmembro = vRP.getUserGroupByType({idvrp, 'job'})
local isLider = false

if idvrp ~= nil then



  function promover(cargo)

    vRP.addUserGroup({idvrp,cargo})
    vRPclient.notify(idvrp,{"Você foi promovido !"})
    vRPclient.notify(src,{"Você promoveu o jogador de ID: "..idvrp.." para o cargo: "..cargo})
  end






---------------------------------------------PF---------------------------------------------

  if joblider == "[PF] Delegado Chefe" then

    isLider = true
    if jobmembro == "[PF] Agente" then

      promover("[PF] Investigador")

    
	elseif jobmembro == "[PF] Investigador" then
      promover("[PF] Escrivão")


    elseif jobmembro == "[PF] Escrivão" then
      promover("[PF] Perito Criminal")


    elseif jobmembro == "[PF] Perito Criminal" then
      promover("[PF] Delegado Adjunto")
   

   elseif jobmembro == "[PF] Delegado Adjunto" then
      vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
    end
  end
  
---------------------------------------------PMESP---------------------------------------------
  
   if joblider == "[PMESP] Comandante" then

    isLider = true
    if jobmembro == "[PMESP] Recruta" then
      promover("[PMESP] Soldado")

    
	elseif jobmembro == "[PMESP] Soldado" then
      promover("[PMESP] Cabo")


    elseif jobmembro == "[PMESP] Cabo" then
      promover("[PMESP] 3º Sargento")


    elseif jobmembro == "[PMESP] 3º Sargento" then
      promover("[PMESP] 2º Sargento")
   

   elseif jobmembro == "[PMESP] 2º Sargento" then
      promover("[PMESP] 1º Sargento")
	

	elseif jobmembro == "[PMESP] 1º Sargento" then
      promover("[PMESP] SubTenente")
	 

    elseif jobmembro == "[PMESP] SubTenente" then
      promover("[PMESP] 2º Tenente")
	  
   
    elseif jobmembro == "[PMESP] 2º Tenente" then
      promover("[PMESP] 1º Tenente")
	  
   
    elseif jobmembro == "[PMESP] 1º Tenente" then
      promover("[PMESP] Capitao")

	
	elseif jobmembro == "[PMESP] Capitao" then
      promover("[PMESP] Major")

	
	elseif jobmembro == "[PMESP] Major" then
      promover("[PMESP] Ten. Coronel")

	
	elseif jobmembro == "[PMESP] Ten. Coronel" then
      promover("[PMESP] Coronel")

	elseif jobmembro == "[PMESP] Coronel" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end

---------------------------------------------Unimed---------------------------------------------

 if joblider == "[Unimed] Diretor" then

    isLider = true
    if jobmembro == "[Unimed] Estagiario" then
      promover("[Unimed] Paramedico")

    
	elseif jobmembro == "[Unimed] Paramedico" then
      promover("[Unimed] Enfermeiro")


    elseif jobmembro == "[Unimed] Enfermeiro" then
      promover("[Unimed] Socorrista")


    elseif jobmembro == "[Unimed] Socorrista" then
      promover("[Unimed] Medico")
   

   elseif jobmembro == "[Unimed] Medico" then
      promover("[Unimed] Cirurgiao")
	
	
	elseif jobmembro == "[Unimed] Cirurgiao" then
      promover("[Unimed] Doutor")
	  
	elseif jobmembro == "[Unimed] Doutor" then
      promover("[Unimed] Vice-Diretor")
	elseif jobmembro == "[Unimed] Vice-Diretor" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end

---------------------------------------------Mafia---------------------------------------------

 if joblider == "[MAFIA] Chefe" then

    isLider = true
    if jobmembro == "[MAFIA] Membro" then
      promover("[MAFIA] Gerente")

    
	elseif jobmembro == "[MAFIA] Gerente" then
      promover("[MAFIA] Sub-Chefe")


    elseif jobmembro == "[MAFIA] Sub-Chefe" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})

  end
end

---------------------------------------------M.C---------------------------------------------

 if joblider == "[M.C] Lider" then

    isLider = true
    if jobmembro == "[M.C] Membro" then
      promover("[M.C] Gerente")

    
	elseif jobmembro == "[M.C] Gerente" then
      promover("[M.C] Vice Lider")


    elseif jobmembro == "[M.C] Vice Lider" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end

---------------------------------------------C.V---------------------------------------------

 if joblider == "[C.V] Dono do Morro" then

    isLider = true
    if jobmembro == "[C.V] Vapor" then
      promover("[C.V] Braço Direito")

    
	elseif jobmembro == "[C.V] Braço Direito" then
      promover("[C.V] Gerente")


    elseif jobmembro == "[C.V] Gerente" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end

---------------------------------------------P.C.C---------------------------------------------

 if joblider == "[P.C.C] Lider" then

    isLider = true
    if jobmembro == "[P.C.C] Vapor" then
      promover("[P.C.C] Braço Direito")

    
	elseif jobmembro == "[P.C.C] Braço Direito" then
      promover("[P.C.C] Sub-Lider")


    elseif jobmembro == "[P.C.C] Sub-Lider" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end

---------------------------------------------F.D.N--------------------------------------------

 if joblider == "[F.D.N] Dono do Morro" then

    isLider = true
    if jobmembro == "[F.D.N] Vapor" then
      promover("[F.D.N] Braço Direito")

    
	elseif jobmembro == "[F.D.N] Braço Direito" then
      promover("[F.D.N] Sub Dono")


    elseif jobmembro == "[F.D.N] Sub Dono" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end

---------------------------------------------A.D.A-------------------------------------------

 if joblider == "[A.D.A] Dono" then

    isLider = true
    if jobmembro == "[A.D.A] Membro" then
      promover("[A.D.A] Braço Direito")

    
	elseif jobmembro == "[A.D.A] Braço Direito" then
      promover("[A.D.A] Sub Dono")


    elseif jobmembro == "[A.D.A] Sub Dono" then
	  vRPclient.notify(src,{"O jogador já está no maior cargo possivel !"})
  end
end



end



end)
