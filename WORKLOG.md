# Work Log

## Sajid Patwary

### 5/22/23

Started working on the Game class

Added setup, draw, makeBoard, and instance variables

### 5/23/23

Continued working on the Game Class

Worked on displaying the board

Started on working on basics of how clicking affects the board

### 5/24/23

Continued working on mouseClicked -- firstClick, which reveals a random number of squares on the board

Fixed grid to make it work with display and fixed mouseClicked

Made additional changes to firstClick

### 5/25/23

Updated mouseClicked so that it doesn't do anything to the board after a bomb is discovered and game ends

Updated display to show a red screen with "Game Over" when a player clicks on a bomb

Removed unecessary and excess code from Game and Tile class

Added a header with game info such as the current mode, score, and the number of flags

### 5/26/23

Absent on Friday and couldn't work on the project due to fever

### 5/29/23

Added a "Try Again" feature which allows the player to retry when they click on a bomb

Added the flagging feature, which adds a flag on the board when the player LEFT clicks their mouse

### 5/30/23

Updated the flagging feature and fixed some of the issues it had

Updated firstClick method

Updated the displaying of squares which have no bombs around them


### 5/31/23

Fixed all the issues with flagging

Merged Retry into the main branch

Fixed errors within main

Updated the visuals of the game

### 6/1/23

Fixed issues with display and firstClick

Added a display for the timer

Started working on making different levels

Merged the changes from Modes branch into the main branch

Cleared up unnecessary code from main branch

### 6/2/23

I got food poisoning and was unable to work on the project

### 6/5/23

Finished setup for Level 1

Implemented try again feature in level 1

Fixed flagging display for Level 1

Finished setup for Level 3

Updated mouseClicked for Level 3

Updated display of flag and other features for level 3

Started working on fixing a display bug for Level 3

### 6/6/23

Changed the setup for Level 3

Updated mouseclicked and flagging for Level 3

Fixed flag count if firstClick is a bomb for Level 2

Cleared up excess code from Modes branch

Updated display for "try again" and "play again"

Created a dropdown menu bar for choosing a mode

Updated display for dropdown menu bar when a mode is chosen by the player

### 6/7/23

Fixed display for Modes so that the board and other features change right when a player selects a mode

Updated Modes so that timer and score resets when a mode is changed/chosen in the middle of a game

Updated when a mode can be chosen

Implemented firstClick in Level 1 and Level 3

## Junling Zhang

### 5/22/23
Created the TILE class

### 5/23/23
Revised the TILE class

Added display for the TILE class

display() for Game.pde

board in Game.pde changed to TILE[][]

### 5/24/23
Redid display for TILE

Made sure that all mines are placed

started adding flagging features

merged Flags_and_newRandomize with main

### 5/25/23
added calculateAdjacentMines()

Edited Prototype

### 5/26/23
Fully incorporated score system(working)

Made reveal() - all adjacent TILEs with zero NumBomb values will auto reveal

fixed mouse position indexing error

fixed impossible NumBomb value bug/error

### 5/30/23
created timer branch

Added timer

merged timer branch into the main branch

added and implemented checkFinished()

edited Prototype

### 5/31/23
added keyPressed()

added three cheat keys to show mines and tile that the program thinks are revealed and a two mine board

### 6/2/23
edited ReadMe

### 6/5/23
Worked on Modes branch

fixed non-stop timer clock mini-bug

### 6/6/23
Worked on Modes branch

Added a way to play another board after winning

### 6/7/23
created Optimizing branch

worked on Optimizing branch

worked on the prototype
