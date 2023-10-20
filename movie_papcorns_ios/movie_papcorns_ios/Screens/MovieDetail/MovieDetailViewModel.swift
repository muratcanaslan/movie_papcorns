//
//  MovieDetailViewModel.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

final class MovieDetailViewModel {
    
    let movie: ContentViewModel
    let manager = MoviesManager.shared
    
    init(movie: ContentViewModel) {
        self.movie = movie
    }
}
