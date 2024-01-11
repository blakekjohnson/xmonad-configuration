import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig

import XMonad.Layout.ThreeColumns

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar" (pure blakeXmobarPP)) defToggleStrutsKey
     $ blakeConfig

blakeLayout = tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

blakeConfig = def
    { borderWidth = 5
    , layoutHook = blakeLayout
    }
  `additionalKeysP`
    [("M4-<Space>", spawn "dmenu_run")
    , ("M-q", spawn "xmonad --recompile; killall xmobar; xmonad --restart")
    , ("M-S-<Return>", spawn "alacritty")
    ]

blakeXmobarPP :: PP
blakeXmobarPP = def

