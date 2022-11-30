//
//  AlbumCollectionViewCell.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import UIKit
import SnapKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "AlbumCollectionViewCell"
    
   // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 16
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "album")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    private let albumTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textAlignment = .left
        label.text = "non esse culpa molestiae omnis sed optio"
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - ConfigureUI
    private func configureUI() {
        contentView.addSubview(albumImageView)
        albumImageView.addSubview(albumTitleLabel)
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        albumTitleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(3)
            $0.top.equalToSuperview().offset(10)
        }
    }
    func configure(with model: Album) {
        albumTitleLabel.text = model.title
    }
}
