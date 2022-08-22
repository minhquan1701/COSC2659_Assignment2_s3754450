//
//  ButtonView.swift
//  COSC2659_Assignment2_s3754450
//
//  Created by Quan, Hoang Minh on 22/08/2022.
//

import SwiftUI
    
struct ButtonView: View {
    var clickHandler: () -> Void
    var type = "primary"
    var buttonTitle = "Click me"
    var body: some View {
        Button(buttonTitle, action: {
            self.clickHandler()
        })
        
        .frame(width: 165, height: 64)
        .background(type == "primary" ? Color("primary-500") : Color("primary-800"))
        .border(Color("primary-300"), width: 3)
        .cornerRadius(2)
        
        .foregroundColor(Color.white)
        .font(.custom("Teko-Bold", size: 21))
        
            
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(clickHandler: {})
    }
}
