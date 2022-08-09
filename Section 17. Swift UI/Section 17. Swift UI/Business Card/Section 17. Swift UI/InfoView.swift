//
//  InfoView.swift
//  Section 17. Swift UI
//
//  Created by Kim Yewon on 2022/08/09.
//

import SwiftUI

struct InfoView: View {
    var phoneNum: String
    var imageName: String
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack{
                    Image(systemName: imageName)
                        .foregroundColor(.green)
                    Text(phoneNum)
                }
            )
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(phoneNum: "+82 010 7477 9237", imageName: "phone.fill")
            .previewLayout(.sizeThatFits)
    }
}
