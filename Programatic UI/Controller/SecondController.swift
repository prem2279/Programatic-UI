//
//  SecondControllerViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/4/26.
//

import UIKit

class SecondController: UIViewController {
    
    private let topLeftButton = UIElements.button("TL")
    private let middleLeftButton = UIElements.button("ML")
    private let bottomLeftButton = UIElements.button("BL")
    
    private let topMiddleButton = UIElements.button("TM")
    private let middleMiddleButton = UIElements.button("Profile", action: #selector(moveToProfileScreen))
    private let bottomMiddleButton = UIElements.button("BM")
    
    private let topRightButton = UIElements.button("TR")
    private let middleRightButton = UIElements.button("MR")
    private let bottomRightButton = UIElements.button("BR")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        setUpUI()
    }
        
}

extension SecondController{
    func setUpUI(){
        let topStack = makeRow([topLeftButton, topMiddleButton, topRightButton])
        let middleStack = makeRow([middleLeftButton, middleMiddleButton, middleRightButton])
        let bottomStack = makeRow([bottomLeftButton, bottomMiddleButton, bottomRightButton])
        
//        let topStack = UIStackView(arrangedSubviews: [topLeftButton, topMiddleButton, topRightButton])
//        topStack.axis = .horizontal
//        topStack.alignment = .fill
//        topStack.distribution = .equalSpacing
        //topStack.spacing = 0
        
//        let middleStack = UIStackView()
//        middleStack.addArrangedSubview(middleLeftButton)
//        middleStack.addArrangedSubview(middleMiddleButton)
//        middleStack.addArrangedSubview(middleRightButton)
//        middleStack.axis = .horizontal
//        middleStack.alignment = .fill
//        middleStack.distribution = .equalSpacing
//        //middleStack.spacing = 0
//        
//        let bottomStack = UIStackView(arrangedSubviews: [bottomLeftButton, bottomMiddleButton, bottomRightButton])
//        bottomStack.axis = .horizontal
//        bottomStack.alignment = .fill
//        bottomStack.distribution = .equalSpacing
        //bottomStack.spacing = 0
        
        let outerStack = UIStackView(arrangedSubviews:[
            topStack, middleStack, bottomStack
        ])
        
        outerStack.axis = .vertical
        outerStack.alignment = .fill
        outerStack.distribution = .equalSpacing
        
        outerStack.translatesAutoresizingMaskIntoConstraints = false
        //outerStack.backgroundColor = .black
        
        view.addSubview(outerStack)
        
        NSLayoutConstraint.activate([
            outerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            outerStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            outerStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            outerStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
        
        [topLeftButton,
         topMiddleButton,
         topRightButton,
         middleLeftButton,
         middleMiddleButton,
         middleRightButton,
         bottomLeftButton,
         bottomMiddleButton,
         bottomRightButton]
        .forEach {
            $0.widthAnchor.constraint(equalToConstant: Constraints.buttonWidth.rawValue).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
//        middleMiddleButton.addTarget(
//            self,
//            action: #selector(moveToProfileScreen),
//            for: .touchUpInside
//        )
        
        
    }
    
    func makeRow(_ buttons: [UIButton]) -> UIStackView {
        let stack =  UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        
        return stack
    }
    
    @objc func moveToProfileScreen(){
        let destination = ProfileController()
        destination.title = "Profile Screen"
        destination.view.backgroundColor = .cyan
        navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
