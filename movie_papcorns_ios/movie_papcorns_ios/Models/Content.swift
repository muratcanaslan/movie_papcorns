//
//  Content.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

struct Content: Codable {
    let categoryId: Int // hangi kategoriye ait olduğu
    let contentId: Int
    let contentName: String
    let imageUrl : String
    
}

class ContentViewModel: Codable, Equatable  {
    let categoryId: Int
    let contentId: Int
    let contentName: String
    let imageUrl: URL?
    
    init(model: Content) {
        self.categoryId = model.categoryId
        self.contentId = model.contentId
        self.contentName = model.contentName
        self.imageUrl = URL(string: model.imageUrl)
    }
    
    static func == (lhs: ContentViewModel, rhs: ContentViewModel) -> Bool {
        return lhs.contentId == rhs.contentId && lhs.contentName == rhs.contentName
    }
}
