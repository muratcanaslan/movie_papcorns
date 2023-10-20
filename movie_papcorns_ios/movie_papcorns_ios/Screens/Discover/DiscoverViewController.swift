//
//  DiscoverViewController.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

final class DiscoverViewController: BaseViewController {

    let firebase = FirebaseManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Discover"
        firebase.signInAnonymously { [weak self] success in
            self?.firebase.fetchContent()
        }
    }
}
