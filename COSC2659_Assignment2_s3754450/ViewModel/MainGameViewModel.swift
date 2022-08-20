//
//  MainGameViewModel.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 20/08/2022.
//

import Foundation

final class MainGameViewModel : ObservableObject{
    @Published var offsetX = 0
    @Published var offsetY = 0
    @Published var  currentPosition = 0
    
    @Published var  diceRolled = 0
    @Published var  diceDisplay = 3
    
    @Published var  currPoint = 0
    
    
    
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
    
    
    func rollDice(){
        var rollCount = 0
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true){ t in
            rollCount += 1
            self.diceDisplay = Int.random(in: 1...6)
            
            if (rollCount == 4){
                self.diceRolled = self.diceDisplay
                t.invalidate()
            }
            
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            var count = 0
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ t in
                if (self.currentPosition < 9){
                    if (self.currentPosition < 3 || self.currentPosition >= 6 ){
                        self.offsetY += 72
                    } else{
                        self.offsetX += 72
                    }
                    count+=1
                    self.currentPosition += 1
                    if (count == self.diceRolled){
                        self.updatePoint()
                        t.invalidate()
                    }
                }
            }
         })
    }
}
