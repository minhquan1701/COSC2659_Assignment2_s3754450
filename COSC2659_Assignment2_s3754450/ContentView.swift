//
//  ContentView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 06/08/2022.
//

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
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
