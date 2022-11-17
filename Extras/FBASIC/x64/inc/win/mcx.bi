'' FreeBASIC binding for mingw-w64-v4.0.4
''
'' based on the C header files:
''   DISCLAIMER
''   This file has no copyright assigned and is placed in the Public Domain.
''   This file is part of the mingw-w64 runtime package.
''
''   The mingw-w64 runtime package and its code is distributed in the hope that it 
''   will be useful but WITHOUT ANY WARRANTY.  ALL WARRANTIES, EXPRESSED OR 
''   IMPLIED ARE HEREBY DISCLAIMED.  This includes but is not limited to 
''   warranties of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
''
'' translated to FreeBASIC by:
''   Copyright © 2015 FreeBASIC development team

#pragma once

#define _MCX_H_

type _MODEMDEVCAPS
	dwActualSize as DWORD
	dwRequiredSize as DWORD
	dwDevSpecificOffset as DWORD
	dwDevSpecificSize as DWORD
	dwModemProviderVersion as DWORD
	dwModemManufacturerOffset as DWORD
	dwModemManufacturerSize as DWORD
	dwModemModelOffset as DWORD
	dwModemModelSize as DWORD
	dwModemVersionOffset as DWORD
	dwModemVersionSize as DWORD
	dwDialOptions as DWORD
	dwCallSetupFailTimer as DWORD
	dwInactivityTimeout as DWORD
	dwSpeakerVolume as DWORD
	dwSpeakerMode as DWORD
	dwModemOptions as DWORD
	dwMaxDTERate as DWORD
	dwMaxDCERate as DWORD
	abVariablePortion(0 to 0) as UBYTE
end type

type MODEMDEVCAPS as _MODEMDEVCAPS
type PMODEMDEVCAPS as _MODEMDEVCAPS ptr
type LPMODEMDEVCAPS as _MODEMDEVCAPS ptr

type _MODEMSETTINGS
	dwActualSize as DWORD
	dwRequiredSize as DWORD
	dwDevSpecificOffset as DWORD
	dwDevSpecificSize as DWORD
	dwCallSetupFailTimer as DWORD
	dwInactivityTimeout as DWORD
	dwSpeakerVolume as DWORD
	dwSpeakerMode as DWORD
	dwPreferredModemOptions as DWORD
	dwNegotiatedModemOptions as DWORD
	dwNegotiatedDCERate as DWORD
	abVariablePortion(0 to 0) as UBYTE
end type

type MODEMSETTINGS as _MODEMSETTINGS
type PMODEMSETTINGS as _MODEMSETTINGS ptr
type LPMODEMSETTINGS as _MODEMSETTINGS ptr

const DIALOPTION_BILLING = &h00000040
const DIALOPTION_QUIET = &h00000080
const DIALOPTION_DIALTONE = &h00000100
const MDMVOLFLAG_LOW = &h00000001
const MDMVOLFLAG_MEDIUM = &h00000002
const MDMVOLFLAG_HIGH = &h00000004
const MDMVOL_LOW = &h00000000
const MDMVOL_MEDIUM = &h00000001
const MDMVOL_HIGH = &h00000002
const MDMSPKRFLAG_OFF = &h00000001
const MDMSPKRFLAG_DIAL = &h00000002
const MDMSPKRFLAG_ON = &h00000004
const MDMSPKRFLAG_CALLSETUP = &h00000008
const MDMSPKR_OFF = &h00000000
const MDMSPKR_DIAL = &h00000001
const MDMSPKR_ON = &h00000002
const MDMSPKR_CALLSETUP = &h00000003
const MDM_COMPRESSION = &h00000001
const MDM_ERROR_CONTROL = &h00000002
const MDM_FORCED_EC = &h00000004
const MDM_CELLULAR = &h00000008
const MDM_FLOWCONTROL_HARD = &h00000010
const MDM_FLOWCONTROL_SOFT = &h00000020
const MDM_CCITT_OVERRIDE = &h00000040
const MDM_SPEED_ADJUST = &h00000080
const MDM_TONE_DIAL = &h00000100
const MDM_BLIND_DIAL = &h00000200
const MDM_V23_OVERRIDE = &h00000400
const MDM_DIAGNOSTICS = &h00000800
const MDM_MASK_BEARERMODE = &h0000f000
const MDM_SHIFT_BEARERMODE = 12
const MDM_MASK_PROTOCOLID = &h000f0000
const MDM_SHIFT_PROTOCOLID = 16
const MDM_MASK_PROTOCOLDATA = &h0ff00000
const MDM_SHIFT_PROTOCOLDATA = 20
const MDM_MASK_PROTOCOLINFO = MDM_MASK_PROTOCOLID or MDM_MASK_PROTOCOLDATA
const MDM_SHIFT_PROTOCOLINFO = MDM_SHIFT_PROTOCOLID
const MDM_MASK_EXTENDEDINFO = MDM_MASK_BEARERMODE or MDM_MASK_PROTOCOLINFO
const MDM_SHIFT_EXTENDEDINFO = MDM_SHIFT_BEARERMODE
#define MDM_GET_BEARERMODE(_dwOptions) (((_dwOptions) and MDM_MASK_BEARERMODE) shr MDM_SHIFT_BEARERMODE)
#macro MDM_SET_BEARERMODE(_dwOptions, _bm)
	scope
		(_dwOptions) and= not MDM_MASK_BEARERMODE
		(_dwOptions) or= ((_bm) shl MDM_SHIFT_BEARERMODE) and MDM_MASK_BEARERMODE
	end scope
#endmacro
#define MDM_GET_PROTOCOLID(_dwOptions) (((_dwOptions) and MDM_MASK_PROTOCOLID) shr MDM_SHIFT_PROTOCOLID)
#macro MDM_SET_PROTOCOLID(_dwOptions, _prot)
	scope
		(_dwOptions) and= not MDM_MASK_PROTOCOLID
		(_dwOptions) or= ((_prot) shl MDM_SHIFT_PROTOCOLID) and MDM_MASK_PROTOCOLID
	end scope
#endmacro
#define MDM_GET_PROTOCOLDATA(_dwOptions) (((_dwOptions) and MDM_MASK_PROTOCOLDATA) shr MDM_SHIFT_PROTOCOLDATA)
#macro MDM_SET_PROTOCOLDATA(_dwOptions, _pd)
	scope
		(_dwOptions) and= not MDM_MASK_PROTOCOLDATA
		(_dwOptions) or= ((_pd) shl MDM_SHIFT_PROTOCOLDATA) and MDM_MASK_PROTOCOLDATA
	end scope
#endmacro
#define MDM_GET_PROTOCOLINFO(_dwOptions) ((_dwOptions) and MDM_MASK_PROTOCOLINFO)
#macro MDM_SET_PROTOCOLINFO(_dwOptions, _pinfo)
	scope
		(_dwOptions) and= not MDM_MASK_PROTOCOLINFO
		(_dwOptions) or= (_pinfo) and MDM_MASK_PROTOCOLINFO
	end scope
#endmacro
#define MDM_GEN_PROTOCOLINFO(_pid, _pdata) ((((_pid) shl MDM_SHIFT_PROTOCOLID) and MDM_MASK_PROTOCOLID) or (((_pdata) shl MDM_SHIFT_PROTOCOLDATA) and MDM_MASK_PROTOCOLDATA))
#define MDM_GET_EXTENDEDINFO(_dwOptions) ((_dwOptions) and MDM_MASK_EXTENDEDINFO)
#macro MDM_SET_EXTENDEDINFO(_dwOptions, _extinfo)
	scope
		(_dwOptions) and= not MDM_MASK_EXTENDEDINFO
		(_dwOptions) or= (_extinfo) and MDM_MASK_EXTENDEDINFO
	end scope
#endmacro
#define MDM_GEN_EXTENDEDINFO(_bearermode, _pinfo) (((_pinfo) and MDM_MASK_PROTOCOLINFO) or (((_bearermode) shl MDM_SHIFT_BEARERMODE) and MDM_MASK_BEARERMODE))
const MDM_BEARERMODE_ANALOG = &h0
const MDM_BEARERMODE_ISDN = &h1
const MDM_BEARERMODE_GSM = &h2
const MDM_PROTOCOLID_DEFAULT = &h0
const MDM_PROTOCOLID_HDLCPPP = &h1
const MDM_PROTOCOLID_V128 = &h2
const MDM_PROTOCOLID_X75 = &h3
const MDM_PROTOCOLID_V110 = &h4
const MDM_PROTOCOLID_V120 = &h5
const MDM_PROTOCOLID_AUTO = &h6
const MDM_PROTOCOLID_ANALOG = &h7
const MDM_PROTOCOLID_GPRS = &h8
const MDM_PROTOCOLID_PIAFS = &h9
const MDM_SHIFT_HDLCPPP_SPEED = &h0
const MDM_MASK_HDLCPPP_SPEED = &h7
const MDM_HDLCPPP_SPEED_DEFAULT = &h0
const MDM_HDLCPPP_SPEED_64K = &h1
const MDM_HDLCPPP_SPEED_56K = &h2
const MDM_SHIFT_HDLCPPP_AUTH = &h3
const MDM_MASK_HDLCPPP_AUTH = &h7 shl 3
const MDM_HDLCPPP_AUTH_DEFAULT = &h0
const MDM_HDLCPPP_AUTH_NONE = &h1
const MDM_HDLCPPP_AUTH_PAP = &h2
const MDM_HDLCPPP_AUTH_CHAP = &h3
const MDM_HDLCPPP_AUTH_MSCHAP = &h4
const MDM_SHIFT_HDLCPPP_ML = &h6
const MDM_MASK_HDLCPPP_ML = &h3 shl 6
const MDM_HDLCPPP_ML_DEFAULT = &h0
const MDM_HDLCPPP_ML_NONE = &h1
const MDM_HDLCPPP_ML_2 = &h2
#define MDM_GEN_HDLCPPP_PROTOCOL_DATA(_speed, _auth, _ml) (((((_speed) shl MDM_SHIFT_HDLCPPP_SPEED) and MDM_MASK_HDLCPPP_SPEED) or (((_auth) shl MDM_SHIFT_HDLCPPP_AUTH) and MDM_MASK_HDLCPPP_AUTH)) or (((_ml) shl MDM_SHIFT_HDLCPPP_ML) and MDM_MASK_HDLCPPP_ML))
#define MDM_PROTOCOL_HDLCPPP_64K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_64K, MDM_HDLCPPP_AUTH_DEFAULT, MDM_HDLCPPP_ML_DEFAULT))
#define MDM_PROTOCOL_HDLCPPP_56K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_56K, MDM_HDLCPPP_AUTH_DEFAULT, MDM_HDLCPPP_ML_DEFAULT))
#define MDM_PROTOCOL_HDLCPPP_112K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_56K, MDM_HDLCPPP_AUTH_DEFAULT, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_112K_PAP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_56K, MDM_HDLCPPP_AUTH_PAP, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_112K_CHAP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_56K, MDM_HDLCPPP_AUTH_CHAP, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_112K_MSCHAP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_56K, MDM_HDLCPPP_AUTH_MSCHAP, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_128K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_64K, MDM_HDLCPPP_AUTH_DEFAULT, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_128K_PAP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_64K, MDM_HDLCPPP_AUTH_PAP, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_128K_CHAP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_64K, MDM_HDLCPPP_AUTH_CHAP, MDM_HDLCPPP_ML_2))
#define MDM_PROTOCOL_HDLCPPP_128K_MSCHAP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_HDLCPPP, MDM_GEN_HDLCPPP_PROTOCOL_DATA(MDM_HDLCPPP_SPEED_64K, MDM_HDLCPPP_AUTH_MSCHAP, MDM_HDLCPPP_ML_2))
const MDM_SHIFT_V120_SPEED = &h0
const MDM_MASK_V120_SPEED = &h7
const MDM_V120_SPEED_DEFAULT = &h0
const MDM_V120_SPEED_64K = &h1
const MDM_V120_SPEED_56K = &h2
const MDM_SHIFT_V120_ML = &h6
const MDM_MASK_V120_ML = &h3 shl 6
const MDM_V120_ML_DEFAULT = &h0
const MDM_V120_ML_NONE = &h1
const MDM_V120_ML_2 = &h2
#define MDM_GEN_V120_PROTOCOL_DATA(_speed, _ml) ((((_speed) shl MDM_SHIFT_V120_SPEED) and MDM_MASK_V120_SPEED) or (((_ml) shl MDM_SHIFT_V120_ML) and MDM_MASK_V120_ML))
#define MDM_PROTOCOL_V120_64K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V120, MDM_GEN_V120_PROTOCOL_DATA(MDM_V120_SPEED_64K, MDM_V120_ML_NONE))
#define MDM_PROTOCOL_V120_56K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V120, MDM_GEN_V120_PROTOCOL_DATA(MDM_V120_SPEED_56K, MDM_V120_ML_NONE))
#define MDM_PROTOCOL_V120_112K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V120, MDM_GEN_V120_PROTOCOL_DATA(MDM_V120_SPEED_56K, MDM_V120_ML_2))
#define MDM_PROTOCOL_V120_128K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V120, MDM_GEN_V120_PROTOCOL_DATA(MDM_V120_SPEED_64K, MDM_V120_ML_2))
const MDM_SHIFT_X75_DATA = &h0
const MDM_MASK_X75_DATA = &h7
const MDM_X75_DATA_DEFAULT = &h0
const MDM_X75_DATA_64K = &h1
const MDM_X75_DATA_128K = &h2
const MDM_X75_DATA_T_70 = &h3
const MDM_X75_DATA_BTX = &h4
#define MDM_GEN_X75_PROTOCOL_DATA(_data) (((_data) shl MDM_SHIFT_X75_DATA) and MDM_MASK_X75_DATA)
#define MDM_PROTOCOL_X75_64K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_X75, MDM_GEN_X75_PROTOCOL_DATA(MDM_X75_DATA_64K))
#define MDM_PROTOCOL_X75_128K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_X75, MDM_GEN_X75_PROTOCOL_DATA(MDM_X75_DATA_128K))
#define MDM_PROTOCOL_X75_T_70 MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_X75, MDM_GEN_X75_PROTOCOL_DATA(MDM_X75_DATA_T_70))
#define MDM_PROTOCOL_X75_BTX MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_X75, MDM_GEN_X75_PROTOCOL_DATA(MDM_X75_DATA_BTX))
const MDM_SHIFT_V110_SPEED = &h0
const MDM_MASK_V110_SPEED = &hf
const MDM_V110_SPEED_DEFAULT = &h0
const MDM_V110_SPEED_1DOT2K = &h1
const MDM_V110_SPEED_2DOT4K = &h2
const MDM_V110_SPEED_4DOT8K = &h3
const MDM_V110_SPEED_9DOT6K = &h4
const MDM_V110_SPEED_12DOT0K = &h5
const MDM_V110_SPEED_14DOT4K = &h6
const MDM_V110_SPEED_19DOT2K = &h7
const MDM_V110_SPEED_28DOT8K = &h8
const MDM_V110_SPEED_38DOT4K = &h9
const MDM_V110_SPEED_57DOT6K = &hA
#define MDM_GEN_V110_PROTOCOL_DATA(_data) (((_data) shl MDM_SHIFT_V110_SPEED) and MDM_MASK_V110_SPEED)
#define MDM_PROTOCOL_V110_1DOT2K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_1DOT2K))
#define MDM_PROTOCOL_V110_2DOT4K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_2DOT4K))
#define MDM_PROTOCOL_V110_4DOT8K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_4DOT8K))
#define MDM_PROTOCOL_V110_9DOT6K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_9DOT6K))
#define MDM_PROTOCOL_V110_12DOT0K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_12DOT0K))
#define MDM_PROTOCOL_V110_14DOT4K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_14DOT4K))
#define MDM_PROTOCOL_V110_19DOT2K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_19DOT2K))
#define MDM_PROTOCOL_V110_28DOT8K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_28DOT8K))
#define MDM_PROTOCOL_V110_38DOT4K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_38DOT4K))
#define MDM_PROTOCOL_V110_57DOT6K MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_V110, MDM_GEN_V110_PROTOCOL_DATA(MDM_V110_SPEED_57DOT6K))
const MDM_SHIFT_AUTO_SPEED = &h0
const MDM_MASK_AUTO_SPEED = &h7
const MDM_AUTO_SPEED_DEFAULT = &h0
const MDM_SHIFT_AUTO_ML = &h6
const MDM_MASK_AUTO_ML = &h3 shl 6
const MDM_AUTO_ML_DEFAULT = &h0
const MDM_AUTO_ML_NONE = &h1
const MDM_AUTO_ML_2 = &h2
#define MDM_GEN_AUTO_PROTOCOL_DATA(_speed, _ml) ((((_speed) shl MDM_SHIFT_AUTO_SPEED) and MDM_MASK_AUTO_SPEED) or (((_ml) shl MDM_SHIFT_AUTO_ML) and MDM_MASK_AUTO_ML))
#define MDM_PROTOCOL_AUTO_1CH MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_AUTO, MDM_GEN_AUTO_PROTOCOL_DATA(MDM_AUTO_SPEED_DEFAULT, MDM_AUTO_ML_NONE))
#define MDM_PROTOCOL_AUTO_2CH MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_AUTO, MDM_GEN_AUTO_PROTOCOL_DATA(MDM_AUTO_SPEED_DEFAULT, MDM_AUTO_ML_2))
const MDM_ANALOG_RLP_ON = &h0
const MDM_ANALOG_RLP_OFF = &h1
const MDM_ANALOG_V34 = &h2
#define MDM_GEN_ANALOG_PROTOCOL_DATA(_rlp) (_rlp)
#define MDM_PROTOCOL_ANALOG_RLP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_ANALOG, MDM_GEN_ANALOG_PROTOCOL_DATA(MDM_ANALOG_RLP_ON))
#define MDM_PROTOCOL_ANALOG_NRLP MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_ANALOG, MDM_GEN_ANALOG_PROTOCOL_DATA(MDM_ANALOG_RLP_OFF))
#define MDM_PROTOCOL_ANALOG_V34 MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_ANALOG, MDM_GEN_ANALOG_PROTOCOL_DATA(MDM_ANALOG_V34))
#define MDM_PROTOCOL_GPRS MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_GPRS, 0)
const MDM_PIAFS_INCOMING = 0
const MDM_PIAFS_OUTGOING = 1
#define MDM_PROTOCOL_PIAFS_INCOMING MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_PIAFS, MDM_PIAFS_INCOMING)
#define MDM_PROTOCOL_PIAFS_OUTGOING MDM_GEN_PROTOCOLINFO(MDM_PROTOCOLID_PIAFS, MDM_PIAFS_OUTGOING)
