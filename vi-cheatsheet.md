0: move to beginning of the current line

$: move to end of line

H: move to the top of the current window (high)

M: move to the middle of the current window (middle)

L: move to the bottom line of the current window (low)

1G: move to the first line of the file

20G: move to the 20th line of the file

V: Select multiple lines

y: copy

p: paste

/foo: search forward for “foo”

n: repeat last search

d0: delete to beginning of line

d$: delete to end of line

#Tmux 

# New Window
CTRL + b -> c 

# Rename Window
CTRL + b -> , 

#Previous Window
CTRL + b -> p 

#Next Window
CTRL + b -> n 

#List Window
CTRL + w -> w 

#
% Vertically
" Split Horizontally
n
P
: split-window

#Basics
? get help

# Session management
s list sessions
$ rename the current session
d detach from the current session

# Windows
c   create a new window
,   rename the current window
w   list windows
%   split horizontally
"   split vertically
n   change to the next window
p   change to the previous window
0 to 9 select windows 0 through 9


# Panes
% create a horizontal pane
" create a vertical pane
h move to the left pane. *
j move to the pane below *
l move to the right pane *
k move to the pane above *
q show pane numbers
o toggle between panes
} swap with next pane
{ swap with previous pane
! break the pane out of the window
x kill the current pane
