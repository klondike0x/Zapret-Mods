@echo off
chcp 65001 > nul

cd /d "%~dp0"
call service.bat status_zapret
call service.bat check_updates
call service.bat load_game_filter
echo:

set "BIN=%~dp0bin\"
set "LISTS=%~dp0lists\"
cd /d %BIN%

start "zapret: %~n0" /min "%BIN%winws.exe" --wf-tcp=80,443,2053,2083,2087,2096,8095,8443,9000,10010,13000,14000,14008,14020,14021,14022,14023,14024,15018,15091,%GameFilter% --wf-udp=443,3074,3478-3480,3659,1000-20000,19294-19344,21011,21014,21018,21020,21021,21023,21025,21027,21031,21036,21081,21086,21476,50000-50100,65535,%GameFilter% ^
--filter-udp=443 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --dpi-desync-fooling=md5sig,badseq --dpi-desync-any-protocol=1 --new ^
--filter-udp=19294-19344,50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-cutoff=n2 --dpi-desync-fooling=md5sig --dpi-desync-any-protocol=1 --new ^
--filter-tcp=80 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=0x00000000 --dpi-desync-fake-tls=^! --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --dpi-desync-any-protocol=1 --new ^
--filter-tcp=2053,2083,2087,2096,8095,8443,9000 --hostlist-domains=discord.media --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=3 --dpi-desync-fooling=badseq --dpi-desync-any-protocol=1 --new ^
--filter-tcp=443 --hostlist="%LISTS%list-google.txt" --ip-id=zero --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=0x00000000 --dpi-desync-fake-tls=^! --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new ^
--filter-tcp=80,443 --hostlist="%LISTS%list-general.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=0x00000000 --dpi-desync-fake-tls=^! --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --dpi-desync-any-protocol=1 --new ^
--filter-udp=443 --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --dpi-desync-fooling=md5sig,badseq --dpi-desync-any-protocol=1 --new ^
--filter-tcp=80 --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=multisplit --dpi-desync-split-seqovl=681 --dpi-desync-split-pos=1 --dpi-desync-split-seqovl-pattern="%BIN%4pda.bin" --dpi-desync-repeats=3 --dpi-desync-fooling=badseq --dpi-desync-any-protocol=1 --new ^
--filter-tcp=10010,13000,14000,14008,14020-14024,15018,15091 --dpi-desync=fake --dpi-desync-repeats=8 --dpi-desync-fake-tls="%BIN%tls_clienthello_www_google_com.bin" --dpi-desync-fooling=md5sig --dpi-desync-any-protocol=1 --new ^
--filter-tcp=80,443,%GameFilter% --ipset="%LISTS%ipset-all.txt" --hostlist-exclude="%LISTS%list-exclude.txt" --ipset-exclude="%LISTS%ipset-exclude.txt" --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=badseq --dpi-desync-fake-tls=0x00000000 --dpi-desync-fake-tls=^! --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --dpi-desync-any-protocol=1 --new ^
--filter-udp=3074,3478-3480,3659 --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-cutoff=n2 --dpi-desync-fooling=md5sig --dpi-desync-any-protocol=1 --new ^
--filter-udp=21011,21014,21018,21020,21021,21023,21025,21027,21031,21036,21081,21086,21476,65535 --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=8 --dpi-desync-fake-unknown-udp="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n3 --dpi-desync-any-protocol=1 --new ^
--filter-udp=1000-20000,%GameFilter% --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=6 --dpi-desync-fake-unknown-udp="%BIN%quic_initial_www_google_com.bin" --dpi-desync-cutoff=n2 --dpi-desync-any-protocol=1 --new