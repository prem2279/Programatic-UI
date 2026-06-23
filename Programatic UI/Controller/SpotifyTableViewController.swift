//
//  SpotifyTableViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

import UIKit

protocol SpotifyProtocol{
    func getData(for url: String) -> [Song]?
}

class SpotifyTableViewController: UIViewController {
    
    var songsData: [Song]?
    var isInternetAvailable = false
    
    private let spotifyTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        songsData = getData(for: "https://google.com")
        //songsData = getSongsData()
        spotifyTableView.register(SpotifyTableViewCell.self, forCellReuseIdentifier: TableViewCells.spotifyCell)
        spotifyTableView.dataSource = self
        
    }

}

extension SpotifyTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.spotifyCell) as? SpotifyTableViewCell
        //cell?.backgroundColor = .white
        let song = songsData?[indexPath.row]
        cell?.configure(with: song)
        
        return cell ?? UITableViewCell()
    }
    
    
}

extension SpotifyTableViewController{
    func setUpUI(){
        view.addSubview(spotifyTableView)
        spotifyTableView.backgroundColor = .black
        NSLayoutConstraint.activate([
            spotifyTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            spotifyTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            spotifyTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            spotifyTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension SpotifyTableViewController: SpotifyProtocol{
    func getData(for url: String) -> [Song]? {
        
        if isInternetAvailable{
            return NetworkManager.instance.getSongDataFromServer(for: url)
        }
        
        return MockNetworkManager.instance.getSongDataFromServer(for: url)
    }
        
}
