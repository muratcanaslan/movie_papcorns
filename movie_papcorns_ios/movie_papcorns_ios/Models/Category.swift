//
//  Category.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

struct Category {
    let id : Int
    let order: Int // sıra numarası
    let title: String
    let type: Int  // 1 ise ana sayfada büyük gösterim olmalı, 0 ise küçük gösterim
}
