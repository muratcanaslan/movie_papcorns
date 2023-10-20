//
//  DiscoverViewModel.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import Foundation

protocol DiscoverViewModelDelegate: AnyObject {
    func reload()
}

final class DiscoverViewModel {
    
    //MARK: - Properties
    let firebaseManager = FirebaseManager()
    let moviesManager = MoviesManager.shared
    
    weak var delegate: DiscoverViewModelDelegate?
    
    //MARK: - Network Related
    func signInAndFetchDatas() {
        firebaseManager.signInAnonymously { [weak self] success in
            if success {
                self?.firebaseManager.fetchCategories(completion: { categories in
                    self?.firebaseManager.fetchContent(completion: { contents in
                        self?.moviesManager.setCategories(categories: categories, contents: contents)
                        
                        self?.delegate?.reload()
                    })
                })
                
            } else {
                debugPrint("Giriş yapılırken bir sorun oluştu.")
            }
        }
    }

}
