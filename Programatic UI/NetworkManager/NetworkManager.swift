//
//  NetworkManager.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/9/26.
//

import UIKit

protocol NetworkProtocol: AnyObject{
    func request<T: Decodable>(
        endpoint:APIEndPoints,
        completion: @escaping (Result<T, NetworkError>) -> Void
    )
    
}

final class NetworkManager: NetworkProtocol, Sendable{
    
    static let instance = NetworkManager()
    
    private init(){}
    
    func getSongDataFromServer(for url: String) -> [Song]?{
        // TODO: - Fetching Data from server Goes here, Once done remove Comment
        return nil
    }
    
    func request<T: Decodable>(
        endpoint:APIEndPoints,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ){
        
        guard let serverURL = URL(string: endpoint.rawValue) else{
            print("Invalid URL")
            completion(.failure(.invalidURL))
            return
        }
        
        let urlRequest = URLRequest(url: serverURL)
        
        URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            if error != nil {
                print("Error occured \(error!.localizedDescription)")
                completion(.failure(.serverError))
                return
            }
            
            guard let data else {
                print("No data from the server")
                completion(.failure(.noData))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            }catch{
                print("Error Occoured")
                completion(.failure(.decodingError))
            }
            
        }.resume()
    }
    
}




