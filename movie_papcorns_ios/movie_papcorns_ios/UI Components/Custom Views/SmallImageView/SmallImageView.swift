//
//  SmallImageView.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

final class SmallImageView: BaseView {

    //MARK: - IBOutlets
    @IBOutlet private weak var categoryTitle: UILabel!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    //MARK: - Blocks
    var didTapMovie: ((ContentViewModel?) -> Void)?
    
    //MARK: - Properties
    var model: CategoryViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.updateCategoryTitle()
                self.collectionView.reloadData()
            }
        }
    }
    
    //MARK: - Base Methods
    override func setupAfterInit() {
        super.setupAfterInit()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: BigImageCollectionCell.self)
    }

    //MARK: - Helpers
    private func updateCategoryTitle() {
        self.categoryTitle.text = model?.title
    }
}

//MARK: - UICollectionView DataSource
extension SmallImageView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movies = model?.movies else { return 0 }
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: BigImageCollectionCell.self)
        let movie = model?.movies[indexPath.item]
        cell.movie = movie
        return cell
    }
}

//MARK: - UICollectionView Delegate
extension SmallImageView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = model?.movies[indexPath.item]
        self.didTapMovie?(movie)
    }
}

//MARK: - UICollectionView DelegateFlowLayout
extension SmallImageView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.size.width - 16) / 4.5
        let height: CGFloat = 200
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        4
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        4
    }
}

