//
//  InstructionView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 25/08/2022.
//

import SwiftUI

struct InstructionView: View {
    @EnvironmentObject var viewModel: MainGameViewModel

    var ButtonBack : some View {
        ButtonView(clickHandler: {viewModel.pageView = "start"}, type: "secondary", buttonTitle: "Back To Menu")
    }
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    Image("leaderboard-bg")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    
                    LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: .black, location: 0),
                                .init(color: .black.opacity(0.3), location: 1)
                            ]),
                            startPoint: .bottom,
                            endPoint: .top
                    )
                    .ignoresSafeArea()
                }
                
                
                VStack (spacing: 0) {
        
                    Text("INSTRUCTION")
                        .font(.custom("Teko-Bold", size: 48))
                        .foregroundColor(Color.white)
              
                    ScrollView( showsIndicators: false) {
                        VStack (alignment: .leading, spacing: 12){
                            Text("65 millions years ago, a meteoroid hit the Earth, causing the extinction for the dinasour. The goal of the game is to help Dil, our baby dinasour, to get through this horrific event and preserve the next generation of his kind.")
                                .foregroundColor(Color.white)
                                
                                
                                
                            Text("To play, roll the dice to move Dil accross blocks on the board.  There are two types blocks.")
                                .foregroundColor(Color.white)
                                
                                
                            VStack (alignment: .leading, spacing: 0){
                                HStack(alignment: .center, spacing: 12) {
                                    Text("Normal Block")
                                        .foregroundColor(Color("primary-300"))
                                    Image("point-block")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                    
                                }
                                Text(" A block has an associated point that Dil can obtain when entering.")
                                    .foregroundColor(Color.white)
                                
                               
                            }
                            
                                
                            VStack (alignment: .leading, spacing: 0) {
                                HStack(alignment: .center, spacing: 12) {
                                    Text("Effect Blocks:")
                                        .foregroundColor(Color("primary-300"))
                                    HStack(alignment: .center, spacing: 10) {
                                        Image("effect-block-1")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                        Image("effect-block-2")
                                            .resizable()
                                            .frame(width: 50, height: 50)
                                    }
                                        
                                }
                                
                                
                                Text(" If Dil goes into these blocks, he’ll be either sent back to the starting point and reseted all points, or deducted 100 points.")
                                    .foregroundColor(Color.white)
                            }
                        }
                        .font(.custom("Teko-Medium", size: 24))
                        .frame(maxWidth: 330)
                    .padding(.bottom, 64)
                    }
                    
                    ButtonBack
                    
                        
                }

            }


        }
    }
}

struct InstructionView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionView()
    }
}
