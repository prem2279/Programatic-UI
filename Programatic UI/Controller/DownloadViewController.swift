//
//  DownloadViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/11/26.
//
import UIKit

protocol DownloadProtocol{
    func setupUI()
    func download()
}

class DownloadViewController: UIViewController{
    let label: UILabel = {
        let label = UILabel()
        label.text = "No Action"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Click Me", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupUI()
    }
}

extension DownloadViewController: DownloadProtocol{
    func setupUI() {
        view.addSubview(label)
        view.addSubview(button)
        
        centerX(child: label, parent: view)
        centerX(child: button, parent: view)
        pinTopCorner(child: label, parent: view, top: 200)
        pinTopToBottomCorner(child: button, parent: label, top: 25)
        
        button.addTarget(self, action: #selector(download), for: .touchUpInside)

    }
    
    @objc func download(){
        DispatchQueue.global().async{
            sleep(2)
            //Call Network Manager
            DispatchQueue.main.async{
                self.label.text = "Finished"
            }
        }
        
        self.label.text = "Loading...."
    }
}
