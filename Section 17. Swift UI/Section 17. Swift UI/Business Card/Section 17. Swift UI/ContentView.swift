//
//  ContentView.swift
//  Section 17. Swift UI
//
//  Created by Kim Yewon on 2022/08/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0, green: 0.72, blue: 0.58, opacity: 1.0)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Image("perceptual-standard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5))
                Text("Newon")
                    .bold()
                    .font(Font.custom("NotoSerifKR-Medium", size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("iOS Developer")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                Divider()
                InfoView(phoneNum: "+82 010 7477 9237", imageName: "phone.fill")
                InfoView(phoneNum: "chokovon@gmail.com", imageName: "envelope.fill")
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
