@echo y|cacls "C:\Windows\System32\drivers\etc\hosts" /e /p everyone:w
@echo\
@echo 127.0.0.1 muzi198783.iok.la >>C:\Windows\System32\drivers\etc\hosts
echo 修改完毕 按任意键退出~
rem netsh interface portproxy add v4tov4 listenport=27939 listenaddress=127.0.0.1 connectport=8880 connectaddress=127.0.0.1
@pause > nul