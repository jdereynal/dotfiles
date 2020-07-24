# Set modifier key to alt
set $mod Mod4

# Set display resolution
#exec_always --no-startup-id xrandr --output DP1-8 --mode 2560x1440 --rate 59.95

font pango:Overpass Regular 8

# Press mod key to be able to resize floating windows
floating_modifier $mod

# Open new terminal
bindsym $mod+Return exec st

#Close window
bindsym $mod+Shift+q kill

# Change focus
bindsym $mod+j focus left
bindsym $mod+k focus down
bindsym $mod+l focus up
bindsym $mod+semicolon focus right

# Alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# Move focused window
bindsym $mod+Shift+j move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+l move up
bindsym $mod+Shift+semicolon move right

# Alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# Split in horizontal orientation
bindsym $mod+h split h

# Split in vertical orientation
bindsym $mod+v split v

# Enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# Change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# Toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# Change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# Focus the parent container
bindsym $mod+a focus parent

# Focus the child container
bindsym $mod+d focus child

# Switch to workspace
bindsym $mod+1 workspace 1
bindsym $mod+2 workspace 2
bindsym $mod+3 workspace 3
bindsym $mod+4 workspace 4
bindsym $mod+5 workspace 5
bindsym $mod+6 workspace 6
bindsym $mod+7 workspace 7
bindsym $mod+8 workspace 8
bindsym $mod+9 workspace 9
bindsym $mod+0 workspace 10

# Move focused container to workspace
bindsym $mod+Shift+1 move container to workspace 1
bindsym $mod+Shift+2 move container to workspace 2
bindsym $mod+Shift+3 move container to workspace 3
bindsym $mod+Shift+4 move container to workspace 4
bindsym $mod+Shift+5 move container to workspace 5
bindsym $mod+Shift+6 move container to workspace 6
bindsym $mod+Shift+7 move container to workspace 7
bindsym $mod+Shift+8 move container to workspace 8
bindsym $mod+Shift+9 move container to workspace 9
bindsym $mod+Shift+0 move container to workspace 10

# Reload the configuration file
bindsym $mod+Shift+c reload
# Restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# Exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"
# Suspend
bindsym $mod+Shift+s exec systemctl suspend
bindsym $mod+Shift+u exec setxkbmap us
bindsym $mod+Shift+f exec setxkbmap fr


# Resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 5 px or 5 ppt
        bindsym k resize grow height 5 px or 5 ppt
        bindsym l resize shrink height 5 px or 5 ppt
        bindsym semicolon resize grow width 5 px or 5 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 5 px or 5 ppt
        bindsym Down resize grow height 5 px or 5 ppt
        bindsym Up resize shrink height 5 px or 5 ppt
        bindsym Right resize grow width 5 px or 5 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

bindsym $mod+i mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# Finds out, if available)
#bar {
#        status_command i3status
#        mode invisible
#}

hide_edge_borders vertical

# Color variables
#set $unfocused_border #1D1F21
set_from_resource $focused_border i3wm.color7 
set_from_resource $unfocused_border i3wm.color1 

# class                 border  backgr. text    indicator child_border
client.focused          #ffffff #ffffff #ffffff #ffffff   $focused_border
client.focused_inactive #ffffff #ffffff #ffffff #ffffff   $focused_border
client.unfocused        #ffffff #ffffff #ffffff #ffffff   $unfocused_border
client.urgent           #ffffff #ffffff #ffffff #ffffff   $focused_border
client.placeholder      #ffffff #ffffff #ffffff #ffffff   #ffffff

client.background       #ffffff

# Apply .Xresource. As far as I know, only needed here if using starx (dont have a login manager)
exec_always --no-startup-id xrdb ~/.Xresources
# Apply the last colorscheme generated without changing the background by using -n 
exec_always --no-startup-id wal -R -n
# Apply a background different than the one used by wal
# If this isn't needed, remove it and remove -n flag from the above command

# Execute polybar on launch. Script kills current ones on i3 refresh, otherwise they duplicate

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume 0 +5% #increase sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume 0 -5% #decrease sound volume
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute 0 toggle # mute sound

# Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# Remove window borders.
for_window [class="^.*"] border pixel 2

# Gaps
gaps inner 10
gaps outer 10
smart_gaps on
smart_borders no_gaps

# Rofi tab
bindsym $mod+Tab exec rofi -show window -hide-scrollbar -lines 5 -eh 2 -width 40 -location 8 -xoffset 150 -yoffset 7 0-font "RobotoMono Nerd Font 14"

# Rofi run
#bindsym $mod+r exec rofi -show drun -show-icons -location 0 -lines 10 -bw 0 -font "MonacoB 16" -separator-style none -opacity 80 
bindsym $mod+r exec ddmenu

# Always bind browser to workspace 2
assign [class="chromium"] $workspace2

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 5 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 5 # decrease screen brightness

#opens terminals and browser at login
#exec --no-startup-id i3-msg "workspace $workspace1; exec terminator"
#exec --no-startup-id i3-msg "workspace $workspace3; exec terminator"
#exec --no-startup-id i3-msg "workspace $workspace3; exec terminator"
exec --no-startup-id chromium
exec --no-startup-id nm-applet
exec_always --no-startup-id xcompmgr -c

# Lock screen
bindsym $mod+shift+x exec "/usr/bin/lock"

focus_follows_mouse no

exec_always --no-startup-id "sh -c 'sleep 1; /home/jacques/.config/polybar/launch.sh'"

bindsym $mod+p exec "scrot /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'"
bindsym $mod+shift+p --release exec "scrot -s /tmp/screenshot-$(date +%F_%T).png -e 'xclip -selection c -t image/png < $f'"
