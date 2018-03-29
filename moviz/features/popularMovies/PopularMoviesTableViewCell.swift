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

    private var shouldCancelDownload: Bool = false
    private var isDownloadingImage: Bool = false

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!
    @IBOutlet private var rateLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var filmDescriptionText: UITextView!

    func configure(with film: FilmViewModel) {
        if isDownloadingImage {
            shouldCancelDownload = true
        }

        film.delegate = self
        let ratingPercentage: Int = Int(film.voteAverage * 10)
        formatRate(after: ratingPercentage)

        titleLabel.text = film.title
        releaseDateLabel.text = film.releaseDate
        rateLabel.text = String(format: "%d%%", ratingPercentage)
        filmDescriptionText.text = film.overview

        if film.image == nil {
            isDownloadingImage = true
        } else {
            posterImageView.image = nil
        }
        film.downloadPosterImage()
    }

    func posterImageUpdated(image: UIImage) {
        if !shouldCancelDownload {
            posterImageView.image = image
            isDownloadingImage = false
            shouldCancelDownload = false
        }
    }

    private func formatRate(after voteAverage: Int) {

        if voteAverage < 40 {
            rateLabel.textColor = UIColor.red
        } else if voteAverage < 70 {
            rateLabel.textColor = UIColor.orange
        } else {
            rateLabel.textColor = UIColor.green
        }
    }
}
