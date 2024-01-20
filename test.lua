-- lua

function sysCall_init()
    sim = require('sim')
    

    -- do some initialization here
end

if (sim_call_type==sim.syscb_init) then
    xml = [[
    <ui closeable="true" on-close="closeEventHandler" resizable="true">
    <label text="DYOR"  wordwrap="true" />
    <label text="Linear Speed" />
    </ui>
    ]]
    
    ui=simUI.create(xml)
    
    progress=0
    
end    
if (sim_call_type==sim.syscb_cleanup) then
    simUI.destroy(ui)
end
function sysCall_actuation()
    -- put your actuation code here
end

function sysCall_sensing()
    -- put your sensing code here
end

function sysCall_cleanup()
    -- do some clean-up here
end

-- See the user manual or the available code snippets for additional callback functions and details