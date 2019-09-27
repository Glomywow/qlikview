@echo off
net stop "QlikviewServer" & net start "QlikviewServer"
net stop "QlikviewWebserver" & net start "QlikviewWebserver"
ping 127.0.0.1 -n 30 > nul
net start "QlikviewWebserver"
ping 127.0.0.1 -n 10 > nul
net start "QlikviewServer"
eventcreate /l "application" /t information /so "QlickviewCPU" /id 145 /d "Перезапускаю службу 14:15"
exit
