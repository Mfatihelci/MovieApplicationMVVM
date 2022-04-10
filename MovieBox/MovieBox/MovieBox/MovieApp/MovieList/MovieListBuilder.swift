//
//  MovieListBuilder.swift
//  MovieBox
//
//  Created by fatih on 6.04.2022.
//

import Foundation
import MovieBoxAPI

final class MovieListBuilder {
    static func make() -> MovieListViewController {
        let view = MovieListViewController()
        view.viewModel = MovieListViewModel(service: MovieService())
        return view
    }
}
