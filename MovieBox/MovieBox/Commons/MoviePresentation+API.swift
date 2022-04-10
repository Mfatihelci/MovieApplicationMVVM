//
//  MoviePresentation+API.swift
//  MovieBox
//
//  Created by fatih on 6.04.2022.
//

import MovieBoxAPI

extension MoviePresentations {
    init(moviedata: Result) {
        self.init(title: moviedata.name,
                  detail: moviedata.artistName,
                  poster: moviedata.poster)
    }
}
