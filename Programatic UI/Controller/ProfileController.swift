//
//  ProfileController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/5/26.
//
import UIKit

class ProfileController: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        setUpUI()
    }
}

extension ProfileController{
    func setUpUI(){
        
        let cardView = UIView()
        cardView.layer.cornerRadius = 20
        view.addSubview(cardView)
        
        let userName = UIElements.label(text:"Prem", fontSize: 25, fontWeight: .bold)
        let role = UIElements.label(text: "Software Engineer", fontSize: 20, fontWeight: .semibold)
        let followButton = UIElements.button("Follow", titleColor: .white, backgroundColor: .black, action: #selector(moveToMoviesScreen))
        let profileImage = UIElements.imageView()
        let testLabel = UIElements.label(text:"Lorem Ipsum is simply")
        testLabel.numberOfLines = 0
        testLabel.textAlignment = .justified
        
        let testLabel1 = UIElements.label(text:"Lorem Ipsum is simply dummy text of the printing and typesetting industry.")
        testLabel1.numberOfLines = 0
        testLabel1.textAlignment = .justified
        
        let testLabel2 = UIElements.label(text:"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets")
        testLabel2.numberOfLines = 0
        testLabel2.textAlignment = .justified
        
        let stackView = makeStackView([
            makeCard(label: "Posts", count: 50, backgroundColor: .systemPink),
            makeCard(label: "Followers", count: 25, backgroundColor: .systemMint),
            makeCard(label: "Following", count: 99, backgroundColor: .systemOrange)
        ])
        
        cardView.addSubview(profileImage)
        cardView.addSubview(userName)
        cardView.addSubview(role)
        cardView.addSubview(stackView)
        cardView.addSubview(followButton)
        cardView.addSubview(testLabel)
        cardView.addSubview(testLabel1)
        cardView.addSubview(testLabel2)
        
        cardView.backgroundColor = .white
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        // Card View Constraaints
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier : 0.8),
            //cardView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.8)
            
        ])
        
        // Profile Image Constraints
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 80),
            profileImage.heightAnchor.constraint(equalTo: profileImage.widthAnchor),
            profileImage.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            profileImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 24)
        ])
        
        // UserName and RoleCOnstraints
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 12),
            userName.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor),
            role.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 6),
            role.centerXAnchor.constraint(equalTo: userName.centerXAnchor)
        ])
        
        // StackView Constraints
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: role.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: role.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        //FollowButton Constraints
        NSLayoutConstraint.activate([
            followButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            followButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            followButton.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            followButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
            followButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
        //test Label Constraints
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: followButton.centerXAnchor),
            testLabel.topAnchor.constraint(equalTo: followButton.bottomAnchor,constant: 20),
            //testLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -24),
            testLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            testLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
        ])
        
        //test Label1 Constraints
        NSLayoutConstraint.activate([
            testLabel1.centerXAnchor.constraint(equalTo: testLabel.centerXAnchor),
            testLabel1.topAnchor.constraint(equalTo: testLabel.bottomAnchor,constant: 20),
            //testLabel1.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -24),
            testLabel1.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            testLabel1.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
        ])
        
        //test Label2 Constraints
        NSLayoutConstraint.activate([
            testLabel2.centerXAnchor.constraint(equalTo: testLabel1.centerXAnchor),
            testLabel2.topAnchor.constraint(equalTo: testLabel1.bottomAnchor,constant: 20),
            testLabel2.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -24),
            testLabel2.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            testLabel2.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
        ])
        
    }
    
    @objc func moveToMoviesScreen(){
        let destination = MovieDetailsController()
        destination.title = "Movie Screen"
        destination.view.backgroundColor = .systemMint
        navigationController?.pushViewController(destination, animated: true)
    }
    
}


