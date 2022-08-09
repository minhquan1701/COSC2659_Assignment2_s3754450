//
//  ContentView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 06/08/2022.
//

import SwiftUI

struct ContentView: View {
   
    var body: some View {
        
        
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
                        .position(x: geo.frame(in: .local).minX + 50 * 5, y: geo.frame(in: .local).minY + 40)
                        
                }
                
            }
            .frame(width: 300, height: 80)
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
