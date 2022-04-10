//
//  MovieListCell.swift
//  MovieBox
//
//  Created by fatih on 6.04.2022.
//

import UIKit
import SnapKit
import AlamofireImage

class MovieListCell: UITableViewCell {

    private let name: UILabel = UILabel()
    private let image: UIImageView = UIImageView()
    
    enum Identifier: String {
        case path = "Cell"
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        drawDesing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configure(){
        addSubview(name)
        addSubview(image)
        makeImage()
        makeName()
    }
    private func drawDesing(){
        name.font = .boldSystemFont(ofSize: 20)
        name.textColor = .black
    }
    func saveModel(data: MoviePresentations) {
        name.text = data.title
        image.af.setImage(withURL: URL(string: data.poster)!)
    }
}

extension MovieListCell {
    
    private func makeImage() {
        image.snp.makeConstraints{ make in
            make.height.equalTo(140)
            make.width.equalTo(180)
            make.top.equalTo(contentView).offset(5)
            make.left.equalTo(contentView).offset(10)
        }
    }
    private func makeName() {
        name.snp.makeConstraints{ make in
            make.top.equalTo(image.snp.bottom).offset(10)
            make.left.equalTo(contentView).offset(10)
        }
    }
}

