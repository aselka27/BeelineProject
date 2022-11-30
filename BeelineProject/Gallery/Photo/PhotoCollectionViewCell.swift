//
//  PhotoCollectionViewCell.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import UIKit
import SnapKit
import Kingfisher

class PhotoCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "PhotoCollectionViewCell"
    
   // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        return imageView
    }()
  
    // MARK: - ConfigureUI
    private func configureUI() {
        contentView.addSubview(albumImageView)
        albumImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    func configure(with model: Photo) {
        self.albumImageView.kf.setImage(with: model.url.getURL())
    }
}
