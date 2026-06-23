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
        getData(for: "https://dummyjson.com/products/category/smartphones")
        
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
    
    func getData(for url: String) {
        
        let completion: ([Movie]) -> () = { [weak self] movies in
                DispatchQueue.main.async {
                    //print("called")
                    self?.movies = movies
                    self?.movieTableView.reloadData()
                }
            }
        
        if isInternetAvailable{
            NetworkManager.instance.getMovieDataFromServer(for: url, completion: completion)
        }else{
            MockNetworkManager.instance.getMovieDataFromServer(for: url, completion: completion )
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


