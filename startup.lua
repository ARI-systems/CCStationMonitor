local monitors = {
    peripheral.wrap("monitor_1"),
    peripheral.wrap("monitor_2")
}
local targetBlock = peripheral.find("create_target")
for index, monitor in ipairs(monitors) do
    monitor.setTextScale(0.7)
end
success = false
local w, h = 0, 0
repeat
    success, w, h = pcall(monitors[1].getSize)
    os.sleep(3)
until success
targetBlock.setWidth(w)

while true do
    for index, monitor in ipairs(monitors) do
        monitor.clear()
        local timeString = textutils.formatTime(os.time())
        monitor.setCursorPos(w - string.len(timeString), 1)
        monitor.write(timeString)
        for i = 1, h - 1, 1 do
            if (i > 16) then
                break
            end
            monitor.setCursorPos(1, i + 1)
            local line = targetBlock.getLine(i)
            if i == 1 then print(line) end
            monitor.write(line)
        end
    end
    os.sleep(3)
end
