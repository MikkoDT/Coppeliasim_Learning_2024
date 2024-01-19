if (sim_call_type==sim.syscb_init) then
    xml = [[
    <ui closeable="true" on-close="closeEventHandler" resizable="true" title="Hello World!">
    <label text="Hello World!"/>
    </ui>
    ]]
    
    ui=simUI.create(xml)
    
    progress=0
end
if (sim_call_type==sim.syscb_cleanup) then
    simUI.destroy(ui)
end