//
//  ContentView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 06/08/2022.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = MainGameViewModel()
    var body: some View {
        
        
        ZStack {
            ZStack {
                Image("main-game-bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                
                LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .black, location: 0),
                            .init(color: .black.opacity(0), location: 1)
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                )
                .ignoresSafeArea()
            }
            
            
            VStack {
           
                    HStack  {
                        //TODO: point component
                        HStack (spacing: 4) {
                            Image(systemName:"star.circle")
                                .font(.system(size: 32))
                            Text("\(viewModel.currPoint)")
                                .font(.system(size: 24))
                                .fontWeight(.semibold)
                                
                        }
                        
                        
                        Spacer()
                        Text("00:59")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("Quan")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)

                            
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 32)
                    .frame(maxWidth: 375)
                    
                
                    
                    .foregroundColor(Color("primary-100"))
                
                
                
                ZStack {
                        Image("map")
                        .resizable()
                        .scaledToFill()
                           
                        // Peek the location of the next tile to turn.
                        GeometryReader{ geo in
                            Image("dinosaur")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .position(x: geo.frame(in: .local).minX + 36 + CGFloat(viewModel.offsetX), y: geo.frame(in: .local).minY + 36 + CGFloat( viewModel.offsetY))
                                .animation(.easeInOut, value: viewModel.offsetX)
                                .animation(.easeInOut, value: viewModel.offsetY)
                                
                                
                        }
                        
                    }
               
                .frame(width: 288, height: 504)
            
                VStack {
                    Text("Tap the dice to roll")
                        .foregroundColor(Color("primary-100"))
                    Image("dice-\(viewModel.diceDisplay)")
                        .resizable()
                        .frame(width: 87, height: 87)
                        .onTapGesture {
                            withAnimation(.easeIn){
                                viewModel.rollDice()
                            }
                        }
                        
                    
                }
                .padding(.top, 32)
            
            }
        }
        
            
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
