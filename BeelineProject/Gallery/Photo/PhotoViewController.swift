//
//  PhotoViewController.swift
//  BeelineProject
//
//  Created by саргашкаева on 30.11.2022.
//

import UIKit
import Kingfisher

class PhotoViewController: UIViewController {
    
    // MARK: - Views
    fileprivate let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "kyrgyzstan")
        return imageView
    }()
    fileprivate lazy var closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysOriginal).withTintColor(.white), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        navigationController?.navigationItem.backButtonDisplayMode = .minimal

    }
    
    // MARK: - ConfigureUI
    private func configureUI() {
        view.backgroundColor = .black
        view.addSubview(photoImageView)
        view.addSubview(closeButton)
        setConstraints()
      
      

    }
    private func setConstraints() {
        photoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
        closeButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(25)
        }
        
    }
    // MARK: - Helpers
    @objc func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    func configureImageView(with urlString: String) {
        self.photoImageView.kf.setImage(with: urlString.getURL())
    }
    

}


