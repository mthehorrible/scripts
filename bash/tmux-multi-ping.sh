#!/bin/bash

dest1="google.com"
dest2="yahoo.com"
dest3="bing.com"

tmux new-session -d -s mySession "ping -O $dest1";    # start new detached tmux session
tmux split-window;                                    # split the detached tmux session
tmux send "ping -O $dest2" ENTER;                     # send command to second pane
tmux split-window;                                    # create another split
tmux send "ping -O $dest3" ENTER;                     # send command to thrid pane
tmux select-layout even-vertical                      # set panes to be evenly sized
tmux a;                                               # attach session

#tmux kill-session -t mySession