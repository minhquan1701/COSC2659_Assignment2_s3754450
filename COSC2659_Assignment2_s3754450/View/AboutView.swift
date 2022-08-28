//
//  AboutModalView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 25/08/2022.
//

/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Hoang Minh Quan
  ID: s3754450
  Created  date: 25/8/2022
  Last modified: 27/8/2022
  Acknowledgement:
*/

import SwiftUI

struct AboutView: View {
    @Environment(\.dismiss) var dismiss

    @EnvironmentObject var viewModel: MainGameViewModel
    var body: some View {
            
        VStack{
            
            Text("About Author")
                .font(.custom("Teko-Bold",size: 32))
                .foregroundColor(Color("primary-500"))
            
            
            VStack (alignment: .leading, spacing: 12) {
                Text("This game was designed with 🔥 in Figma and developed with 💖 in SwiftUI by Hoang Minh Quan - s3754450.")
                Text("Game assets sources: Freepik, Mixkit, and Flat Icon.")
                Text("For app/web design side projects, feel free to contact me at your convenience via:")
            }
            .font(.custom("Teko-Regular",size: 24))
            .padding(.bottom, 1)
            .padding(.top, 1)
               
            VStack (spacing: 12) {
                Text("[Portfolio](https://www.quanhere.com/)")
                Text("[Linkedin](https://www.linkedin.com/in/hoang-minh-quan-6b2295191)")
                Text("minhquandn1701@gmail.com")
            }
            .font(.custom("Teko-Regular",size: 24))

            ButtonView(clickHandler: {
                dismiss()
                
            }, type: "secondary", buttonTitle: "Back to Menu")
            .font(.custom("Teko-Medium", size: 24))
            .foregroundColor(Color("primary-800"))
            .padding(.top, 10)
        }
        .padding(.horizontal, 16)

    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
