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

        titleLabel.text = film.title
        releaseDateLabel.text = film.releaseDate
        rateLabel.attributedText = formatRate(for: film.voteAverage)
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

    private func formatRate(for voteAverage: Int) -> NSAttributedString {
        let colorAttribute = [NSAttributedStringKey.foregroundColor: formatFilmRateColor(for: voteAverage)]
        let smallFontAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
        let bigFontAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)]

        let percentage = percentageString()
        let voteAverageString = String(format: "%d%@", voteAverage, percentage)

        let attributedVoteAverage = NSMutableAttributedString(string: voteAverageString, attributes: colorAttribute)
        attributedVoteAverage.addAttributes(bigFontAttribute, range: NSMakeRange(0, voteAverageString.count - percentage.count))
        attributedVoteAverage.addAttributes(smallFontAttribute, range: NSMakeRange(voteAverageString.count - percentage.count, percentage.count))

        return attributedVoteAverage
    }

    private func formatFilmRateColor(for voteAverage: Int) -> UIColor {
        if voteAverage < 40 {
            return .red
        } else if voteAverage < 70 {
            return .orange
        } else {
            return .green
        }
    }

    private func percentageString() -> String {
        return "%"
    }
}
