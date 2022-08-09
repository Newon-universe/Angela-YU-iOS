//
//  DetailView.swift
//  H4XOR News
//
//  Created by Kim Yewon on 2022/08/09.
//

import SwiftUI

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: nil)
    }
}

