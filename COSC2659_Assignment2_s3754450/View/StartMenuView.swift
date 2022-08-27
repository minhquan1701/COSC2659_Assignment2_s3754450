//
//  StartMenuView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 22/08/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Hoang Minh Quan
  ID: s3754450
  Created  date: 22/8/2022
  Last modified: 27/8/2022
  Acknowledgement:
*/

import SwiftUI

struct StartMenuView: View {
    @EnvironmentObject var viewModel: MainGameViewModel
    
    @State private var showingAbout = false
    
    
    func toggleSound(){
        viewModel.isMuted.toggle()
    }
    
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
                    
                    HStack{
                        
                        Image(systemName: viewModel.isMuted ? "speaker" : "speaker.slash")
                            .font(.system(size: 24))
                            .onTapGesture {
                                viewModel.isMuted.toggle()
                                if (viewModel.isMuted == true){
                                    stopSound()
                                }else{
                                    playSound(sound: "start", type: "mp3", isRepeat: true)
                                }
                            }

                        Spacer()
                        HStack (alignment: .center, spacing: 4) {
                            Image(systemName: "info.circle")
                                .font(.system(size: 20))
                            Text("About")
                                .font(.custom("Teko-Medium", size: 18))
                            
                        }
                        
                        .onTapGesture{
                            self.showingAbout.toggle()
                        }
                            
                    }
                    .foregroundColor(Color.black.opacity(0.7))
                    .frame(maxWidth: 330)
                    
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
            .sheet(isPresented: $showingAbout) {
                AboutView()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
           
            .onAppear{
                if (viewModel.isMuted){
                    stopSound()
                } else {
                    playSound(sound: "start", type: "mp3", isRepeat: true)
                }
                
            }
            
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
