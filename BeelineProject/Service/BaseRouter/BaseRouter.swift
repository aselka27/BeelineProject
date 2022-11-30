//
//  File.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import UIKit

protocol BaseRouter {
    var path: String { get }
    var method: String { get }
    var queryParameter: [URLQueryItem]? { get }
    var httpBody: Data? { get }
    var httpHeader: [HttpHeader]? { get }
}

extension BaseRouter {
    var host: String {
        return "jsonplaceholder.typicode.com"
    }
    var scheme: String {
        return "https"
    }
    func createURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems = queryParameter
        guard let url = urlComponents.url else {
            fatalError(URLError(.unsupportedURL).localizedDescription)
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.httpBody = httpBody
        httpHeader?.forEach { (header) in
            urlRequest.setValue(header.value, forHTTPHeaderField: header.field)
        }
        return urlRequest
    }
}
