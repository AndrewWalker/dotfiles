Overview of tmux concepts
=========================

* A session has windows
* A windows has panes
* One window shown at a time
* All panes in a window shown

Basic Commands
==============

=================  ===========
Command            Description
=================  ===========
C-a c              new window
C-a !              new window from pane
C-a %              new split (vertical)
C-a "              new split (horizontal) 
C-a z              zoom current window to max (temporarily)
C-a d              detach from the current session
C-a 0..9           select window
C-a &              close current window (with prompt)
C-a x              close current pane
C-a q              display pane numbers (temporarily)
new-window <name>  create a new window
=================  ===========

Commands defined here
=====================

==========  ===================================
Command     Description
==========  ===================================
C-a r       reload tmux config
C-a X       kill session
C-a [jkhl]  vim style navigtation between panes
C-a [JKHL]  pane resizing
==========  ===================================

