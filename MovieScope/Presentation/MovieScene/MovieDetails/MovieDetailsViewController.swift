//
//  MovieDetailsViewController.swift
//  MovieScope
//
//  Created by Lena Soroka on 02.02.2025.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var viewModel: MovieDetailsViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure(with: viewModel?.movie)
    }
    
    // MARK: - UI Components
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.autoresizingMask = .flexibleHeight
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.layoutSubviews()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.frame.size
        
        [
            movieImageView,
            titleLabel,
            ratingLabel,
            overviewLabel
        ]
            .forEach { contentView.addSubview($0) }
        
        setupConstraints()
    }
        
    private func setupConstraints() {
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        heightConstraint.priority = .defaultLow
        
        
        NSLayoutConstraint.activate([
            // Scroll View
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            
            // Content View
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
           //heightConstraint
        ])
        
        NSLayoutConstraint.activate([
            // Movie Image
            movieImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            movieImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            movieImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
//            // Title Label
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
            
//            // Rating Label
            ratingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            ratingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ratingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),

//            // Description Label
            overviewLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            overviewLabel.bottomAnchor.constraint(greaterThanOrEqualTo: contentView.bottomAnchor, constant: 20)
        ])
    }
    
    // MARK: - Configure UI with Movie Data
    private func configure(with movie: Movie?) {
        guard let movie else { return }
        // TODO: - loading for the image
        self.movieImageView.image = .library
        self.titleLabel.text = movie.title
        self.ratingLabel.text = "⭐️ \(movie.voteAverage)/10"
        self.overviewLabel.text = movie.overview
    }
}
