//
//  MovieDetailViewController.swift
//  MovieBox
//
//  Created by fatih on 8.04.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class MovieDetailViewController: UIViewController {
    
    private let image: UIImageView = UIImageView()
    private let name: UILabel = UILabel()
    private let artisName: UILabel = UILabel()
    private let genre: UILabel = UILabel()
    
    var viewModel: MovieDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        drawDesing()
        viewModel?.load()
    }
    
    private func configure(){
        view.addSubview(image)
        view.addSubview(name)
        view.addSubview(artisName)
        view.addSubview(genre)
        makeImage()
        makeName()
        makeArtistName()
        makeGenre()
    }
    
    private func drawDesing(){
        name.font = .boldSystemFont(ofSize: 20)
        artisName.font = .boldSystemFont(ofSize: 20)
        genre.font = .boldSystemFont(ofSize: 20)
        view.backgroundColor = .white
    }
}

extension MovieDetailViewController: MovieDetailDelegate {
    func update(_ detail: MovieDetailPresentation) {
        name.text = detail.title
        artisName.text = detail.artistName
        genre.text = detail.genre
        image.af.setImage(withURL: URL(string: detail.poster)!)
    }
}

extension MovieDetailViewController {
    private func makeImage(){
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(140)
            make.width.equalTo(180)
        }
    }
    
    private func makeName(){
        name.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(25)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeArtistName(){
        artisName.snp.makeConstraints{ make in
            make.top.equalTo(name.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeGenre(){
        genre.snp.makeConstraints{ make in
            make.top.equalTo(artisName.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
}

