//
//  FilmPosterService.swift
//  moviz
//
//  Created by Jorge Moura on 06/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import Foundation
import RxSwift

protocol FilmPosterService {

    func loadPosterImage(url: String) -> Single<Data>
}
