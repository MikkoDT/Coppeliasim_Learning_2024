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

function sysCall_init()
    sim = require('sim')
left_arm=sim.getObjectHandle('left_arm_joint')
    right_arm=sim.getObjectHandle('right_arm_joint')
    left_wheel=sim.getObjectHandle('left_joint')
    right_wheel=sim.getObjectHandle('right_joint')
    wheel_radius=0.03
    max_speed=0.03
    max_turn=0.3
    speed=0
    turn=0
    b=0.0565
    gripper_open=false
    ui=simUI.create('<ui enabled="true" modal="false" title="DYOR" closeable="true" layout="vbox" placement="relative" position="20,20">' ..
    '<label enabled="true" text="Linear Speed"></label>' ..
    '<hslider enabled="true" minimum="-100" maximum="100" on-change="onSpeedChange"></hslider>' ..
    '<label enabled="true" text="Angular Speed"></label>' ..
    '<hslider enabled="true" minimum="-100" maximum="100" on-change="onTurnChange"></hslider>' ..
    '<button enabled="true" text="Open/Close" checkable="true" on-click="onGripper"></button>' ..
    '<button enabled="true" text="Forward" on-click="moveForward"></button>' ..
    '<button enabled="true" text="Backwards" on-click="moveBackwards"></button>' ..
    '<button enabled="true" text="Left" on-click="turnLeft"></button>' ..
    '<button enabled="true" text="Right" on-click="turnRight"></button>' ..
    '<button enabled="true" text="Stop" on-click="stop"></button>' ..
    '</ui>')
    -- do some initialization here
end