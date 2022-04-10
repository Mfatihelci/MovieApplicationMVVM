//
//  MovieListViewModel.swift
//  MovieBox
//
//  Created by fatih on 5.04.2022.
//

import UIKit
import MovieBoxAPI

final class MovieListViewModel {
    
    var movieList: [Result] = []
    var delegate: MovieListViewModelDelegate?
    var service: MovieServiceProtocol?
    
    init(service : MovieServiceProtocol){
        self.service = service
    }
}

extension MovieListViewModel: MovieListViewModelProtocol {
    func load() {
        delegate?.handleViewModelOutPut(.title("Movies"))
        delegate?.handleViewModelOutPut(.setLoading(true))
        service?.fetchAllDatas (response: { [delegate] (data) in
            delegate?.handleViewModelOutPut(.setLoading(false))
            guard let dataTwo = data else { return }
            delegate?.handleViewModelOutPut(.showMovieList(dataTwo))
            self.movieList = dataTwo
        })
    }
}
