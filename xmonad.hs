import XMonad

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Util.EZConfig

import XMonad.Layout.ThreeColumns

import Graphics.X11.ExtraTypes.XF86

main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (
        statusBarProp "xmobar" (pure blakeXmobarPP)) defToggleStrutsKey
     $ blakeConfig

blakeLayout = tiled ||| Full ||| threeCol
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1
    ratio = 1/2
    delta = 3/100

xmonadCommand = "xmonad --recompile; killall xmobar; xmonad --restart; xmobar &"

blakeConfig = def
    { borderWidth = 5
    , layoutHook = blakeLayout
    }
  `additionalKeysP`
    [("M4-<Space>", spawn "dmenu_run")
    , ("M-q", spawn xmonadCommand)
    , ("M-S-<Return>", spawn "alacritty")
    ]
  `additionalKeys`
    [((0, xF86XK_AudioPlay), spawn "playerctl --player=spotify play-pause")
    , ((0, xF86XK_AudioLowerVolume), spawn "playerctl --player=spotify volume 0.10-")
    , ((0, xF86XK_AudioRaiseVolume), spawn "playerctl --player=spotify volume 0.10+")
    , ((0, xF86XK_AudioPrev), spawn "playerctl --player=spotify previous")
    , ((0, xF86XK_AudioNext), spawn "playerctl --player=spotify next")
    ]

blakeXmobarPP :: PP
blakeXmobarPP = def

