//
//  PopularMoviesTableViewCell.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class PopularMoviesTableViewCell: UITableViewCell, FilmViewModelDelegate {

    static let cellIdentifier: String = "PopularMoviesTableViewCell"

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!
    @IBOutlet private var rateLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var filmDescriptionText: UITextView!

    func configure(with film: FilmViewModel) {
        titleLabel.text = film.title
        releaseDateLabel.text = film.releaseDate
        rateLabel.text = String(film.voteAverage)
        filmDescriptionText.text = film.overview

        film.delegate = self

        if film.image == nil {
            film.downloadPosterImage()
        }
    }

//    func update(image: UIImage) {
//        posterImageView.image = image
//    }

    func posterImageUpdated(image: UIImage) {
        posterImageView.image = image
    }
}
