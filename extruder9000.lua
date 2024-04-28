print(" ")
print("Fuel level: " .. turtle.getFuelLevel()/640 .. "%")
function prepareToWork()
 getTheFuel()
end

function getTheFuel()
  if turtle.getFuelLevel()/640 < 30 then
   turtle.select(16)
   while turtle.getFuelLevel()/640 < 80 do
    if not turtle.suckDown(32) then return false end
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
 turtle.drop()
 turtle.select(2)
 turtle.drop()
 getTheFuel()
end
function getToWork()
 while true do
  gtnm = ({turtle.inspect()})[2].name
  extrd = "gtceu:mv_extruder"
  rstop = rs.getInput("top")
  success = gtnm == extrd

  if gtnm == extrd and rstop == true then
   print("WORK")
   os.sleep(.5)
  elseif gtnm ~= extrd and rstop == true then
   while not success do
    turtle.turnLeft()
    turtle.turnLeft()
    print("TURN")
    os.sleep(.5)
   break
   end
  elseif gtnm == extrd and rstop ~= true then
   turtle.dig()
   giveItBack()
   print("DIG")
   os.sleep(.5)
  end
 end
end

prepareToWork()