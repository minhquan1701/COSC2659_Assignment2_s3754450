//
//  AboutModalView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 25/08/2022.
//

import SwiftUI

struct AboutModalView: View {
    @EnvironmentObject var viewModel: MainGameViewModel
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
                        
                    
                    Button("Back to Menu", action: {
                        
                        viewModel.pageView = "start"
                        
                    })
                    .font(.custom("Teko-Medium", size: 24))
                    .foregroundColor(Color("primary-800"))
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

struct AboutModalView_Previews: PreviewProvider {
    static var previews: some View {
        AboutModalView()
    }
}
