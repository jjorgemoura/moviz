//
//  FakeFilmPosterService.swift
//  movizTests
//
//  Created by Jorge Moura on 07/05/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

@testable import moviz
import RxSwift
import Foundation
import UIKit

class FakeFilmPosterService: FilmPosterService {

    func loadPosterImage(url: String) -> Single<Data> {
        let image = UIImage(named: "testImage")
        let imageData = UIImageJPEGRepresentation(image!, 1.0)
        return Single.just(imageData!)
    }
}
