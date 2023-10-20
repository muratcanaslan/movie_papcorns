//
//  DiscoverViewController.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

final class DiscoverViewController: BaseViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var stackView: UIStackView!
    
    //MARK: - Properties
    private let viewModel = DiscoverViewModel()
    
    //MARK: - Lifecyles
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.delegate = self
        
        setupUI()
        viewModel.signInAndFetchDatas()
    }
    
    //MARK: - UI Helpers
    private func setupUI() {
        navigationItem.title = "Discover"
        scrollView.contentInset = .init(top: 32, left: 0, bottom: 72, right: 0)
    }
}

//MARK: - DiscoverViewModel Delegate
extension DiscoverViewController: DiscoverViewModelDelegate {
    func reload() {
        for category in viewModel.moviesManager.getBigImages() {
            let bigView = BigImageView()
            bigView.model = category
            DispatchQueue.main.async {
                self.stackView.addArrangedSubview(bigView)
            }
        }
        
        for category in viewModel.moviesManager.getSmallImages() {
            let smallView = SmallImageView()
            smallView.model = category
            
            DispatchQueue.main.async {
                self.stackView.addArrangedSubview(smallView)
            }
        }
    }
}
