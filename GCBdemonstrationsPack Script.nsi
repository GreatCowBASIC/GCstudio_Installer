############################################################################################
#                       NSIS GCBdemostrationsPack Script For GC Studio  V.1.00
#                                   By Angel Mier                              
############################################################################################

######################################################################
# Includes

######################################################################
# Installer Configuration

!define APP_NAME "GC Studio Demonstrations Pack"
!define COMP_NAME "Mier Engineering"
!define WEB_SITE "https://www.gcbasic.com"
!define VERSION "1.02.00.00"
!define COPYRIGHT "Copyright © 2007 - 2022"
!define DESCRIPTION "Application"
!define INSTALLER_NAME ".\GCBdemonstrationsPack.exe"
!define MAIN_APP_EXE "GCstudio.exe"
!define INSTALL_TYPE "SetShellVarContext current"
!define REG_APP_PATH "Software\Microsoft\Windows\CurrentVersion\App Paths\${MAIN_APP_EXE}"
!define REG_ROOT "HKCU"
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

SetCompressor /solid LZMA
SetCompressorDictSize 64
SetDatablockOptimize ON
Name "${APP_NAME}"
Caption "${APP_NAME}"
OutFile "${INSTALLER_NAME}"
BrandingText "${APP_NAME}"
XPStyle on
InstallDirRegKey "${REG_ROOT}" "${REG_APP_PATH}" ""
InstallDir "C:\GCstudio"
RequestExecutionLevel user

Page directory
Page instfiles

######################################################################
# Main program, Demos Files
Icon ".\Res\Installericon.ico"
Section -MainProgram
${INSTALL_TYPE}
SetOverwrite on

SetOutPath "$INSTDIR\GreatCowBasic\demos\"
File /r /x .Git /x tutorials /x *.mkv /x *.mov /x *.mp4 /x *.pptx ".\Demonstration_Sources\*"


SectionEnd


######################################################################
