-- Imports.
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig  
import Graphics.X11.ExtraTypes.XF86  

-- The main function.
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- Command to launch the bar.
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Main configuration, override the defaults to your liking.
myConfig = defaultConfig 
    { modMask = mod4Mask 
    }
    `additionalKeys` [
        ((mod4Mask, xF86XK_MonBrightnessUp), spawn "xbacklight +20") 
    ,   ((mod4Mask, xF86XK_MonBrightnessDown), spawn "xbacklight -20")
    ,   ((mod4Mask, 0x1008FF11), spawn "amixer -q -D pulse sset Master 2000- unmute")
    ,   ((mod4Mask, 0x1008FF13), spawn "amixer -q -D pulse sset Master 2000+ unmute")
    ,   ((mod4Mask, 0x1008FF12), spawn "amixer -q -D pulse sset Master toggle")
    ,   ((mod4Mask, xK_c), spawn "google-chrome") -- to open chrome
    ,   ((mod4Mask, xK_f), spawn "firefox") -- to open firefox  
    ,   ((mod4Mask .|. shiftMask, xK_F4), spawn "sudo shutdown -h now") -- window key + Shift + F4 to shutdown system  
    ,   ((mod4Mask, xK_F4), kill) -- to kill applications  
    ,   ((controlMask, xK_KP_Add), sendMessage Expand) -- Ctrl + the plus (+) button to expand the master pane  
    ,   ((0, xK_Print), spawn "scrot") -- use the print key to capture screenshot with scrot  
    ,   ((mod4Mask, xK_y), spawn "home/dewei/bin/" ) -- use mod4Mask + y to run a script  
    ]  
