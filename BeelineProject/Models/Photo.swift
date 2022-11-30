//
//  Photo.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case albumId, id, title, url, thumbnailUrl
    }
    init(decoder: Decoder) throws {
        let coder = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try coder.decodeIfPresent(Int.self, forKey: .albumId)!
        id = try coder.decodeIfPresent(Int.self, forKey: .id)!
        title = try coder.decodeIfPresent(String.self, forKey: .title)!
        url = try coder.decodeIfPresent(String.self, forKey: .url)!
        thumbnailUrl = try coder.decodeIfPresent(String.self, forKey: .thumbnailUrl)!
    }
}
