//
//  DetailScreen.swift
//  MVVM-Example
//
//  Created by safa uslu on 6.12.2023.
//

import UIKit

protocol DetailScreenInterface: AnyObject{
    func configureVC()
    func configurePosterImageView()
    func downloadPosterImage()
    func configureTitleLabel()
    func configureDateLabel()
    func configureOverViewLabel()
}

final class DetailScreen: UIViewController {

    private let movie:MovieResult

    private let viewModel = DetailViewModel()
    
    private let padding:CGFloat = 16
    
    private var posterImageView: PosterImageView!
    private var titleLabel: UILabel!
    private var dateLabel: UILabel!
    private var overViewLabel: UILabel!
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
}


extension DetailScreen: DetailScreenInterface{

    
    func downloadPosterImage() {
        posterImageView.downloadImage(movie: movie)
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        
        posterImageView.layer.cornerRadius = 16
        posterImageView.clipsToBounds = true
        
        let posterWidth = CGFloat.dwidth * 0.4
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            posterImageView.widthAnchor.constraint(equalToConstant: posterWidth),
            posterImageView.heightAnchor.constraint(equalToConstant: posterWidth * 1.5),
        ])
        
        posterImageView.backgroundColor = .red
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    
    func configureTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = movie._title
        titleLabel.font = .boldSystemFont(ofSize: 24)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
        ])
    }
    
    func configureDateLabel() {
        dateLabel = UILabel(frame: .zero)
        view.addSubview(dateLabel)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.text = movie._releaseDate
        dateLabel.font = .systemFont(ofSize: 18)
        dateLabel.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3 * padding),
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    func configureOverViewLabel() {
        overViewLabel = UILabel(frame: .zero)
        view.addSubview(overViewLabel)
        
        overViewLabel.translatesAutoresizingMaskIntoConstraints = false
    
        overViewLabel.text = movie._overView
        overViewLabel.font = .systemFont(ofSize: 20)
        overViewLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            overViewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: padding * 2),
            overViewLabel.leadingAnchor.constraint(equalTo: posterImageView.leadingAnchor),
            overViewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
    
    
}
