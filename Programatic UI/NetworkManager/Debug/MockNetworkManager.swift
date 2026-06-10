//
//  MockNetworkManager.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/9/26.
//

final class MockNetworkManager: Sendable, NetworkProtocol{
    static let instance = MockNetworkManager()
    
    private init(){}
    
    func getDataFromServer(for url: String) -> [Song]?{
        return getSongsData()
    }
}
