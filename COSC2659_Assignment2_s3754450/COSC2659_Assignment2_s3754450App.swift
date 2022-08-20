//
//  COSC2659_Assignment2_s3754450App.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 06/08/2022.
//

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
