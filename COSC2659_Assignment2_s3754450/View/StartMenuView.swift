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
                    
                    VStack{
                        HStack (alignment: .center, spacing: 4) {
                            Image(systemName: "info.circle")
                            Text("About")
                                .font(.custom("Teko-Medium", size: 18))
                            
                        }
                        .foregroundColor(Color.black.opacity(0.7))
                            
                    }
                    .frame(maxWidth: 330, alignment: .trailing)
                    Spacer()
                    
                    VStack (spacing: -48) {
                        Text("JURASSIC")
                            .font(.custom("Teko-Bold", size: 48))
                            .foregroundColor(Color("primary-300"))
                        Text("ESCAPE")
                            .font(.custom("Teko-Bold", size: 112))
                            .foregroundColor(Color.white)
                    }
                    
                    VStack(spacing: 32){
                        ButtonView(clickHandler: {
                            viewModel.pageView = "main"
                            stopSound()
                        }, buttonTitle: "💥 Let’s Play")
                        
                        ButtonView(clickHandler: {
                            viewModel.pageView = "instruction"
                            stopSound()
                        }, type : "secondary", buttonTitle: "📖 Instruction")
                        
                        ButtonView(clickHandler: {
                            viewModel.pageView = "leaderboard"
                            stopSound()
                        }, type : "secondary", buttonTitle: "🏆 Leaderboard")

                    }
                    
                    Spacer()

                }

            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .onAppear{
                playSound(sound: "start", type: "mp3", isRepeat: true)
            }
            
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
