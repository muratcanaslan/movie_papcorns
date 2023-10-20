//
//  FavoritesViewController.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

final class FavoritesViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIView!
    
    //MARK: - Properties
    private let manager = MoviesManager.shared
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setEmptyViewAndReload()
    }
    
    //MARK: - UI Helpers
    private func setupUI() {
        navigationItem.title = "Favorites"
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: BigImageCollectionCell.self)
        collectionView.contentInset = .init(top: 0, left: 12, bottom: 0, right: 12)
    }
    
    private func setEmptyViewAndReload() {
        DispatchQueue.main.async {
            self.emptyView.isHidden = !self.manager.getFavorites().isEmpty
            self.collectionView.reloadData()
        }
    }
}

//MARK: - UICollectionView DataSource
extension FavoritesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let movies = manager.getFavorites()
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: BigImageCollectionCell.self)
        let movie = manager.getFavorites()[indexPath.item]
        cell.movie = movie
        return cell
    }
}

//MARK: - UICollectionView Delegate
extension FavoritesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = manager.getFavorites()[indexPath.item]
        let vc = MovieDetailViewController(movie: movie)
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UICollectionView DelegateFlowLayout
extension FavoritesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.size.width - 32) / 2
        let height: CGFloat = 300
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}

