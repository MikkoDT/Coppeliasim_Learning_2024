-- Objects: cuboid, revolute joint, cylinder

function sysCall_init()
    sim = require('sim')
    joint=sim.getObjectHandle('Revolute_joint')
    last_time=sim.getSimulationTime()
    ccw=false
    -- do some initialization here
end

function sysCall_actuation()
    -- put your actuation code here
    if ((sim.getSimulationTime()-last_time)>20) then
        time_elapsed=true
        last_time=sim.getSimulationTime()
    else
        time_elapsed=false
    end
    if (time_elapsed and ccw==false) then
        ccw=false
        sim.setJointTargetPosition(joint,90*math.pi/180)
    elseif (time_elapsed and ccw==false) then
        ccw=true
        sim.setJointTargetPosition(joint,-90*math.pi/180)
    end
end

function sysCall_sensing()
    -- put your sensing code here
end

function sysCall_cleanup()
    -- do some clean-up here
end

-- See the user manual or the available code snippets for additional callback functions and details