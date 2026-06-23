//
//  NetworkManager.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/9/26.
//

import UIKit

protocol NetworkProtocol{
    func getSongDataFromServer(for url: String) -> [Song]?
    func getMovieDataFromServer(for url: String, completion: @escaping([Movie]) -> ())
    
}

final class NetworkManager: NetworkProtocol{
    
    static let instance = NetworkManager()
    
    private init(){}
    
    func getSongDataFromServer(for url: String) -> [Song]?{
        // TODO: - Fetching Data from server Goes here, Once done remove Comment
        // logic to get data from server
        // convert the fetched data into data model of type Product
        return nil
    }
    
    func getMovieDataFromServer(for url: String, completion: @escaping([Movie]) -> ()) {
       
        guard let serverURL = URL(string: url) else {
            print("Server URL is Invalid")
            return
        }
        
        let urlRequest = URLRequest(url: serverURL)
        URLSession.shared.dataTask(with: urlRequest) {
            data, response, error in
            
            if error != nil {
                print("Error Occoured, \(error!.localizedDescription)")
            }
            
            guard let data = data else {
               completion([])
               return
            }
            
            //print("response: ", response ?? "")
           
            do {
                let decoded = try JSONDecoder().decode(Product.self, from: data)
                DispatchQueue.main.async{
                   completion(decoded.products)
                }
               
               
            } catch {
                print("Decoding error: \(error)")
                completion([])
            }
            
         }.resume()
        
        
    }
}




