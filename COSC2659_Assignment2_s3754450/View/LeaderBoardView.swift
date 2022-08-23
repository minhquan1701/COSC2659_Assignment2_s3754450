//
//  LeaderBoardView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 23/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @State var isMainGameLinkActive = false
    @State var isStartMenuActive = false
    
    @AppStorage("savedHighScore1") var savedHighScore1 : Int = 0
    @AppStorage("savedHighScore2") var savedHighScore2 : Int = 0
    @AppStorage("savedHighScore3") var savedHighScore3 : Int = 0
    @AppStorage("savedHighScore4") var savedHighScore4 : Int = 0
    @AppStorage("savedHighScore5") var savedHighScore5 : Int = 0
    
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
                                .init(color: .black.opacity(0), location: 1)
                            ]),
                            startPoint: .bottom,
                            endPoint: .top
                    )
                    .ignoresSafeArea()
                }
                
                
                VStack (spacing: 0) {
               
                    Text("LEADERBOARD")
                        .font(.custom("Teko-Bold", size: 48))
                        .foregroundColor(Color.white)
                    
                    VStack{
                        Text(String(savedHighScore1))
                        
                    }
                    
                    
                    VStack(spacing: 32){
                        NavigationLink(destination: StartMenuView(), isActive: $isStartMenuActive){
                            ButtonView(clickHandler: {self.isStartMenuActive = true}, type: "secondary", buttonTitle: "Back To Menu")
                        }
                        
//                        NavigationLink(destination: MainGameView(), isActive: $isInstructionLinkActive){
//                            ButtonView(clickHandler: {self.isInstructionLinkActive = true}, type : "secondary", buttonTitle: "📖 Instruction")
//                        }
//                        NavigationLink(destination: MainGameView(), isActive: $isLeaderboardLinkActive){
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

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
