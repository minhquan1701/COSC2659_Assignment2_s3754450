//
//  COSC2659_Assignment2_s3754450App.swift
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
    StateObject: https://www.hackingwithswift.com/quick-start/swiftui/what-is-the-stateobject-property-wrapper
*/

import SwiftUI

@main
struct COSC2659_Assignment2_s3754450App: App {
    @StateObject var mainGameViewModel = MainGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(mainGameViewModel)
        }
    }
}
