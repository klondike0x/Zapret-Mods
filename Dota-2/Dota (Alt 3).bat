@echo off
chcp 65001 > nul
:: 65001 - UTF-8

cd /d "%~dp0"
call service.bat status_zapret
call service.bat check_updates
call service.bat load_game_filter
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"
cd /d %BIN%

start "zapret: %~n0" /min "%BIN%winws.exe" --wf-tcp=80,443,2053,2083,2087,2096,8443,13000,14000,14008,14020,14021,14022,14023,14024,%GameFilter% --wf-udp=443,19294-19344,50000-50100,3074,3478-3480,3659,1000-20000,%GameFilter% ^
--filter-udp=443 --hostlist="%LISTS%list-general.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --new ^
--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=4 --dpi-desync-cutoff=n2 --new ^
--filter-tcp=80 --hostlist="%LISTS%list-general.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=2 --new ^
--filter-tcp=2053,2083,2087,2096,8443 --hostlist-domains=discord.media --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=2 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-general.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=3 --new ^
--filter-udp=443 --ipset="%LISTS%ipset-all.txt" --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --new ^
--filter-tcp=80 --ipset="%LISTS%ipset-all.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=2 --new ^
--filter-tcp=443,13000,14000,14008,14020-14024,%GameFilter% --ipset="%LISTS%ipset-all.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=3 --new ^
--filter-udp=3074,3478-3480,3659,1000-20000,%GameFilter% --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fake-unknown-udp="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --new