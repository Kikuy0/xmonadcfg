import XMonad
import XMonad.Util.SpawnOnce
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers


import XMonad.Layout.Fullscreen
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

import Graphics.X11.ExtraTypes.XF86
import System.Exit
import Control.Monad
import Data.Monoid
import Data.Maybe

import qualified XMonad.StackSet as W
import qualified Data.Map        as M


-- Workspaces (ewmh)
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]



-- ## Applications ## ---------------------------------------------------------------
-- Terminal
myTerminal = "alacritty"

-- ## Settings ## -------------------------------------------------------------------

-- focus follows the mouse pointer
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- clicking on a window to focus
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels
myBorderWidth = 0

-- Border colors for focused & unfocused windows
myFocusedBorderColor = "#61AEFE"
myNormalBorderColor = "#2D333F"

-- modMask : modkey you want to use
-- mod1Mask : left alt Key
-- mod4Mask : Windows or Super Key
myModMask = mod1Mask

-- ## Layouts ## -------------------------------------------------------------------------
myLayout = avoidStruts(tiled ||| Mirror tiled ||| Full)
where		-- default tiling algorithm partitions the screen into two panes
 tiled = Tall nmaster delta ratio

		-- The default number of windows in the master pane
		nmaster = 1

		-- Default proportion of screen occupied by master pane
 ratio = 1/2

		-- Percent of screen to increment by when resizing panes
 delta = 3/100

-- ## Logging ## --------------------------------------------------------------------------
myLogHook = return ()


main = xmonad $ fullscreenSupport $ docks $ ewmh defaults

defaults = def 
 {terminal = myTerminal
  ,focusFollowsMouse = myFocusFollowsMouse
  ,clickJustFocuses = myClickJustFocuses
  ,borderWidth = myBorderWidth
  ,modMask = myModMask
  ,normalBorderColor = myNormalBorderColor
  ,focusedBorderColor = myFocusedBorderColor
  ,layoutHook = gaps [(L,0), (R,0), (U,0), (D,0)] $ spacingRaw False (Border 20 0 20 0) True (Border 0 20 0 20) True $ myLayout
  ,logHook            = myLogHook
 }
