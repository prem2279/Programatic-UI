//
//  MoviesDashboardController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/23/26.
//

import UIKit

class MoviesDashboardController: UIViewController {
    
    let movieTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .black
        return tableView
    }()
    
    let isInternetAvailable = true
    var movies:[Movie]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTableView.register(MovieTableViewCell.self, forCellReuseIdentifier: TableViewCells.movieCell)
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        //movies = getMovies()
        setUpUI()
        getData(for: APIEndPoints.movies)
        
    }
}

extension MoviesDashboardController{
    func setUpUI(){
        view.addSubview(movieTableView)
        NSLayoutConstraint.activate([
            movieTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            movieTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            movieTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            movieTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    func getData(for url: APIEndPoints) {
        
        let completion: (Result<Product, NetworkError>) -> Void = { [weak self] result in
            switch result{
            case .success(let data):
                print(data)
                DispatchQueue.main.async {
                    self?.movies = data.products
                    self?.movieTableView.reloadData()
                }
            case .failure(let error):
                print(error)
                
            }
        }
        
        if isInternetAvailable{
            NetworkManager.instance.request(endpoint: url, completion: completion)
        }else{
            MockNetworkManager.instance.request(endpoint: url, completion: completion)
        }
    }
}

extension MoviesDashboardController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let movies else {return 0}
        
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.movieCell, for: indexPath) as? MovieTableViewCell
        
        if let movie = movies?[indexPath.row]{
            cell?.configure(with: movie)
        }
        
        return cell ?? UITableViewCell()
    }
}

extension MoviesDashboardController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = MovieDetailsController()
        destination.title = "Movie Details"
        destination.view.backgroundColor = .black
        destination.loadData(movie: movies?[indexPath.row])
        navigationController?.pushViewController(destination, animated: true)
    }
        
}

extension MoviesDashboardController{
    func errorMessage(message: String){
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )

        let action = UIAlertAction(
            title: "OK",
            style: .default
        )
        
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}


