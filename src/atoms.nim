import x11/[xlib, x]
converter toXBool(x: bool): XBool = x.XBool
converter toBool(x: XBool): bool = x.bool
type
  NetAtom* = enum
    NetActiveWindow, NetSupported,
    NetSystemTray, NetSystemTrayOP, NetSystemTrayOrientation,
        NetSystemTrayOrientationHorz,
    NetWMName, NetWMState, NetWMStateAbove, NetWMStateSticky, NetWMStateModal,
    NetSupportingWMCheck, NetWMStateFullScreen, NetClientList,
        NetWMStrutPartial,
    NetWMWindowType, NetWMWindowTypeNormal, NetWMWindowTypeDialog,
        NetWMWindowTypeUtility,
    NetWMWindowTypeToolbar, NetWMWindowTypeSplash, NetWMWindowTypeMenu,
    NetWMWindowTypeDropdownMenu, NetWMWindowTypePopupMenu,
        NetWMWindowTypeTooltip,
    NetWMWindowTypeNotification, NetWMWindowTypeDock,
    NetWMDesktop, NetDesktopViewport, NetNumberOfDesktops, NetCurrentDesktop,
        NetDesktopNames, NetFrameExtents
  IpcAtom* = enum
    IpcClientMessage, IpcBorderActivePixel, IpcBorderInactivePixel,
        IpcBorderWidth, IpcFrameActivePixel, IpcFrameInactivePixel, IpcFrameHeight, IpcTextPixel,
            IpcTextFont, IpcTextOffset, IpcKillClient, IpcCloseClient, IpcSwitchTag, IpcLayout, IpcGaps, IpcMaster, IpcStruts,
                IpcMoveTag, IpcFrameLeft, IpcFrameCenter, IpcFrameRight,
                IpcFloat, IpcButtonOffset, IpcButtonSize, IpcRootMenu, IpcClosePath, IpcMaximizePath, IpcMaximizeClient

func getNetAtoms*(dpy: ptr Display): array[NetAtom, Atom] =
  [
    dpy.XInternAtom("_NET_ACTIVE_WINDOW", false),
    dpy.XInternAtom("_NET_SUPPORTED", false),
    dpy.XInternAtom("_NET_SYSTEM_TRAY_S0", false),
    dpy.XInternAtom("_NET_SYSTEM_TRAY_OPCODE", false),
    dpy.XInternAtom("_NET_SYSTEM_TRAY_ORIENTATION", false),
    dpy.XInternAtom("_NET_SYSTEM_TRAY_ORIENTATION_HORZ", false),
    dpy.XInternAtom("_NET_WM_NAME", false),
    dpy.XInternAtom("_NET_WM_STATE", false),
    dpy.XInternAtom("_NET_WM_STATE_ABOVE", false),
    dpy.XInternAtom("_NET_WM_STATE_STICKY", false),
    dpy.XInternAtom("_NET_WM_STATE_MODAL", false),
    dpy.XInternAtom("_NET_SUPPORTING_WM_CHECK", false),
    dpy.XInternAtom("_NET_WM_STATE_FULLSCREEN", false),
    dpy.XInternAtom("_NET_CLIENT_LIST", false),
    dpy.XInternAtom("_NET_WM_STRUT_PARTIAL", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_NORMAL", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_DIALOG", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_UTILITY", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_TOOLBAR", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_SPLASH", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_MENU", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_DROPDOWN_MENU", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_POPUP_MENU", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_TOOLTIP", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_NOTIFICATION", false),
    dpy.XInternAtom("_NET_WM_WINDOW_TYPE_DOCK", false),
    dpy.XInternAtom("_NET_WM_DESKTOP", false),
    dpy.XInternAtom("_NET_DESKTOP_VIEWPORT", false),
    dpy.XInternAtom("_NET_NUMBER_OF_DESKTOPS", false),
    dpy.XInternAtom("_NET_CURRENT_DESKTOP", false),
    dpy.XInternAtom("_NET_DESKTOP_NAMES", false),
    dpy.XInternAtom("_NET_FRAME_EXTENTS", false)
  ]

func getIpcAtoms*(dpy: ptr Display): array[IpcAtom, Atom] =
  [
    dpy.XInternAtom("WORM_IPC_CLIENT_MESSAGE", false),
    dpy.XInternAtom("WORM_IPC_BORDER_ACTIVE_PIXEL", false),
    dpy.XInternAtom("WORM_IPC_BORDER_INACTIVE_PIXEL", false),
    dpy.XInternAtom("WORM_IPC_BORDER_WIDTH", false),
    dpy.XInternAtom("WORM_IPC_FRAME_ACTIVE_PIXEL", false),
    dpy.XInternAtom("WORM_IPC_FRAME_INACTIVE_PIXEL", false),
    dpy.XInternAtom("WORM_IPC_FRAME_HEIGHT", false),
    dpy.XInternAtom("WORM_IPC_TEXT_PIXEL", false),
    dpy.XInternAtom("WORM_IPC_TEXT_FONT", false),
    dpy.XInternAtom("WORM_IPC_TEXT_OFFSET", false),
    dpy.XInternAtom("WORM_IPC_KILL_CLIENT", false),
    dpy.XInternAtom("WORM_IPC_CLOSE_CLIENT", false),
    dpy.XInternAtom("WORM_IPC_SWITCH_TAG", false),
    dpy.XInternAtom("WORM_IPC_LAYOUT", false),
    dpy.XInternAtom("WORM_IPC_MASTER", false),
    dpy.XInternAtom("WORM_IPC_GAPS", false),
    dpy.XInternAtom("WORM_IPC_STRUTS", false),
    dpy.XInternAtom("WORM_IPC_MOVE_TAG", false),
    dpy.XInternAtom("WORM_IPC_FRAME_LEFT", false),
    dpy.XInternAtom("WORM_IPC_FRAME_CENTER", false),
    dpy.XInternAtom("WORM_IPC_FRAME_RIGHT", false),
    dpy.XInternAtom("WORM_IPC_FLOAT", false),
    dpy.XInternAtom("WORM_IPC_BUTTON_OFFSET", false),
    dpy.XInternAtom("WORM_IPC_BUTTON_SIZE", false),
    dpy.XInternAtom("WORM_IPC_ROOT_MENU", false),
    dpy.XInternAtom("WORM_IPC_CLOSE_PATH", false),
    dpy.XInternAtom("WORM_IPC_MAXIMIZE_PATH", false),
    dpy.XInternAtom("WORM_IPC_MAXIMIZE_CLIENT", false)
  ]
