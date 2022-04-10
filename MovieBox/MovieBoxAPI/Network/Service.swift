//
//  Service.swift
//  MovieBoxAPI
//
//  Created by fatih on 5.04.2022.
//

import Foundation
import Alamofire

 public protocol MovieServiceProtocol {
     func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

public enum MovieServiceEndPoint: String {
    case path_url = "https://rss.applemarketingtools.com/api/v2/us/books/top-free/50/books.json"
}

 public class MovieService: MovieServiceProtocol {
    public init() { }
    public func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(MovieServiceEndPoint.path_url.rawValue).responseDecodable(of: Book.self){ (model) in
            guard let data = model.value else { return }
            guard let value = data.feed?.results else { return}
            response(value)
        }
    }
}

