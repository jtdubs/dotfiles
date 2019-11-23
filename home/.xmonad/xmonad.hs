{-# LANGUAGE FlexibleInstances, MultiParamTypeClasses #-}

import XMonad hiding (focus, up, down)
import XMonad.StackSet hiding (workspaces)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Place
import XMonad.Hooks.SetWMName (setWMName)
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.LayoutBuilder
import XMonad.Util.Run (spawnPipe, safeSpawn)
import XMonad.Util.EZConfig (additionalKeys)
import XMonad.Config.Desktop
import Graphics.X11.ExtraTypes.XF86
import System.IO
import System.Directory
import Control.Monad

import qualified Data.Map as M

myTerminal           = "alacritty"
myBorderWidth        = 2
myNormalBorderColor  = "#41535b"
myFocusedBorderColor = "#55b5db"
myModMask            = mod4Mask
myFocusFollowsMouse  = False

myWorkspaces = map show [1..9]

myStatupHook = setWMName "LG3D"

myKeys = 
  [ ((myModMask,               xK_b),                     sendMessage ToggleStruts)
  , ((myModMask,               xK_r),                     spawn "dmenu_run -l 4 -fn 'xft:Noto Sans Mono:size=10:antialias=true'")
  , ((myModMask,               xK_q),                     spawn "wm xmonad --recompile && ~/.xmonad/xmonad-x86_64-linux --restart")
  -- Launch specific programs
  , ((myModMask,               xK_o),                     spawn "thunar")
  , ((myModMask,               xK_g),                     spawn "qutebrowser")
  , ((myModMask,               xK_s),                     spawn "xscreensaver-command -lock")
  , ((myModMask,               xK_c),                     spawn "galculator")
  -- For Fn Keys
  , ((0,                       xF86XK_MonBrightnessUp),   spawn "xbacklight -inc 10%")
  , ((0,                       xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10%")
  , ((0,                       xF86XK_AudioRaiseVolume),  spawn "pactl -- set-sink-volume `pactl list sinks short | head -1 | cut -f1` +10%")
  , ((0,                       xF86XK_AudioLowerVolume),  spawn "pactl -- set-sink-volume `pactl list sinks short | head -1 | cut -f1` -10%")
  , ((0,                       xF86XK_AudioMute),         spawn "pactl set-sink-mute 0 toggle")
  , ((0,                       xF86XK_Display),           spawn "arandr")
  -- For BSP Layout
  , ((myModMask .|. mod1Mask,  xK_l),                     sendMessage $ ExpandTowards R)
  , ((myModMask .|. mod1Mask,  xK_h),                     sendMessage $ ExpandTowards L)
  , ((myModMask .|. mod1Mask,  xK_j),                     sendMessage $ ExpandTowards D)
  , ((myModMask .|. mod1Mask,  xK_k),                     sendMessage $ ExpandTowards U)
  , ((myModMask,               xK_f),                     sendMessage Rotate)
  , ((myModMask,               xK_s),                     sendMessage Swap)
  , ((myModMask .|. shiftMask, xK_f),                     sendMessage FocusParent >> sendMessage Rotate)
  , ((myModMask .|. shiftMask, xK_s),                     sendMessage FocusParent >> sendMessage Swap)
  , ((myModMask,               xK_a),                     sendMessage Balance)
  ]

myLayoutHook = spacingRaw True (Border 0 0 0 0) True (Border 4 4 4 4) True
             $ smartBorders $ avoidStruts $ emptyBSP ||| Full
  where tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 2/3
        delta = 2/100

myManageHook = composeAll
  [ title =? "galculator" --> (placeHook (fixed (0.5, 0.5)) <+> doFloat)
  , manageDocks
  , manageHook defaultConfig
  ]

myLogHook = do
  logHook desktopConfig
  dynamicLogWithPP $ def { ppLayout = unwords . tail . words,
                           ppOrder = \(_:l:_) -> [l],
                           ppOutput = appendFile "/tmp/.xmonad-layout-log" . (++ "\n") }

main = do
    rc <- doesFileExist "/tmp/.xmonad-layout-log"
    if not rc
      then safeSpawn "mkfifo" ["/tmp/.xmonad-layout-log"]
      else return ()
    xmonad $ docks desktopConfig
      { terminal = myTerminal
      , focusFollowsMouse = myFocusFollowsMouse
      , borderWidth = myBorderWidth
      , modMask = myModMask
      , workspaces = myWorkspaces
      , focusedBorderColor = myFocusedBorderColor
      , normalBorderColor = myNormalBorderColor
      , manageHook = myManageHook
      , layoutHook = myLayoutHook
      , logHook = myLogHook
      } `additionalKeys` myKeys
