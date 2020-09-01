# Stuck in the Mud
#### A game for five dice
You will be programming the game engine for a new online game. There is a separate team implementing various front ends that will access your game engine

## Instructions
- All players start with a score of zero.
- The first player rolls all five dice.
- Set aside any 2's or 5's that are rolled
- Add up the total of the remaining dice
- Add this roll's total to the player's current score
- Roll any remaining dice.

Continue in this way until all the dice are "Stuck in the Mud" (ie, all dice rolled come up as a 2 or a 5), at which point, play passes to the left and the new player starts with a fresh roll of five dice.

## Technical Requirements
The front end team will pass you a list of player names, and they expect to receive some data structure that will associate each player name with a final score.
