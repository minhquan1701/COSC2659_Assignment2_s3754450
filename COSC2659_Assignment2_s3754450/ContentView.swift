//
//  ContentView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 06/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State var offsetX = 0
    @State var offsetY = 0
    
    @State var  currentPosition = 0
    @State var  diceRolled = 0
    
    var body: some View {
        
        
        VStack {
            Text("\(diceRolled)")
            ZStack {
                VStack (spacing: 0) {
                    HStack (spacing: 0){
                                
                                Rectangle().fill(Color.green)
                                                               
                                Rectangle().fill(Color.black)
                                   
                                Rectangle().fill(Color.orange)
                    }
                    HStack (spacing: 0){
                                
                                Rectangle().fill(Color.red)
                                                               
                                Rectangle().fill(Color.blue)
                                   
                                Rectangle().fill(Color.yellow)
                    }
                    HStack (spacing: 0){
                                
                                Rectangle().fill(Color.green)
                                                               
                                Rectangle().fill(Color.black)
                                   
                                Rectangle().fill(Color.orange)
                    }
                    HStack (spacing: 0){
                                
                                Rectangle().fill(Color.pink)
                                                               
                                Rectangle().fill(Color.purple)
                                   
                                Rectangle().fill(Color.gray)
                    }
                    HStack (spacing: 0){
                                
                                Rectangle().fill(Color.red)
                                                               
                                Rectangle().fill(Color.blue)
                                   
                                Rectangle().fill(Color.yellow)
                    }


                }
                        
                       
                    // Peek the location of the next tile to turn.
                    // If X go larger, Y not change: go right
                    // If X go smaller, Y not change: go left
                    // Else: go down
                    GeometryReader{ geo in
                        Image("dinosaur")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .position(x: geo.frame(in: .local).minX + 50 + CGFloat(offsetX), y: geo.frame(in: .local).minY + 50 + CGFloat( offsetY))
                            
                    }
                    
                }
            .frame(width: 300, height: 500)
        
            Button("roll", action: {
                withAnimation(.easeIn){
                  diceRolled = Int.random(in: 1...6)
                    let _ = print("hi!")

                  var count = 0
                  Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ t in
                         if (currentPosition == 6){
                           self.offsetY = 0
                           self.offsetX = 0
                           self.currentPosition = 0
                           t.invalidate()
                         }else{
                             
                             if (currentPosition < 2 || currentPosition >= 4 ){
                                 self.offsetY += 100
                                 
                             }
                             else{
                                 self.offsetX += 100
                             }
                             count+=1
                             currentPosition += 1
                             if (count == diceRolled){
                                 t.invalidate()
                             }
                         }
                        
                      
                        
                    }
                    
                }

//                withAnimation(Animation.linear.delay(0.5)){
//                    self.offsetX = 1
//                }
            })
        
        }
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
