//
//  MovieDetailViewController.swift
//  movie_papcorns_ios
//
//  Created by Murat Can ASLAN on 20.10.2023.
//

import UIKit
import StoreKit
final class MovieDetailViewController: BaseViewController {

    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentNameLabel: UILabel!
    
    //MARK: - Properties
    private let viewModel: MovieDetailViewModel
    private var button = UIBarButtonItem()

    //MARK: - Inits
    init(movie: ContentViewModel) {
        self.viewModel = MovieDetailViewModel(movie: movie)
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addFavoriteBarButtonItem()
    }
    
    //MARK: - Helpers
    private func addFavoriteBarButtonItem() {
        let isFavorite: Bool = viewModel.manager.isFavorite(with: viewModel.movie)
        let image: UIImage? = isFavorite ? I.iconFavorite : I.iconUnfavorite
        button = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(didTapFavorite))
        navigationItem.rightBarButtonItem = button
    }
    private func setupUI() {
        if let url = viewModel.movie.imageUrl {
            imageView.downloadedFrom(url: url)
        }
        
        contentNameLabel.text = viewModel.movie.contentName
    }
    //MARK: - IBActions
    
    @objc func didTapFavorite() {
        viewModel.manager.didTapFavorite(with: viewModel.movie)
        let isFavorite = viewModel.manager.isFavorite(with: viewModel.movie)
        let image: UIImage? = isFavorite ? I.iconFavorite : I.iconUnfavorite
        button.image = image
    }
    
    @IBAction private func didTapLike(_ sender: UIButton) {
        SKStoreReviewController.requestReview()
    }
    
    @IBAction private func didTapDislike(_ sender: UIButton) {
        DispatchQueue.main.async {
            self.questionView.isHidden = true
        }
    }
    
    @IBAction private func didTapDownload(_ sender: UIButton) {
        if let image = imageView.image {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
    
    @IBAction private func didTapShare(_ sender: UIButton) {
        let vc = UIActivityViewController(activityItems: [viewModel.movie.contentName], applicationActivities: [])
        DispatchQueue.main.async {
            self.present(vc, animated: true)
        }
    }
}
