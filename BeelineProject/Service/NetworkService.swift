//
//  NetworkService.swift
//  BeelineProject
//
//  Created by саргашкаева on 29.11.2022.
//

import Foundation


class NetworkService {
    
    static let shared = NetworkService()
    private init() {}
    
    private func getRequest ( urlRequest: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error occured")
                    completion(.failure(error))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
        }.resume()
    }
    
    func decodeData<T: Codable> (urlRequest: URLRequest, ofType: T.Type, response: @escaping (T)->Void) {
        getRequest(urlRequest: urlRequest) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    response(decodedData)
                    print(decodedData)
                } catch let jsonError{
                    print("Parsing error", jsonError)
                }
            case .failure(let error):
                print("Error has occured\(error.localizedDescription)")
            }
        }
    }
}
