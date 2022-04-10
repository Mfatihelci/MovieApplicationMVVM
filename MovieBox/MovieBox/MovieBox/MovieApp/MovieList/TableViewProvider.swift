//
//  TableViewProvider.swift
//  MovieBox
//
//  Created by fatih on 6.04.2022.
//

import UIKit
import MovieBoxAPI

final class TableViewProvider: NSObject,tableViewProtocol {
    
    var movie: [MoviePresentations] = []
    var delegate: tableViewDelegate?
    var detail: [Result] = []
}

extension TableViewProvider {
    func update(value: [Result]) {
        self.detail = value
        let data = value.map(MoviePresentations.init)
        self.movie = data
    }
}

extension TableViewProvider: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movieL = movie[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListCell.Identifier.path.rawValue)
        as? MovieListCell else{
        return UITableViewCell()
    }
        cell.saveModel(data: movieL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = detail[indexPath.row]
        let value = MovieDetailPresentation.init(moviedata: data)
        delegate?.onSelected(value: value)
    }
}

