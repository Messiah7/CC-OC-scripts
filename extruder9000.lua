textutils.slowPrint("I'm gonna make this extruder disappear", 15)
print("Fuel level: " .. turtle.getFuelLevel()/640 .. "%")

function prepareToWork()
 getTheFuel()
end

function getTheFuel()
  if turtle.getFuelLevel()/640 < 30 then
   turtle.select(16)
   while turtle.getFuelLevel()/640 < 80 do
    if not turtle.suckDown(64) then return false end
    turtle.refuel()
    print("Fuel level: " .. turtle.getFuelLevel()/640 .. "%")
   end
  end
 turtle.select(1)
 getToWork()
end

function giveItBack()
 turtle.turnLeft()
 turtle.turnLeft()
 --for i = 1, 4 do
  turtle.select(1)
  turtle.drop()
  turtle.select(2)
  turtle.drop()
  turtle.select(3)
  turtle.drop()
  turtle.select(4)
  turtle.drop()
-- end
 getTheFuel()
end
function getToWork()
 while true do
  gtnm = ({turtle.inspect()})[2].name
  extrd = "gtceu:mv_extruder"
  rstop = rs.getInput("top")
  success = gtnm == extrd

  if gtnm == extrd and rstop == true then
   printError("Machine is still working!")
   os.sleep(.5)
  elseif gtnm ~= extrd and rstop == true then
   while not success do
    turtle.turnLeft()
    turtle.turnLeft()
    os.sleep(.5)
   break
   end
  elseif gtnm == extrd and rstop ~= true then
   turtle.dig()
   turtle.place()
   giveItBack()
   textutils.slowPrint("Ta da! It's... It's gone.", 15)
   os.sleep(.5)
  end
 end
end

prepareToWork()
