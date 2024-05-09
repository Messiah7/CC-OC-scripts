textutils.slowPrint("I'm gonna make this extruder disappear", 15)
print("Fuel level: " .. turtle.getFuelLevel()/640 .. "%")

function prepareToWork()

 getTheFuel()
end

function getTheFuel()
  if turtle.getFuelLevel()/640 < 30 then
   turtle.select(16)
   while turtle.getFuelLevel()/640 < 80 do
    if not turtle.suck(64) then return false end
    turtle.refuel()
    print("Fuel level: " .. turtle.getFuelLevel()/640 .. "%")
   end
  end
 turtle.select(1)
 
 getToWork()
end

function giveItBack()
--Currently not used due importing mold from turtle via AE2
 getTheFuel()
end

function getToWork()
 while true do
  gtnm = ({turtle.inspectUp()})[2].name
  extrd = "gtceu:mv_extruder"
  event = os.pullEvent("redstone") 
  rstop = rs.getInput("bottom")
  success = gtnm == extrd

  if gtnm == extrd and rstop == true then
   printError("Machine is still working!")
   os.sleep(.5)
  elseif gtnm ~= extrd and rstop == true then
   while not success do
    printError("No machine found!")
    os.sleep(1.5)
   break
   end
  end
   
  if event == "redstone" then
   if gtnm == extrd and rstop ~= true then
    turtle.digUp()
    turtle.placeUp()
    textutils.slowPrint("Ta da! It's... It's gone.", 15)
    os.sleep(.5)
	
    giveItBack()
   end
  end
 end
end

prepareToWork()
