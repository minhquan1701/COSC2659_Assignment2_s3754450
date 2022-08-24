//
//  StartMenuView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 22/08/2022.
//

import SwiftUI

struct StartMenuView: View {
    @EnvironmentObject var viewModel: MainGameViewModel
    
    @State var isMainGameLinkActive = false
    @State var isInstructionLinkActive = false
    @State var isLeaderboardLinkActive = false
    
    var body: some View {
        NavigationView {
            ZStack {
                ZStack {
                    Image("start-bg")
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
                
                
                VStack (spacing: 24) {
               
                    VStack (spacing: -48) {
                        Text("JURASSIC")
                            .font(.custom("Teko-Bold", size: 48))
                            .foregroundColor(Color("primary-300"))
                        Text("ESCAPE")
                            .font(.custom("Teko-Bold", size: 112))
                            .foregroundColor(Color.white)
                    }
                    
                    VStack(spacing: 32){
//                        NavigationLink(destination: MainGameView(), isActive: $isMainGameLinkActive){
//                            ButtonView(clickHandler: {self.isMainGameLinkActive = true}, buttonTitle: "💥 Let’s Play")
//                        }
                        ButtonView(clickHandler: {viewModel.pageView = "main"}, buttonTitle: "💥 Let’s Play")
                        ButtonView(clickHandler: {viewModel.pageView = "leaderboard"}, type : "secondary", buttonTitle: "🏆 Leaderboard")
//                        NavigationLink(destination: MainGameView(), isActive: $isInstructionLinkActive){
//                            ButtonView(clickHandler: {self.isInstructionLinkActive = true}, type : "secondary", buttonTitle: "📖 Instruction")
//                        }
//                        NavigationLink(destination: LeaderBoardView().navigationBarBackButtonHidden(true), isActive: $isLeaderboardLinkActive){
//                            ButtonView(clickHandler: {self.isLeaderboardLinkActive = true}, type : "secondary", buttonTitle: "🏆 Leaderboard")
//                        }
                

                    }

                }

            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
