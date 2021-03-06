//
//  PopularMoviesViewController.swift
//  moviz
//
//  Created by Jorge Moura on 26/03/2018.
//  Copyright © 2018 Jorge Moura. All rights reserved.
//

import RxSwift
import UIKit

protocol PopularMoviesViewControllerDelegate: class {
    func didSelect(_ item: MovieViewModel)
}

class PopularMoviesViewController: UITableViewController {

    private let bag: DisposeBag = DisposeBag()
    var viewModel: PopularMoviesViewModel?
    weak var delegate: PopularMoviesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tableView = view as? UITableView {
            let cellNibType = String(describing: PopularMoviesTableViewCell.self)
            tableView.register(UINib(nibName: cellNibType, bundle: nil), forCellReuseIdentifier: PopularMoviesTableViewCell.cellIdentifier)
        }

        title = viewModel?.title
        configureBindings()
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
            cell.configure(with: item)
        }
        return cell
    }

    // MARK: - UITableViewDelegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = viewModel?.popularMovies[indexPath.row] {
            delegate?.didSelect(item)
        }
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel?.prepareDataFor(index: indexPath.row)
    }

    private func configureBindings() {
        viewModel?.errorObservable
            .asObservable()
            .subscribe(onNext: { errorMessage in
                self.presentAlert(with: errorMessage)
            }, onError: { errorX in
                print(errorX)
            })
        .disposed(by: bag)
    }
}

extension PopularMoviesViewController: PopularMoviesViewModelDelegate {
    func dataUpdated() {
        tableView.reloadData()
    }
}
