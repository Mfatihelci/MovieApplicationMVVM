//
//  MovieDetailBuilder.swift
//  MovieBox
//
//  Created by fatih on 8.04.2022.
//

import Foundation
import MovieBoxAPI

final class MovieDetailBuilder {
    static func make(movie: MovieDetailPresentation) -> MovieDetailViewController {
        let vc = MovieDetailViewController()
        let viewModel = MovieDetailViewModel(view: vc,movie: movie)
        vc.viewModel = viewModel
        return vc
    }
}
