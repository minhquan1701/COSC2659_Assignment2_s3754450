//
//  ContentView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 06/08/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Hoang Minh Quan
  ID: s3754450
  Created  date: 06/8/2022
  Last modified: 27/8/2022
  Acknowledgement:
*/

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: MainGameViewModel

    var body: some View{
        
        if (viewModel.pageView == "start"){
            StartMenuView()
        } else if (viewModel.pageView == "main"){
            MainGameView()
        } else if (viewModel.pageView == "leaderboard"){
            LeaderBoardView()
        } else if (viewModel.pageView == "instruction"){
            InstructionView()
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
