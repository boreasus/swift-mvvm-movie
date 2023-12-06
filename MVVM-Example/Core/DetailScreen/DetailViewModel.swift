//
//  DetailViewModel.swift
//  MVVM-Example
//
//  Created by safa uslu on 6.12.2023.
//

import Foundation

protocol DetailViewModelInterface {
    var view:DetailScreenInterface? { get set }
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface?
}

extension DetailViewModel: DetailViewModelInterface{
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDateLabel()
        view?.configureOverViewLabel()
    }
    
    
}
