//
//  MainController.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import Foundation

enum MainController: BaseRouter {
    case getAllUsers
    case getUserAlbum(id: Int)
    case getUserPhotos(albumId: Int)
    
    var path: String {
        switch self {
        case .getAllUsers:
            return "/users"
        case .getUserAlbum:
            return "/albums"
        case .getUserPhotos:
            return "/photos"
        }
    }
    
    var method: String {
        switch self {
        case .getAllUsers:
            return HttpMethod.get.value
        case .getUserAlbum:
            return HttpMethod.get.value
        case .getUserPhotos:
            return HttpMethod.get.value
        }
    }
    
    var queryParameter: [URLQueryItem]? {
        switch self {
        case .getUserAlbum(let id):
            return [.init(name: "userId", value: "\(id)")]
        case .getUserPhotos(let albumId):
            return [
                .init(name: "albumId", value: "\(albumId)")]
        default:
            return nil
        }
    }
    
    var httpBody: Data? {
        switch self {
        default:
            return nil
        }
    }
    
    var httpHeader: [HttpHeader]? {
        switch self {
        default:
            return nil
        }
    }
}
