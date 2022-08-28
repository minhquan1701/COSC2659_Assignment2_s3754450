//
//  MainGameViewModel.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 20/08/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Hoang Minh Quan
  ID: s3754450
  Created  date: 20/8/2022
  Last modified: 27/8/2022
  Acknowledgement:
    ObservableObject, Pulished state: https://www.hackingwithswift.com/quick-start/swiftui/observable-objects-environment-objects-and-published
    
*/

import Foundation
import SwiftUI



class MainGameViewModel : ObservableObject{
    
    // Control which view to render
    @Published var pageView = "start"
    
    // Sound on/off state
    @Published var isMuted = false

    // Position state of the character
    @Published var offsetX = 0
    @Published var offsetY = 0
    @Published var currentPosition = 0 // the current block the character is in
    
    // Dice state
    @Published var diceRolled = 0
    @Published var diceDisplay = 1
    
    // Current point state
    @Published var currPoint = 0
    
    // Game finished state
    @Published var isWon = false

    
    // Calculate point based on the current block
    func updatePoint(){
        if (self.currentPosition == 1){
            self.currPoint += 50
            
        }else if (self.currentPosition == 2){
            self.currPoint += 120
            
        }else if (self.currentPosition == 3 || self.currentPosition == 8){
            self.currPoint = 0
            self.offsetY = 0
            self.offsetX = 0
            self.currentPosition = 0
            
        }else if (self.currentPosition == 4 || self.currentPosition == 6){
            self.currPoint += 20
            
        }else if (self.currentPosition == 7){
            self.currPoint += 200
            
        }else if (self.currentPosition == 5){
            self.currPoint -= 100
            
        }else if (self.currentPosition == 9){
            self.currPoint += 500
            
        }
    }
    
    // Reset states
    func initGame(){
        self.offsetX = 0
        self.offsetY = 0
        self.currentPosition = 0
        self.diceRolled = 0
        self.currPoint = 0
        self.isWon = false
        
    }
    
    // Roll the dice
    func rollDice(){
        var rollCount = 0
        
        // Rolling animation
        Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true){ t in
            
            playSound(sound: "roll", type: "mp3")
            rollCount += 1
            self.diceDisplay = Int.random(in: 1...6)
            
            if (rollCount == 4){
                self.diceRolled = self.diceDisplay
                t.invalidate()
                
            }
            
        }
        
        // Move character according to the number rolled
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9, execute: {
            
            var count = 0
            
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ t in
                if (self.currentPosition == 9){
                    playSound(sound: "win", type: "wav")
                    self.updatePoint()
                    self.isWon = true
                    t.invalidate()
                    
                } else {
                    if (self.currentPosition < 3 || self.currentPosition >= 6 ){
                        self.offsetY += 72
                        
                    } else{
                        self.offsetX += 72
                        
                    }
                    
                    count+=1
                    self.currentPosition += 1
                    playSound(sound: "move", type: "wav")
                    
                    if (count == self.diceRolled && self.currentPosition < 9){
                        self.updatePoint()
                        t.invalidate()
                        
                    }
                }
                
            }
         })
    }
}
