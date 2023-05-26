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

### 5/24/23

Updated mouseClicked so that it doesn't do anything to the board after a bomb is discovered and game ends

Updated display to show a red screen with "Game Over" when a player clicks on a bomb

Removed unecessary and excess code from Game and Tile class

Added a header with game info such as the current mode, score, and the number of flags

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
