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