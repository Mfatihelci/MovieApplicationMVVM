//
//  Model.swift
//  MovieBoxAPI
//
//  Created by fatih on 5.04.2022.
//

import Foundation

// MARK: - Book
public struct Book: Codable {
    public let feed: Feed?
}

// MARK: - Feed
public struct Feed: Codable {
    public  let title: String
    public let results: [Result]
}

// MARK: - Result
public struct Result: Codable {
    public let artistName: String
    public let id: String
    public let name: String
    public let releaseDate: String
    public let poster: String
    public let genres: [Genre]
    public let url: String

    public enum CodingKeys: String, CodingKey {
        case artistName
        case id
        case name
        case releaseDate
        case poster = "artworkUrl100"
        case genres
        case url
    }
}

// MARK: - Genre
public struct Genre: Codable {
    public let name: String

}
