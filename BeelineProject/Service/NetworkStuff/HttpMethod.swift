//
//  HttpMethod.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import Foundation


enum HttpMethod {
    case get
    case post
    case put
    case delete
    
    var value: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .delete:
            return "DELETE"
        }
    }
}
