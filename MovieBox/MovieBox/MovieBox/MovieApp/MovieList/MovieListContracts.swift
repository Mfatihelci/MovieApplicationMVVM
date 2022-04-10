//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by fatih on 5.04.2022.
//

import Foundation
import MovieBoxAPI

//MARK: - ViewModel
protocol MovieListViewModelProtocol {
    var delegate: MovieListViewModelDelegate? { get set }
    func load()
}

enum MovieListViewOutPut {
    case title(String)
    case setLoading(Bool)
    case showMovieList([Result])
}

protocol MovieListViewModelDelegate {
    func handleViewModelOutPut(_ output: MovieListViewOutPut)
}
//MARK: - TableProvider
protocol tableViewProtocol {
    func update(value: [Result])
}

protocol tableViewDelegate {
    func onSelected(value: MovieDetailPresentation)
}

