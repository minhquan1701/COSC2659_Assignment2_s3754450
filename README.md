# COSC2659_Assignment2: Indie Board Game

Game name: Jurassic Escape\
Category: Indie board game\
Author: Hoang Minh Quan



## Introduction
This is a three-week asignment project for the course IOS Application Development of RMIT's Software Enginneering program. The requirement was to build a board/casio/card game using the SwiftUI framework and XCode. Personally, indie games have always been something that I would love to try while learning software development, since the idea of building my own game from scratch is very fascinating to me. Therefore, I had decided to design and develope an RPG indie board game whose mechanism is inspired from the well-known board game, Ludo. 

I sincerely thank Mr. Tom Huynh, Lecturer of the course for giving me such amazing opportunity to freely bring my creative idea into life ❤.

## Game Description
The game is called Jurassic Escape. Basically, it is a single player game that has a fun story built around a fictitious character named Dil who is a last
standing dinosaur on his way to escape the Jurassic Period. As a player, your mission is to roll a dice to move Dil around the board to get to the designated place. On Dil’s way to salvation, there will be some setbacks that you might come across, which makes the game more challenging and exciting overall.

## Game Demo
![gifdemo1](https://user-images.githubusercontent.com/64230078/222061517-71e0d9fc-0969-4ed6-9116-0ce1e7121060.gif)
![gif demo2](https://user-images.githubusercontent.com/64230078/222061799-fbd02a8b-4a40-4e61-bc77-f499de67196a.gif)
![gif demo3](https://user-images.githubusercontent.com/64230078/222062266-eb013323-cb42-4722-ba91-e0e9ef0abd56.gif)
![gif demo4](https://user-images.githubusercontent.com/64230078/222062280-14f55d59-4968-4c71-856f-462fcd385409.gif)

## Main Features & Implementation Breakdown
Main features of the game include:\
&emsp;● Menu View: The entry view when users first open the app. From this, users can go to Main Game View, Instruction View, and Leaderboard View.\
&emsp;&emsp;○ View navigation: A shared state variable to control which view should be rendered.\
&emsp;&emsp;○ Background music toggle: A global state variable to control whether the background music should be on or off.\
&emsp;&emsp;○ "About Author" view: .sheet modifier in SwiftUI.
   
&emsp;● Main Game View: main view to play the game\
&emsp;&emsp;○ Dice rolling and animation: Built-in random number generator of SwiftUI combined with the Timer interval schedule method to emulate the rolling animation.\
&emsp;&emsp;○ Character moving across the shape of the map according to the number rolled: Update the x and y coordinates of the character based on the current block it is in to make it move in the proper direction. The Timer interval schedule method is also used to emulate the moving animation.\
&emsp;&emsp;○ Receive/minus/reset points based on certain rules when entering any blocks.\
&emsp;&emsp;○ Display and update current points and highest score: A Published state to hold and display the current points, while the value retrieved from the AppStorage is used for displaying the highest score.\
&emsp;&emsp;○ Display winning message modal when users won the game and prompt to take the next action, whether to replay or go back to the Menu View. If the current position is the Finish block, toggle a state variable to show the winning message modal.\
&emsp;&emsp;○ Sound effect when the dice is rolling and when the character takes a step: Call a method to play sound for each rolling and moving interval.\
&emsp;&emsp;○ Tap animation to indicate where to interact with the game

&emsp;● Instruction View: consists of the game storyline and brief information on how to play the game. Accessed from the Menu View

&emsp;● Leaderboard View: list down five recent highest scores. Accessed from the Menu View

&emsp;● Background music: different background music for Menu View, Instruction View, and Leaderboard View.

&emsp;● An app icon that is suitable for the overall theme of the game.

&emsp;● Custom font: Teko


