//
//  PlaceholderView.swift
//  MovieScope
//
//  Created by Lena Soroka on 06.02.2025.
//

import UIKit

class PlaceholderView: UIView {
    let imageView: UIImageView = {
        let image = UIImage(systemName: "questionmark.bubble")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .blue
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Placeholder.text
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupInitialUI() {
        [imageView, titleLabel].forEach { addSubview($0) }
        
        NSLayoutConstraint.activate([
            // ImageView
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            
            // TitleLabel
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setLabel(text: String) {
        titleLabel.text = text
    }
}
