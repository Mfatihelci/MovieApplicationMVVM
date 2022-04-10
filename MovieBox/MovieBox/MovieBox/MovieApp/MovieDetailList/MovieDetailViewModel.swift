//
//  MovieDetailViewModel.swift
//  MovieBox
//
//  Created by fatih on 8.04.2022.
//

import Foundation
import MovieBoxAPI

final class MovieDetailViewModel: MovieDetailProtocol {
    
    var view: MovieDetailDelegate?
    var movie: MovieDetailPresentation?
    init(view: MovieDetailDelegate,movie: MovieDetailPresentation){
        self.view = view
        self.movie = movie
    }
    
    func load() {
        view?.update(movie!)
    }
}
