//
//  MovieDetailContracts.swift
//  MovieBox
//
//  Created by fatih on 8.04.2022.
//

import Foundation

protocol MovieDetailProtocol {
    func load()
}

protocol MovieDetailDelegate {
    func update(_ detail: MovieDetailPresentation)
}
