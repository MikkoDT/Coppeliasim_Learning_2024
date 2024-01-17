-- lua
function onSpeedChange(uiHandle, id, newValue)
    speed=newValue*max_speed/100
    move(speed,turn)
end
function onTurnChange(uiHandle, id, newValue)
    turn=newValue*max_turn/100
    move(speed,turn)
end
function onGripper()
  if gripper_open then
    closeGripper()
    gripper_open=false
  else
    openGripper()
    gripper_open=true
  end
end
function openGripper()
    sim.setJointTargetPosition(left_arm,30*math.pi/180)
    sim.setJointTargetPosition(right_arm,-30*math.pi/180)
end
function closeGripper()
    sim.setJointTargetPosition(left_arm,-10*math.pi/180)
    sim.setJointTargetPosition(right_arm,10*math.pi/180)
end
function move(v,w)
    sim.setJointTargetVelocity(left_wheel,(v-b*w)/wheel_radius)
    sim.setJointTargetVelocity(right_wheel,(v+b*w)/wheel_radius)
end
function moveForward()
    sim.setJointTargetVelocity(left_wheel,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel,0.5*max_speed/wheel_radius)
end
function moveBackwards()
    sim.setJointTargetVelocity(left_wheel,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel,-0.5*max_speed/wheel_radius)
end
function turnLeft()
    sim.setJointTargetVelocity(left_wheel,-0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel,0.5*max_speed/wheel_radius)
end
function turnRight()
    sim.setJointTargetVelocity(left_wheel,0.5*max_speed/wheel_radius)
    sim.setJointTargetVelocity(right_wheel,-0.5*max_speed/wheel_radius)
end
function stop()
    sim.setJointTargetVelocity(left_wheel,0)
    sim.setJointTargetVelocity(right_wheel,0)
end