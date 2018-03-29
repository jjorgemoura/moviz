//
//  PopularMoviesViewController.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

protocol PopularMoviesViewControllerDelegate: class {
    func didSelect(_ item: FilmViewModel)
}

class PopularMoviesViewController: UITableViewController {

    var viewModel: PopularMoviesViewModel?
    weak var delegate: PopularMoviesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tableView = view as? UITableView {
            let cellNibType = String(describing: PopularMoviesTableViewCell.self)
            tableView.register(UINib(nibName: cellNibType, bundle: nil), forCellReuseIdentifier: PopularMoviesTableViewCell.cellIdentifier)
        }

        title = viewModel?.title
        viewModel?.loadPopularMovies()
    }

    // MARK: - UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.popularMovies.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesTableViewCell.cellIdentifier, for: indexPath) as? PopularMoviesTableViewCell else {
            return UITableViewCell()
        }

        if let item = viewModel?.popularMovies[indexPath.row] {
            if item.image == nil {
//                viewModel?.loadPosterImage(with: item.posterPath)
            }
            cell.configure(with: item)
        }
        return cell
    }

    // MARK: - UITableViewDelegate Methods

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("JM: XXXX -> (\(indexPath.row))")
        if let item = viewModel?.popularMovies[indexPath.row] {
            delegate?.didSelect(item)
        }
    }
}

extension PopularMoviesViewController: PopularMoviesViewModelDelegate {
    func dataUpdated() {
        tableView.reloadData()
    }
}
