//
//  MoviesViewController.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import UIKit

class MoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Alertable {
    var viewModel: MoviesViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureMoviesTableView()
        configureActions()
    }
    
    // MARK: - UI Elements
    private let moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Bind View Model Actions
    private func configureActions() {
        viewModel?.moviesViewModelActions.reloadMoviesTableView = { [weak self] in
            self?.reloadMoviesTableView()
        }
        viewModel?.moviesViewModelActions.showError = { [weak self] error in
            self?.showAlert(message: error)
        }
    }
    
    // MARK: - Utility Methods
    private func setupViews() {
        view.addSubview(moviesTableView)
        setupConstaints()
    }
    
    private func setupConstaints() {
        moviesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    // MARK: - Table View Configuratins
    private func configureMoviesTableView() {
        moviesTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.cellID)
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
    }
    
    private func reloadMoviesTableView() {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movie = viewModel?.movies[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.cellID, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(title: movie.title, image: .library)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = viewModel?.movies[indexPath.row] else { return }
        viewModel?.goToMovieDetails(movie)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
