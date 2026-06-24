//
//  MusicTableViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

import UIKit

protocol MusicProtocol{
    func getData(for url: String) -> [Song]?
}

class MusicTableViewController: UIViewController {
    
    var songsData: [Song]?
    var isInternetAvailable = false
    
    private let songsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        songsData = getData(for: "https://google.com")
        //songsData = getSongsData()
        songsTableView.register(SongTableViewCell.self, forCellReuseIdentifier: TableViewCells.musicCell)
        songsTableView.dataSource = self
        
    }

}

extension MusicTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songsData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.musicCell) as? SongTableViewCell
        //cell?.backgroundColor = .white
        let song = songsData?[indexPath.row]
        cell?.configure(with: song)
        
        return cell ?? UITableViewCell()
    }
    
    
}

extension MusicTableViewController{
    func setUpUI(){
        view.addSubview(songsTableView)
        songsTableView.backgroundColor = .black
        NSLayoutConstraint.activate([
            songsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            songsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            songsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            songsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension MusicTableViewController: MusicProtocol{
    func getData(for url: String) -> [Song]? {
        
        if isInternetAvailable{
            return NetworkManager.instance.getSongDataFromServer(for: url)
        }
        
        return MockNetworkManager.instance.getSongDataFromServer(for: url)
    }
        
}
