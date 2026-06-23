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
    
    var randomColorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .black
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupUI()
        randomColorsCollectionView.dataSource = self
        randomColorsCollectionView.delegate = self
        randomColorsCollectionView.register(RandomColorCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCells.colorCell)
        
    }
}

extension RandomColorCollectionViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCells.colorCell, for: indexPath) as? RandomColorCollectionViewCell
        cell?.label.text = "Cell \(indexPath.row)"
        cell?.backgroundColor = .random
        
        return cell ?? UICollectionViewCell()
    }
}

extension RandomColorCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(indexPath.row < 10 ){
            return CGSize(width: view.frame.width/5, height: 100)
        }
        return CGSize(width: 100, height: 100)
    }
}

extension RandomColorCollectionViewController: RandomColorProtocol{
    func setupUI(){
        view.addSubview(randomColorsCollectionView)
        pinAllCorners(child: randomColorsCollectionView, parent: view, leading: 20, trailing: -20)
    }
}
