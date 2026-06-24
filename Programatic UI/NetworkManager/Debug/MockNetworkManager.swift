//
//  MockNetworkManager.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/9/26.
//

final class MockNetworkManager: Sendable, NetworkProtocol{
    
    
    
    static let instance = MockNetworkManager()
    
    private init(){}
    
    func getSongDataFromServer(for url: String) -> [Song]? {
        return getSongsData()
    }
    
    func request<T>(endpoint: APIEndPoints, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        let data: Any
        
        switch endpoint {
        case .movies:
            data = getMoviesData()
        }
        
        if let result = data as? T {
            completion(.success(result))
        } else {
            completion(.failure(.noData))
        }
    }
    
}
