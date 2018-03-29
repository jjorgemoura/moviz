//
//  MovieView.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class MovieView: UIView {

    @IBOutlet private var posterImageView: UIImageView!

    func showPoster(image posterImage: UIImage) {
        posterImageView.image = posterImage
    }
}
