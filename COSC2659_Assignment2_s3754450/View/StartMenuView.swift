//
//  StartMenuView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 22/08/2022.
//

import SwiftUI

struct StartMenuView: View {
    @State var isLinkActive = false
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
                
                
                VStack {
               
                    VStack (spacing: -48) {
                        Text("JURASSIC")
                            .font(.custom("Teko-Bold", size: 48))
                            .foregroundColor(Color("primary-300"))
                        Text("ESCAPE")
                            .font(.custom("Teko-Bold", size: 112))
                            .foregroundColor(Color.white)
                    }
                    
                    VStack{
                        NavigationLink(destination: MainGameView(), isActive: $isLinkActive){
                            ButtonView(clickHandler: {self.isLinkActive = true}, buttonTitle: "💥 Let’s Play")
                        }
                

                    }

                }

            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct StartMenuView_Previews: PreviewProvider {
    static var previews: some View {
        StartMenuView()
    }
}
