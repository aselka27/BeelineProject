//
//  ViewController.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: MainViewModelType
    
    // MARK: - Init
    init(viewModel: MainViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Views
    private lazy var usersPickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.layer.cornerRadius = 16
        return pickerView 
    }()
    
     lazy var albumsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setLayout())
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        return collectionView
    }()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUsers()
        usersPickerView.selectRow(0, inComponent: 0, animated: false)
        fetchAlbums()
    }
    
    // MARK: - ConfigureUI
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(usersPickerView)
        view.addSubview(albumsCollectionView)
        setConstraints()
    }
    
    private func setConstraints() {
        usersPickerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(25)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        albumsCollectionView.snp.makeConstraints {
            $0.top.equalTo(usersPickerView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(25)
        }
    }
    
    // MARK: - Fetch Data
    private func fetchUsers() {
        viewModel.fetchUsersData { [weak self] in
            DispatchQueue.main.async {
                self?.usersPickerView.reloadComponent(0)
            }
        }
    }
    private func fetchAlbums() {
        viewModel.fetchAlbumsData(with: 1) { [weak self] in
            DispatchQueue.main.async {
                self?.albumsCollectionView.reloadData()
            }
        }
    }
 
    // MARK: - Set collectionView layout
    private func setLayout() -> UICollectionViewCompositionalLayout  {
        let layout = UICollectionViewCompositionalLayout{  sectionIndex, env in
            let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
            item.contentInsets = .init(top:0, leading: 0, bottom: 0, trailing: 8)
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.3)
                ),
                subitems: [item]
            )
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top:10, leading: 16, bottom: 14, trailing: 16)
            section.interGroupSpacing = 15
            return section
        }
        return layout
    }
}

