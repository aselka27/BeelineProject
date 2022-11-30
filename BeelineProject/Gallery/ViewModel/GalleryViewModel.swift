//
//  GalleryViewModel.swift
//  BeelineProject
//
//  Created by саргашкаева on 30.11.2022.
//

import Foundation


protocol GalleryViewModelType {
    var photos: [Photo]? { get set }
    var numberOfPhotos: Int { get }
    func fetchPhotos(completion: (() -> ())?)
    var id: Int { get set }
}

class GalleryViewModel: GalleryViewModelType {
    
    var photos: [Photo]?
    var id: Int = 0
    var numberOfPhotos: Int {
        guard let numberOfPhotos = photos?.count else {
            return 0
        }
        return numberOfPhotos
    }
    func fetchPhotos(completion: (() -> ())?) {
        NetworkService.shared.decodeData(urlRequest: MainController.getUserPhotos(albumId: id).createURLRequest(), ofType: [Photo].self) { [weak self] result in
            self?.photos = result
            completion?()
        }
    }
}
