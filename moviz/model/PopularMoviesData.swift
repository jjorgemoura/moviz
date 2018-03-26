//
//  PopularFilmsData.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

struct PopularMoviesData: Codable {

    let page: Int
    let results: [FilmData]
}
