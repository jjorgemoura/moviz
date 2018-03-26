//
//  PopularMoviesViewController.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import UIKit

class PopularMoviesViewController: UITableViewController {

    var viewModel: PopularMoviesViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tableView = view as? UITableView {
            tableView.register(PopularMoviesTableViewCell.self, forCellReuseIdentifier: PopularMoviesTableViewCell.cellIdentifier)
        }

        viewModel?.loadPopularMovies()
    }

    // MARK: - UITableViewDataSource Methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.popularMovies.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesTableViewCell.cellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel?.popularMovies[indexPath.row]
        return cell
    }

    // MARK: - UITableViewDelegate Methods
}
