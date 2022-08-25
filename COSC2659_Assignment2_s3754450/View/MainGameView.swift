//
//  MainGameView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 22/08/2022.
//

import SwiftUI

struct MainGameView: View {
    @EnvironmentObject var viewModel: MainGameViewModel
    @State var scaleFator = 0.7
    @State var opacityFactor = 0.8
    @AppStorage("savedHighScore1") var highestScore : Int = 0
    
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
                .edgesIgnoringSafeArea(.all)
                
            }
            
            
            VStack (spacing: 0) {
                HStack  {
                    HStack (spacing: 4) {
                        Image(systemName:"star.circle")
                            .font(.system(size: 24))
                        Text("\(viewModel.currPoint)")
                            .font(.custom("Teko-SemiBold" ,size: 24))

                    }
                    
                    Spacer()
                    
                    

                    HStack (alignment: .center, spacing: 4) {
                        Image("high-score")
                            .resizable()
                            .frame(width: 26, height: 22.4)
                        Text(String(highestScore))
                            .font(.custom("Teko-SemiBold" ,size: 24))
                    }


                        
                }
                .padding(.horizontal, 16)
                .frame(maxWidth: 345)
                .padding(.bottom, 10)
                .foregroundColor(Color("primary-100"))
                
                
                Image("dice-\(viewModel.diceDisplay)")
                    .resizable()
                    .frame(width: 64, height: 64)
                
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
                .padding(.top, 8)
            
                ZStack () {
                    Circle()
                        .fill(Color("primary-100"))
                        .frame(width: 50, height: 50)
                        .scaleEffect(scaleFator)
                        .opacity(Double(opacityFactor))
                        .onAppear{
                            withAnimation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false)){
                                self.opacityFactor = 0.1
                                self.scaleFator = 1.5
                            }
                        }
                    Text("Tap here to roll")
                        .font(.custom("Teko-Regular", size: 24))
                        .foregroundColor(Color("primary-100"))

                        
                        
                }
                .padding(.top, 24)
                .onTapGesture {
                    withAnimation(.easeIn){
                        viewModel.rollDice()
                    }
                }
            
            }
            if(viewModel.isWon){
                ModalView()
            }
           
            
        }
        .padding(0)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        
    }
}

struct MainGameView_Previews: PreviewProvider {
    static var previews: some View {
        MainGameView()
            .environmentObject(MainGameViewModel())
    }
}
