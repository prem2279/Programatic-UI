//
//  NetworkManager.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/9/26.
//

protocol NetworkProtocol{
    func getDataFromServer(for url: String) -> [Song]?
}

final class NetworkManager: NetworkProtocol{
    static let instance = NetworkManager()
    
    private init(){}
    
    func getDataFromServer(for url: String) -> [Song]?{
        // TODO: - Fetching Data from server Goes here, Once done remove Comment
        // logic to get data from server
        // convert the fetched data into data model of type Product
        return nil
    }
}


