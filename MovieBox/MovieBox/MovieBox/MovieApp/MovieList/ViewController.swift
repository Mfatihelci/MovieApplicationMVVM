//
//  ViewController.swift
//  MovieBox
//
//  Created by fatih on 5.04.2022.
//

import UIKit
import SnapKit

class MovieListViewController: UIViewController {

    private let tableView  :UITableView = UITableView()
    private let indicator  :UIActivityIndicatorView = UIActivityIndicatorView()
    var tableProvider: TableViewProvider = TableViewProvider()
    var viewModel: MovieListViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
        tableProvider.delegate = self
        viewModel?.load()
        initService()
        initDelegate()
    }
    
    private func initDelegate(){
        tableView.register(MovieListCell.self, forCellReuseIdentifier:
        MovieListCell.Identifier.path.rawValue)
        tableView.delegate = tableProvider
        tableView.dataSource = tableProvider
    }
    
    private func initService(){
        configure()
        drawDesing()
    }
    
    private func configure(){
        view.addSubview(tableView)
        view.addSubview(indicator)
        makeIndicator()
        makeTableView()
    }
    
    private func drawDesing(){
        tableView.rowHeight = 180
        indicator.color = .red
        view.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.orange]
    }
}

extension MovieListViewController: tableViewDelegate {
    func onSelected(value: MovieDetailPresentation) {
        let viewController = MovieDetailBuilder.make(movie: value)
        show(viewController, sender: nil)
    }
}

extension MovieListViewController : MovieListViewModelDelegate {
    func handleViewModelOutPut(_ output: MovieListViewOutPut) {
        switch output {
        case .title(let title):
            self.title = title
        case .setLoading(let bool):
            bool ? indicator.startAnimating() : indicator.stopAnimating()
        case .showMovieList(let list):
            tableProvider.update(value: list)
            tableView.reloadData()
        }
    }
}

extension MovieListViewController {
    private func makeIndicator(){
        indicator.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right).offset(-20)
            make.height.equalTo(50)
        }
    }
    
    private func makeTableView(){
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.bottom.equalToSuperview()
        }
    }
}

