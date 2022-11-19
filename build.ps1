cd LFTP
.\lftp -f scriptdownload.txt
cd ..
cd GCstudio
git pull origin master
cd ..
cd GCcode
git reset --hard
git clean -fxd
git pull origin master
cd ..
.\minidump x GCcode\Build\Bin\Code.bin -y -oGCcode\Build\vscode
.\nsis\makensis /V4 "gc Studio NSIS Script.nsi"