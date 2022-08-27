//
//  ModalView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 20/08/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Hoang Minh Quan
  ID: s3754450
  Created  date: 20/8/2022
  Last modified: 27/8/2022
  Acknowledgement:
*/

import SwiftUI
    
struct ModalView: View {
    @EnvironmentObject var viewModel: MainGameViewModel
    
    func updateHighScores (){
        if (viewModel.currPoint > savedHighScore1){
            savedHighScore1 = viewModel.currPoint
        } else if (viewModel.currPoint > savedHighScore2){
            savedHighScore2 = viewModel.currPoint
        } else if (viewModel.currPoint > savedHighScore3){
            savedHighScore3 = viewModel.currPoint
        } else if (viewModel.currPoint > savedHighScore4){
            savedHighScore4 = viewModel.currPoint
        }else if (viewModel.currPoint > savedHighScore5){
            savedHighScore5 = viewModel.currPoint
        }
    }
    
    //Persist high scores of the 5 latest turns
    @AppStorage("savedHighScore1") var savedHighScore1 : Int = 0
    @AppStorage("savedHighScore2") var savedHighScore2 : Int = 0
    @AppStorage("savedHighScore3") var savedHighScore3 : Int = 0
    @AppStorage("savedHighScore4") var savedHighScore4 : Int = 0
    @AppStorage("savedHighScore5") var savedHighScore5 : Int = 0
    
    
    var body: some View {
            ZStack {
                VStack{
                    
                    Image("victory")
                        .resizable()
                        .frame(width: 80, height: 80)
                    Text("You Won!")
                        .font(.custom("Teko-Bold",size: 40))
                        .foregroundColor(Color("primary-500"))
                    Text("Phew! That's was close. You have saved the next generation of dinasour 🤗")
                        .font(.custom("Teko-Regular",size: 24))
                        .padding(.horizontal, 16)
                        
                    
                    HStack(spacing: 120){
                        Button("Replay", action: {
                            updateHighScores()
                            viewModel.initGame()
                        })
                        .font(.custom("Teko-Medium", size: 24))
                        .foregroundColor(Color("primary-500"))
                        
                        Button("Back to Menu", action: {
                            updateHighScores()
                            viewModel.pageView = "start"
                            viewModel.initGame()
                        })
                        .font(.custom("Teko-Medium", size: 24))
                        .foregroundColor(Color("primary-800"))
                    }
                    .padding(.top, 10)
                }
                .padding(.vertical, 28)
                .frame(maxWidth: 350)
                .background(Color("primary-100"))
            .cornerRadius(10)
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.8))
            .ignoresSafeArea()
       
        
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
            .environmentObject(MainGameViewModel())
    }
}
