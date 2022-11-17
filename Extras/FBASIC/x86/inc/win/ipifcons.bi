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

#define __IPIFCONS_H__
type IFTYPE as ULONG
const MIN_IF_TYPE = 1
const IF_TYPE_OTHER = 1
const IF_TYPE_REGULAR_1822 = 2
const IF_TYPE_HDH_1822 = 3
const IF_TYPE_DDN_X25 = 4
const IF_TYPE_RFC877_X25 = 5
const IF_TYPE_ETHERNET_CSMACD = 6
const IF_TYPE_IS088023_CSMACD = 7
const IF_TYPE_ISO88024_TOKENBUS = 8
const IF_TYPE_ISO88025_TOKENRING = 9
const IF_TYPE_ISO88026_MAN = 10
const IF_TYPE_STARLAN = 11
const IF_TYPE_PROTEON_10MBIT = 12
const IF_TYPE_PROTEON_80MBIT = 13
const IF_TYPE_HYPERCHANNEL = 14
const IF_TYPE_FDDI = 15
const IF_TYPE_LAP_B = 16
const IF_TYPE_SDLC = 17
const IF_TYPE_DS1 = 18
const IF_TYPE_E1 = 19
const IF_TYPE_BASIC_ISDN = 20
const IF_TYPE_PRIMARY_ISDN = 21
const IF_TYPE_PROP_POINT2POINT_SERIAL = 22
const IF_TYPE_PPP = 23
const IF_TYPE_SOFTWARE_LOOPBACK = 24
const IF_TYPE_EON = 25
const IF_TYPE_ETHERNET_3MBIT = 26
const IF_TYPE_NSIP = 27
const IF_TYPE_SLIP = 28
const IF_TYPE_ULTRA = 29
const IF_TYPE_DS3 = 30
const IF_TYPE_SIP = 31
const IF_TYPE_FRAMERELAY = 32
const IF_TYPE_RS232 = 33
const IF_TYPE_PARA = 34
const IF_TYPE_ARCNET = 35
const IF_TYPE_ARCNET_PLUS = 36
const IF_TYPE_ATM = 37
const IF_TYPE_MIO_X25 = 38
const IF_TYPE_SONET = 39
const IF_TYPE_X25_PLE = 40
const IF_TYPE_ISO88022_LLC = 41
const IF_TYPE_LOCALTALK = 42
const IF_TYPE_SMDS_DXI = 43
const IF_TYPE_FRAMERELAY_SERVICE = 44
const IF_TYPE_V35 = 45
const IF_TYPE_HSSI = 46
const IF_TYPE_HIPPI = 47
const IF_TYPE_MODEM = 48
const IF_TYPE_AAL5 = 49
const IF_TYPE_SONET_PATH = 50
const IF_TYPE_SONET_VT = 51
const IF_TYPE_SMDS_ICIP = 52
const IF_TYPE_PROP_VIRTUAL = 53
const IF_TYPE_PROP_MULTIPLEXOR = 54
const IF_TYPE_IEEE80212 = 55
const IF_TYPE_FIBRECHANNEL = 56
const IF_TYPE_HIPPIINTERFACE = 57
const IF_TYPE_FRAMERELAY_INTERCONNECT = 58
const IF_TYPE_AFLANE_8023 = 59
const IF_TYPE_AFLANE_8025 = 60
const IF_TYPE_CCTEMUL = 61
const IF_TYPE_FASTETHER = 62
const IF_TYPE_ISDN = 63
const IF_TYPE_V11 = 64
const IF_TYPE_V36 = 65
const IF_TYPE_G703_64K = 66
const IF_TYPE_G703_2MB = 67
const IF_TYPE_QLLC = 68
const IF_TYPE_FASTETHER_FX = 69
const IF_TYPE_CHANNEL = 70
const IF_TYPE_IEEE80211 = 71
const IF_TYPE_IBM370PARCHAN = 72
const IF_TYPE_ESCON = 73
const IF_TYPE_DLSW = 74
const IF_TYPE_ISDN_S = 75
const IF_TYPE_ISDN_U = 76
const IF_TYPE_LAP_D = 77
const IF_TYPE_IPSWITCH = 78
const IF_TYPE_RSRB = 79
const IF_TYPE_ATM_LOGICAL = 80
const IF_TYPE_DS0 = 81
const IF_TYPE_DS0_BUNDLE = 82
const IF_TYPE_BSC = 83
const IF_TYPE_ASYNC = 84
const IF_TYPE_CNR = 85
const IF_TYPE_ISO88025R_DTR = 86
const IF_TYPE_EPLRS = 87
const IF_TYPE_ARAP = 88
const IF_TYPE_PROP_CNLS = 89
const IF_TYPE_HOSTPAD = 90
const IF_TYPE_TERMPAD = 91
const IF_TYPE_FRAMERELAY_MPI = 92
const IF_TYPE_X213 = 93
const IF_TYPE_ADSL = 94
const IF_TYPE_RADSL = 95
const IF_TYPE_SDSL = 96
const IF_TYPE_VDSL = 97
const IF_TYPE_ISO88025_CRFPRINT = 98
const IF_TYPE_MYRINET = 99
const IF_TYPE_VOICE_EM = 100
const IF_TYPE_VOICE_FXO = 101
const IF_TYPE_VOICE_FXS = 102
const IF_TYPE_VOICE_ENCAP = 103
const IF_TYPE_VOICE_OVERIP = 104
const IF_TYPE_ATM_DXI = 105
const IF_TYPE_ATM_FUNI = 106
const IF_TYPE_ATM_IMA = 107
const IF_TYPE_PPPMULTILINKBUNDLE = 108
const IF_TYPE_IPOVER_CDLC = 109
const IF_TYPE_IPOVER_CLAW = 110
const IF_TYPE_STACKTOSTACK = 111
const IF_TYPE_VIRTUALIPADDRESS = 112
const IF_TYPE_MPC = 113
const IF_TYPE_IPOVER_ATM = 114
const IF_TYPE_ISO88025_FIBER = 115
const IF_TYPE_TDLC = 116
const IF_TYPE_GIGABITETHERNET = 117
const IF_TYPE_HDLC = 118
const IF_TYPE_LAP_F = 119
const IF_TYPE_V37 = 120
const IF_TYPE_X25_MLP = 121
const IF_TYPE_X25_HUNTGROUP = 122
const IF_TYPE_TRANSPHDLC = 123
const IF_TYPE_INTERLEAVE = 124
const IF_TYPE_FAST = 125
const IF_TYPE_IP = 126
const IF_TYPE_DOCSCABLE_MACLAYER = 127
const IF_TYPE_DOCSCABLE_DOWNSTREAM = 128
const IF_TYPE_DOCSCABLE_UPSTREAM = 129
const IF_TYPE_A12MPPSWITCH = 130
const IF_TYPE_TUNNEL = 131
const IF_TYPE_COFFEE = 132
const IF_TYPE_CES = 133
const IF_TYPE_ATM_SUBINTERFACE = 134
const IF_TYPE_L2_VLAN = 135
const IF_TYPE_L3_IPVLAN = 136
const IF_TYPE_L3_IPXVLAN = 137
const IF_TYPE_DIGITALPOWERLINE = 138
const IF_TYPE_MEDIAMAILOVERIP = 139
const IF_TYPE_DTM = 140
const IF_TYPE_DCN = 141
const IF_TYPE_IPFORWARD = 142
const IF_TYPE_MSDSL = 143
const IF_TYPE_IEEE1394 = 144
const IF_TYPE_RECEIVE_ONLY = 145
const MAX_IF_TYPE = 145
const IF_ACCESS_LOOPBACK = 1
const IF_ACCESS_BROADCAST = 2
const IF_ACCESS_POINTTOPOINT = 3
const IF_ACCESS_POINTTOMULTIPOINT = 4
const IF_CHECK_NONE = &h00
const IF_CHECK_MCAST = &h01
const IF_CHECK_SEND = &h02
const IF_CONNECTION_DEDICATED = 1
const IF_CONNECTION_PASSIVE = 2
const IF_CONNECTION_DEMAND = 3
const IF_ADMIN_STATUS_UP = 1
const IF_ADMIN_STATUS_DOWN = 2
const IF_ADMIN_STATUS_TESTING = 3
const IF_OPER_STATUS_NON_OPERATIONAL = 0
const IF_OPER_STATUS_UNREACHABLE = 1
const IF_OPER_STATUS_DISCONNECTED = 2
const IF_OPER_STATUS_CONNECTING = 3
const IF_OPER_STATUS_CONNECTED = 4
const IF_OPER_STATUS_OPERATIONAL = 5
const MIB_IF_TYPE_OTHER = 1
const MIB_IF_TYPE_ETHERNET = 6
const MIB_IF_TYPE_TOKENRING = 9
const MIB_IF_TYPE_FDDI = 15
const MIB_IF_TYPE_PPP = 23
const MIB_IF_TYPE_LOOPBACK = 24
const MIB_IF_TYPE_SLIP = 28
const MIB_IF_ADMIN_STATUS_UP = 1
const MIB_IF_ADMIN_STATUS_DOWN = 2
const MIB_IF_ADMIN_STATUS_TESTING = 3
const MIB_IF_OPER_STATUS_NON_OPERATIONAL = 0
const MIB_IF_OPER_STATUS_UNREACHABLE = 1
const MIB_IF_OPER_STATUS_DISCONNECTED = 2
const MIB_IF_OPER_STATUS_CONNECTING = 3
const MIB_IF_OPER_STATUS_CONNECTED = 4
const MIB_IF_OPER_STATUS_OPERATIONAL = 5
