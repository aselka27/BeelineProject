//
//  GalleryViewController.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import UIKit
import SnapKit

class GalleryViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: GalleryViewModelType
    
    // MARK: - Init
    init(viewModel: GalleryViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private lazy var imagesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchData()
    }
    
    // MARK: - ConfigureUI
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(imagesCollectionView)
        imagesCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Fetch data
    private func fetchData() {
        viewModel.fetchPhotos { [weak self] in
                self?.imagesCollectionView.reloadData()
        }
    }
}
    
    // MARK: - CollectionView Delegate & DataSource
extension GalleryViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfPhotos
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        guard let model = viewModel.photos?[indexPath.item] else { return UICollectionViewCell() }
        cell.configure(with: model)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = collectionView.frame.width/4 - 1
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PhotoViewController()
        guard let url = viewModel.photos?[indexPath.item].url else { return }
        vc.configureImageView(with: url)
        vc.modalPresentationStyle = .overCurrentContext
        navigationController?.present(vc, animated: true)
    }
}
