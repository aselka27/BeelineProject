//
//  Album.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import Foundation

struct Album: Codable {
    let userId: Int64
    let id: Int
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case userId, id, title
    }
    
    init(decoder: Decoder) throws {
        let coder = try decoder.container(keyedBy: CodingKeys.self)
        userId = try coder.decodeIfPresent(Int64.self, forKey: .userId)!
        id = try coder.decodeIfPresent(Int.self, forKey: .id)!
        title = try coder.decodeIfPresent(String.self, forKey: .title)!
    }
}
