//
//  ViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/4/26.
//

import UIKit

class FirstController: UIViewController {
    
    private let topLeftButton = UIElements.button("Color", action: #selector(moveToRandomColorsScreen))
    private let middleLeftButton = UIElements.button("Cars", action: #selector(moveToCarsScreen))
    private let bottomLeftButton = UIElements.button("Spotify", action: #selector(moveToSpotifyScreen))
    
    private let topMiddleButton = UIElements.button("Profile", action: #selector(moveToProfileScreen))
    private let middleMiddleButton = UIElements.button("Second",action: #selector(moveToSecondScreen))
    private let bottomMiddleButton = UIElements.button("Movie", action: #selector(moveToMoviesScreen))
    
    private let topRightButton = UIElements.button("Download", action: #selector(moveToDownloadScreen))
    private let middleRightButton = UIElements.button("MR")
    private let bottomRightButton = UIElements.button("BR")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        title = "First Screen"
        setUpUI()
    }
}

extension FirstController{
    
    func setUpUI(){
        
        view.addSubview(topLeftButton)
        view.addSubview(middleLeftButton)
        view.addSubview(bottomLeftButton)
        view.addSubview(topMiddleButton)
        view.addSubview(middleMiddleButton)
        view.addSubview(bottomMiddleButton)
        view.addSubview(topRightButton)
        view.addSubview(middleRightButton)
        view.addSubview(bottomRightButton)
        
        NSLayoutConstraint.activate([
            middleMiddleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleMiddleButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            middleMiddleButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            //middleLeftButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            middleLeftButton.centerYAnchor.constraint(equalTo: middleMiddleButton.centerYAnchor),
            middleLeftButton.rightAnchor.constraint(equalTo: middleMiddleButton.leftAnchor, constant: -50),
            middleLeftButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            middleRightButton.centerYAnchor.constraint(equalTo: middleMiddleButton.centerYAnchor),
            middleRightButton.leftAnchor.constraint(equalTo: middleMiddleButton.rightAnchor, constant: 50),
            middleRightButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        
        NSLayoutConstraint.activate([
            topMiddleButton.centerXAnchor.constraint(equalTo: middleMiddleButton.centerXAnchor),
            topMiddleButton.bottomAnchor.constraint(equalTo: middleMiddleButton.topAnchor, constant: -50),
            topMiddleButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            topLeftButton.centerXAnchor.constraint(equalTo: middleLeftButton.centerXAnchor),
            //topLeftButton.rightAnchor.constraint(equalTo: topMiddleButton.leftAnchor, constant: -75),
            topLeftButton.bottomAnchor.constraint(equalTo: middleLeftButton.topAnchor, constant: -50),
            topLeftButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            topRightButton.centerXAnchor.constraint(equalTo: middleRightButton.centerXAnchor),
            //topRightButton.leftAnchor.constraint(equalTo: topMiddleButton.rightAnchor, constant: 75),
            topRightButton.bottomAnchor.constraint(equalTo: middleRightButton.topAnchor, constant: -50),
            topRightButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            bottomMiddleButton.centerXAnchor.constraint(equalTo: middleMiddleButton.centerXAnchor),
            bottomMiddleButton.topAnchor.constraint(equalTo: middleMiddleButton.bottomAnchor, constant: 50),
            bottomMiddleButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            bottomLeftButton.centerYAnchor.constraint(equalTo: bottomMiddleButton.centerYAnchor),
            bottomLeftButton.rightAnchor.constraint(equalTo: bottomMiddleButton.leftAnchor, constant: -50),
            bottomLeftButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            bottomRightButton.centerYAnchor.constraint(equalTo: bottomMiddleButton.centerYAnchor),
            bottomRightButton.leftAnchor.constraint(equalTo: bottomMiddleButton.rightAnchor, constant: 50),
            bottomRightButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        
        //middleMiddleButton.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        
        
    }
}

extension FirstController{
    
    
    @objc func moveToSecondScreen(){
        let nextScreen = SecondController()
        nextScreen.title = "Second Screen"
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func moveToMoviesScreen(){
        let destination = MoviesDashboardController()
        destination.title = "Movies Dashboard"
        destination.view.backgroundColor = .black
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @objc func moveToProfileScreen(){
        let destination = ProfileController()
        destination.title = "Profile Screen"
        destination.view.backgroundColor = .cyan
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @objc func moveToSpotifyScreen(){
        let nextScreen = SpotifyTableViewController()
        nextScreen.title = "Spotify"
        nextScreen.view.backgroundColor = .black
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func moveToRandomColorsScreen(){
        let nextScreen = RandomColorCollectionViewController()
        nextScreen.title = "Random Color Cells"
        nextScreen.view.backgroundColor = .black
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    @objc func moveToCarsScreen(){
        let nextScreen = CarsCollectionViewController()
        nextScreen.title = "Cars"
        nextScreen.view.backgroundColor = .black
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    
    @objc func moveToDownloadScreen(){
        let nextScreen = DownloadViewController()
        nextScreen.title = "Mini Downloader"
        nextScreen.view.backgroundColor = .black
        navigationController?.pushViewController(nextScreen, animated: true)
    }
}


