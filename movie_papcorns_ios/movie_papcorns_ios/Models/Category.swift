//
//  Category.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

struct Category: Codable {
    let id : Int
    let order: Int // sıra numarası
    let title: String
    let type: Int  // 1 ise ana sayfada büyük gösterim olmalı, 0 ise küçük gösterim
}

class CategoryViewModel {
    let id: Int
    let order: Int
    let title: String
    let type: Int
    
    var movies: [ContentViewModel] = []
    
    init(model: Category, movies: [ContentViewModel]) {
        self.id = model.id
        self.order = model.order
        self.title = model.title
        self.type = model.type
        
        for movie in movies {
            if movie.categoryId == id {
                self.movies.append(movie)
            }
        }
    }
}

