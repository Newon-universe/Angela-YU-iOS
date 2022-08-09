//
//  PostData.swift
//  H4XOR News
//
//  Created by Kim Yewon on 2022/08/09.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { objectID }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
