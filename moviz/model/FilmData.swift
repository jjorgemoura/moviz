//
//  Film.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

struct FilmData: Codable {

    let identifier: Int
    let title: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case title = "title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
