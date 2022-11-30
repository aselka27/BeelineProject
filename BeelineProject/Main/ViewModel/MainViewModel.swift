//
//  MainViewModel.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import Foundation


protocol MainViewModelType {
    var users: [User]? { get set }
    var numberOfComponents: Int { get }
    func fetchUsersData(completion: (()->())?)
    var albums: [Album]? { get set }
    func fetchAlbumsData(with id: Int, completion: (()->())?)
    var numberOfAlbums: Int { get }
}

class MainViewModel: MainViewModelType {
    var users: [User]?
    var albums: [Album]?
    
    
    var numberOfComponents: Int {
        guard let numberOfComponents = users?.count else {
            return 0
        }
        return numberOfComponents
    }
    var numberOfAlbums: Int {
        guard let numberOfAlbums = albums?.count else {
            return 0
        }
        return numberOfAlbums
    }
    
    func fetchUsersData(completion: (()->())?) {
        NetworkService.shared.decodeData(urlRequest: MainController.getAllUsers.createURLRequest(), ofType: [User].self) { [weak self] result in
            self?.users = result
            completion?()
        }
    }
    func fetchAlbumsData(with id: Int, completion: (()->())?) {
        NetworkService.shared.decodeData(urlRequest: MainController.getUserAlbum(id: id).createURLRequest(), ofType: [Album].self) { [weak self] result in
            self?.albums = result
            completion?()
        }
    }
}
