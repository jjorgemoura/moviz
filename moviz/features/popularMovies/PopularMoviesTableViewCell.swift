//
//  PopularMoviesTableViewCell.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class PopularMoviesTableViewCell: UITableViewCell, MovieViewModelDelegate {

    static let cellIdentifier: String = "PopularMoviesTableViewCell"

    private var shouldCancelDownload: Bool = false
    private var isDownloadingImage: Bool = false

    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var releaseDateLabel: UILabel!
    @IBOutlet private var rateLabel: UILabel!
    @IBOutlet private var posterImageView: UIImageView!
    @IBOutlet private var filmDescriptionText: UITextView!

    func configure(with film: MovieViewModel) {
        film.delegate = self
        posterImageView.image = nil

        if film.image == nil {
            film.downloadPosterImage()
        } else {
            posterImageView.image = film.image
        }

        titleLabel.text = film.title
        releaseDateLabel.text = film.releaseDate
        rateLabel.attributedText = formatRate(for: film.voteAverage)
        filmDescriptionText.text = film.overview
    }

    func posterImageUpdated(image: UIImage) {
        posterImageView.image = image
    }

    // MARK: - Private methods
    private func formatRate(for voteAverage: Int) -> NSAttributedString {
        let colorAttribute = [NSAttributedStringKey.foregroundColor: formatFilmRateColor(for: voteAverage)]
        let smallFontAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)]
        let bigFontAttribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 17)]

        let percentage = percentageString()
        let voteAverageString = String(format: "%d%@", voteAverage, percentage)

        let attributedVoteAverage = NSMutableAttributedString(string: voteAverageString, attributes: colorAttribute)
        attributedVoteAverage.addAttributes(bigFontAttribute, range: NSRange(location: 0, length: voteAverageString.count - percentage.count))
        attributedVoteAverage.addAttributes(smallFontAttribute, range: NSRange(location: voteAverageString.count - percentage.count, length: percentage.count))

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
