//
//  LeaderBoardView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 23/08/2022.
//

import SwiftUI

struct LeaderBoardView: View {
    @EnvironmentObject var viewModel: MainGameViewModel
    
    @AppStorage("savedHighScore1") var savedHighScore1 : Int = 0
    @AppStorage("savedHighScore2") var savedHighScore2 : Int = 0
    @AppStorage("savedHighScore3") var savedHighScore3 : Int = 0
    @AppStorage("savedHighScore4") var savedHighScore4 : Int = 0
    @AppStorage("savedHighScore5") var savedHighScore5 : Int = 0
    
    var ButtonBack : some View {
        ButtonView(clickHandler: {viewModel.pageView = "start"}, type: "secondary", buttonTitle: "Back To Menu")
    }
    var PlayBack : some View {
        ButtonView(clickHandler: {viewModel.pageView = "main"}, type: "primary", buttonTitle: "Play Now")
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
                            .font(.custom("Teko-Bold", size: 32))
                            .foregroundColor(Color("primary-300"))
                        Text(String(savedHighScore2))
                            .font(.custom("Teko-Bold", size: 32))
                            .foregroundColor(Color("primary-300"))
                        Text(String(savedHighScore3))
                            .font(.custom("Teko-Bold", size: 32))
                            .foregroundColor(Color("primary-300"))
                        Text(String(savedHighScore4))
                            .font(.custom("Teko-Bold", size: 32))
                            .foregroundColor(Color("primary-300"))
                        Text(String(savedHighScore5))
                            .font(.custom("Teko-Bold", size: 32))
                            .foregroundColor(Color("primary-300"))
                        
                    }
                    .padding(.bottom, 64)
                        
                    VStack (spacing: 32){
                        PlayBack
                        ButtonBack
                    }
                        
                }

            }


        }
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
