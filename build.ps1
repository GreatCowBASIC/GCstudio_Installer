## Old LFTP download, must be deprecated
#Set-Location LFTP
#.\lftp -f scriptdownload.txt
#Set-Location ..

Set-Location GCB_Gold
git pull origin master
Set-Location ..
Set-Location GCstudio
git pull origin master
Set-Location ..
Set-Location GCcode
git reset --hard
git clean -fxd
git pull origin master
Set-Location ..
.\minidump x GCcode\Build\Bin\Code.bin -y -oGCcode\Build\vscode
.\nsis\makensis /V4 "gc Studio NSIS Script.nsi"