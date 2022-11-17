############################################################################################
#                       NSIS Installation Script For GC Studio  V.1.03
#                                   By Angel Mier                              
############################################################################################

######################################################################
# Includes

!include "MUI.nsh"
!include "LogicLib.nsh"

######################################################################
# Installer Configuration

!define APP_NAME "GC Studio"
!define COMP_NAME "Mier Engineering"
!define WEB_SITE "https://www.gcbasic.com"
!define VERSION "1.03.00.00"
!define COPYRIGHT "Copyright © 2007 - 2022"
!define DESCRIPTION "Application"
!define LICENSE_TXT ".\GCstudio\Build\net6.0-windows\license.txt"
!define INSTALLER_NAME ".\GCstudioSetup.exe"
!define MAIN_APP_EXE "GCstudio.exe"
!define INSTALL_TYPE "SetShellVarContext current"
!define REG_ROOT "HKCU"
!define REG_CLASSES "HKCR"
!define REG_APP_PATH "Software\Microsoft\Windows\CurrentVersion\App Paths\${MAIN_APP_EXE}"
!define UNINSTALL_PATH "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"

######################################################################
# Bynary Information

VIProductVersion  "${VERSION}"
VIAddVersionKey "ProductName"  "${APP_NAME}"
VIAddVersionKey "CompanyName"  "${COMP_NAME}"
VIAddVersionKey "LegalCopyright"  "${COPYRIGHT}"
VIAddVersionKey "FileDescription"  "${DESCRIPTION}"
VIAddVersionKey "FileVersion"  "${VERSION}"

######################################################################
# Compression and installer settings

SetCompressor LZMA
Name "${APP_NAME}"
Caption "${APP_NAME} Install Program"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
InstallDirRegKey "${REG_ROOT}" "${REG_APP_PATH}" ""
InstallDir "C:\GCstudio"

######################################################################
# Modern UI configuration

!define MUI_ICON ".\Res\Installericon.ico"
!define MUI_UNICON ".\Res\Uninsntallico.ico"
#!define MUI_WELCOMEFINISHPAGE_BITMAP_NOSTRETCH
!define MUI_WELCOMEFINISHPAGE_BITMAP ".\Res\left.bmp"
#!define MUI_UNWELCOMEFINISHPAGE_BITMAP_NOSTRETCH
!define MUI_UNWELCOMEFINISHPAGE_BITMAP ".\Res\left.bmp"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP_NOSTRETCH
#!define MUI_HEADERIMAGE_RIGHT
!define MUI_HEADERIMAGE_BITMAP ".\Res\top.bmp"

#Option Run PICKitPlus clone tool 
!define MUI_FINISHPAGE_RUN_TEXT "Open PICKitPlus Clone Tool"
!define MUI_FINISHPAGE_RUN_NOTCHECKED
!define MUI_FINISHPAGE_RUN "$INSTDIR\${MAIN_APP_EXE}"
!define MUI_FINISHPAGE_RUN_PARAMETERS "/pkp"


!define MUI_ABORTWARNING
!define MUI_UNABORTWARNING

!insertmacro MUI_PAGE_WELCOME

!ifdef LICENSE_TXT
!insertmacro MUI_PAGE_LICENSE "${LICENSE_TXT}"
!endif

!insertmacro MUI_PAGE_DIRECTORY

!ifdef REG_START_MENU
!define MUI_STARTMENUPAGE_NODISABLE
!define MUI_STARTMENUPAGE_DEFAULTFOLDER "GC Studio"
!define MUI_STARTMENUPAGE_REGISTRY_ROOT "${REG_ROOT}"
!define MUI_STARTMENUPAGE_REGISTRY_KEY "${UNINSTALL_PATH}"
!define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "${REG_START_MENU}"
!insertmacro MUI_PAGE_STARTMENU Application $SM_Folder
!endif

!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM

!insertmacro MUI_UNPAGE_INSTFILES

!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

######################################################################
# Main program, Files and prerequisites

Section -MainProgram
${INSTALL_TYPE}
SetOverwrite ifnewer

#Prereq Net6
SetOutPath "$INSTDIR"
File /r ".\Redist\Net6x86.exe"
ExecWait "$INSTDIR\Net6x86.exe /install /quiet /norestart /log Log\Net6.log"
Delete "$INSTDIR\Net6x86.exe"

#Prereq Net7
SetOutPath "$INSTDIR"
File /r ".\Redist\Net7x86.exe"
ExecWait "$INSTDIR\Net7x86.exe /install /quiet /norestart /log Log\Net7.log"
Delete "$INSTDIR\Net7x86.exe"

#GCstudio
SetOutPath "$INSTDIR"
File /r ".\GCstudio\Build\net6.0-windows\*"

#GCcode
SetOutPath "$INSTDIR\vscode"
File /r ".\GCcode\Build\vscode\*"

#File Icons
SetOutPath "$INSTDIR\FileIcons"
File /r ".\FileIcons\*"

#GCB Master Build
SetOutPath "$INSTDIR"
File /r ".\GCB@Syn\*"

#Extras
SetOutPath "$INSTDIR"
File /r ".\Extras\*"

#USE.ine
IfFileExists $INSTDIR\GreatCowBasic\use.ini +3 0
SetOutPath "$INSTDIR\GreatCowBasic"
File /r ".\GCB@Syn\use_in_master\*"

SectionEnd

######################################################################
# Write Reg Keys and make Uninstaller

Section -Icons_Reg
SetOutPath "$INSTDIR"
WriteUninstaller "$INSTDIR\uninstall.exe"

#Add Path
; Check if the path entry already exists and write result to $0
nsExec::Exec 'echo %PATH% | find "$INSTDIR\vscode\bin"'
Pop $0   ; gets result code

${If} $0 = 0
    nsExec::Exec 'setx PATH %PATH%;$INSTDIR\vscode\bin'
${EndIf}

#Start menu and desktop shortcuts
!ifdef REG_START_MENU
!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
CreateDirectory "$SMPROGRAMS\$SM_Folder"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!insertmacro MUI_STARTMENU_WRITE_END
!endif

!ifndef REG_START_MENU
CreateDirectory "$SMPROGRAMS\GC Studio"
CreateShortCut "$SMPROGRAMS\GC Studio\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
CreateShortCut "$DESKTOP\${APP_NAME}.lnk" "$INSTDIR\${MAIN_APP_EXE}"
!ifdef WEB_SITE
WriteIniStr "$INSTDIR\${APP_NAME} website.url" "InternetShortcut" "URL" "${WEB_SITE}"
CreateShortCut "$SMPROGRAMS\GC Studio\${APP_NAME} Website.lnk" "$INSTDIR\${APP_NAME} website.url"
!endif
!endif

#App reg keys
WriteRegStr ${REG_ROOT} "${REG_APP_PATH}" "" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayName" "${APP_NAME}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "UninstallString" "$INSTDIR\uninstall.exe"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayIcon" "$INSTDIR\${MAIN_APP_EXE}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "DisplayVersion" "${VERSION}"
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "Publisher" "${COMP_NAME}"

#HKCU Environment key
WriteRegStr ${REG_ROOT} "Environment"  "GCBASIC_INSTALL_PATH" "$INSTDIR\"

#File Associations
WriteRegStr ${REG_CLASSES} ".gcb" "" "GCB File"
WriteRegStr ${REG_CLASSES} "GCB File\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "GCB File\Defaulticon" "" "$INSTDIR\GCstudio.exe,0"

WriteRegStr ${REG_CLASSES} ".asm" "" "ASM File"
WriteRegStr ${REG_CLASSES} "ASM File\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "ASM File\Defaulticon" "" "$INSTDIR\FileIcons\asm.ico,0"

WriteRegStr ${REG_CLASSES} ".s" "" "S File"
WriteRegStr ${REG_CLASSES} "S File\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "S File\Defaulticon" "" "$INSTDIR\FileIcons\asm.ico,0"

WriteRegStr ${REG_CLASSES} ".bas" "" "FBasic File"
WriteRegStr ${REG_CLASSES} "FBasic File\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "FBasic File\Defaulticon" "" "$INSTDIR\FileIcons\bas.ico,0"

WriteRegStr ${REG_CLASSES} ".bi" "" "Fbasic Library"
WriteRegStr ${REG_CLASSES} "Fbasic Library\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "Fbasic Library\Defaulticon" "" "$INSTDIR\FileIcons\h.ico,0"

WriteRegStr ${REG_CLASSES} ".h" "" "GCB Library"
WriteRegStr ${REG_CLASSES} "GCB Library\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "GCB Library\Defaulticon" "" "$INSTDIR\FileIcons\h.ico,0"

WriteRegStr ${REG_CLASSES} ".json" "" "Json File"
WriteRegStr ${REG_CLASSES} "Json File\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "Json File\Defaulticon" "" "$INSTDIR\FileIcons\json.ico,0"

WriteRegStr ${REG_CLASSES} ".code-workspace" "" "GCB Project"
WriteRegStr ${REG_CLASSES} "GCB Project\shell\open\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "GCB Project\Defaulticon" "" "$INSTDIR\FileIcons\project.ico,0"


#Windows Context Menu
#shell
WriteRegStr ${REG_CLASSES} "Directory\shell\GCstudio" "" "Open with GC Studio"
WriteRegStr ${REG_CLASSES} "Directory\shell\GCstudio\command" ""  "$INSTDIR\GCstudio.exe $\"%V$\""
WriteRegStr ${REG_CLASSES} "Directory\shell\GCstudio" "Icon" "$INSTDIR\GCstudio.exe,0"

WriteRegStr ${REG_CLASSES} "Directory\Background\shell\GCstudio" "" "Open with GC Studio"
WriteRegStr ${REG_CLASSES} "Directory\Background\shell\GCstudio\command" ""  "$INSTDIR\GCstudio.exe $\"%V$\""
WriteRegStr ${REG_CLASSES} "Directory\Background\shell\GCstudio" "Icon" "$INSTDIR\GCstudio.exe,0"

WriteRegStr ${REG_ROOT} "Software\Classes\Directory\Background\shell\GCstudio" "" "Open with GC Studio"
WriteRegStr ${REG_ROOT} "Software\Classes\Directory\Background\shell\GCstudio\command" ""  "$INSTDIR\GCstudio.exe $\"%V$\""
WriteRegStr ${REG_ROOT} "Software\Classes\Directory\Background\shell\GCstudio" "Icon" "$INSTDIR\GCstudio.exe,0"

#drive
WriteRegStr ${REG_CLASSES} "Drive\shell\GCstudio" "" "Open with GC Studio"
WriteRegStr ${REG_CLASSES} "Drive\shell\GCstudio\command" ""  "$INSTDIR\GCstudio.exe $\"%V$\""
WriteRegStr ${REG_CLASSES} "Drive\shell\GCstudio" "Icon" "$INSTDIR\GCstudio.exe,0"

#files
WriteRegStr ${REG_CLASSES} "*\shell\GCstudio" "" "Open with GC Studio"
WriteRegStr ${REG_CLASSES} "*\shell\GCstudio\command" ""  "$INSTDIR\GCstudio.exe $\"%1$\""
WriteRegStr ${REG_CLASSES} "*\shell\GCstudio" "Icon" "$INSTDIR\GCstudio.exe,0"


!ifdef WEB_SITE
WriteRegStr ${REG_ROOT} "${UNINSTALL_PATH}"  "URLInfoAbout" "${WEB_SITE}"
!endif
SectionEnd

######################################################################
# Uninstaller Configuration

Section Uninstall
${INSTALL_TYPE}
#Delete /r "$INSTDIR\*.*"
Delete "$INSTDIR\uninstall.exe"
RmDir /r "$INSTDIR"
!ifdef WEB_SITE
Delete "$INSTDIR\${APP_NAME} website.url"
!endif

RmDir /r "$INSTDIR"

!ifdef REG_START_MENU
!insertmacro MUI_STARTMENU_GETFOLDER "Application" $SM_Folder
Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME}.lnk"
!ifdef WEB_SITE
Delete "$SMPROGRAMS\$SM_Folder\${APP_NAME} Website.lnk"
!endif
Delete "$DESKTOP\${APP_NAME}.lnk"

RmDir "$SMPROGRAMS\$SM_Folder"
!endif

!ifndef REG_START_MENU
Delete "$SMPROGRAMS\GC Studio\${APP_NAME}.lnk"
!ifdef WEB_SITE
Delete "$SMPROGRAMS\GC Studio\${APP_NAME} Website.lnk"
!endif
Delete "$DESKTOP\${APP_NAME}.lnk"

RmDir "$SMPROGRAMS\GC Studio"
!endif

DeleteRegKey ${REG_ROOT} "${REG_APP_PATH}"
DeleteRegKey ${REG_ROOT} "${UNINSTALL_PATH}"
SectionEnd

######################################################################

