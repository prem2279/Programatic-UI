//
//  RandomColorCollectionViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/10/26.
//
import UIKit

protocol RandomColorProtocol{
    func setupUI()
}

class RandomColorCollectionViewController: UIViewController{
    
    var carsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupUI()
        carsCollectionView.dataSource = self
        carsCollectionView.delegate = self
        carsCollectionView.register(RandomColorCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCells.carCell)
        
    }
}

extension RandomColorCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCells.carCell, for: indexPath) as? RandomColorCollectionViewCell
        cell?.label.text = "Cell \(indexPath.row)"
        cell?.backgroundColor = .random
        
        return cell ?? UICollectionViewCell()
    }
    
    
    
    
}

extension RandomColorCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/5, height: 100)
    }
    
    
}

extension RandomColorCollectionViewController: RandomColorProtocol{
    func setupUI(){
        view.addSubview(carsCollectionView)
        pinAllCorners(child: carsCollectionView, parent: view, leading: 20, trailing: -20)
    }
}
