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
                           
                            .frame(width: 100, height: 80)
                            
                        Rectangle().fill(Color.blue)
                            .frame(width: 100, height: 80)
                        
                        Rectangle().fill(Color.yellow)
                            .frame(width: 100, height: 80)
                        
                        
                    }
                    
                   
                    
                GeometryReader{ geo in
                    Image("dinosaur")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .position(x: geo.frame(in: .local).minX, y: geo.frame(in: .local).minY)
                        
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
