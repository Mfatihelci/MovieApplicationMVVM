//
//  MovieDetailPresentation+API.swift
//  MovieBox
//
//  Created by fatih on 6.04.2022.
//

import MovieBoxAPI

extension MovieDetailPresentation {
    init(moviedata: Result) {
        self.init(title: moviedata.name,
                  artistName: moviedata.artistName,
                  genre: moviedata.genres.map({ $0.name }).joined(separator: " , "),
                  poster: moviedata.poster)
    }
}
