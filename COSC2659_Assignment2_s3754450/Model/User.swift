//
//  User.swift
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

struct User : Identifiable {
    var id = UUID()
    var name = "Quan"
    var highScore = 0
}
