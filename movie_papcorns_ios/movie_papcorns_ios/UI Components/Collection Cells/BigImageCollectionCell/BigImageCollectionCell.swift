//
//  BigImageCollectionCell.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit

final class BigImageCollectionCell: BaseCollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var imageView: UIImageView!
    
    //MARK: - Properties
    var movie: ContentViewModel? {
        didSet {
            updateImage()
        }
    }
    
    //MARK: - Base Methods
    override func setupAfterInit() {
        super.setupAfterInit()
        
        imageView.layer.masksToBounds = true
    }
    
    //MARK: - Configure
    func updateImage() {
        if let url = movie?.imageUrl {
            imageView.downloadedFrom(url: url)
        }
    }
}
