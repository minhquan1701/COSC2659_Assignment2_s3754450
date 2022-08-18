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
    
    var body: some View {
        
        
        VStack {
            ZStack {
                        HStack (spacing: 0){
                            
                            Rectangle().fill(Color.red)
                                                           
                            Rectangle().fill(Color.blue)
                               
                            Rectangle().fill(Color.yellow)
                        }
                        
                       
                    // Peek the location of the next tile to turn.
                    // If X go larger, Y not change: go right
                    // If X go smaller, Y not change: go left
                    // Else: go down
                    GeometryReader{ geo in
                        Image("dinosaur")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .position(x: geo.frame(in: .local).minX + 50 + CGFloat(offsetX), y: geo.frame(in: .local).minY - 50 + CGFloat( offsetY))
                            
                    }
                    
                }
            .frame(width: 300, height: 100)
        
            Button("roll", action: {
                withAnimation(.easeIn){
                  var count = 0
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true){ t in
                        
                        
                        if (count < 1){
                            self.offsetY += 100
                            
                        }
                        else if (count >= 1){
                            self.offsetX += 100
                        }
                        count+=1
                        if (count == 3){
                            t.invalidate()
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
