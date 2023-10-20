//
//  MoviesManager.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

final class MoviesManager {
    
    static let shared = MoviesManager()
    
    //MARK: - User defaults properties
    @UserDefaultWrapper(key: "ud_favorite_movies", defaultValue: [])
    private var favoriteMovies: [ContentViewModel]

    //MARK: - Properties
    private var categories: [CategoryViewModel] = []
    
    //MARK: - Init
    private init() { }
    
    //MARK: - Helpers
    func setCategories(categories: [Category], contents: [Content]) {
        let movieVM: [ContentViewModel] = contents.map({ .init(model: $0)})
        self.categories = categories.map({ .init(model: $0, movies: movieVM)})
    }
    
    func getBigImages() -> [CategoryViewModel] {
        let bigImages = categories.filter({ $0.type == 1}).sorted(by: { $0.order < $1.order})
        return bigImages
    }
    
    func getSmallImages() -> [CategoryViewModel] {
        print(categories)
        let smallImages = categories.filter({ $0.type == 0}).sorted(by: { $0.order < $1.order})
        return smallImages
    }
    
    func getFavorites() -> [ContentViewModel] {
        return favoriteMovies
    }
    
    func addFavorite(model: ContentViewModel) {
        self.favoriteMovies.append(model)
    }
    
    func removeFavorite(model: ContentViewModel) {
        guard let index = favoriteMovies.firstIndex(where: { $0 == model}) else { return }
        favoriteMovies.remove(at: index)
    }
}
 
