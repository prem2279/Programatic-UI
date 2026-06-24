//
//  CarsCollectionViewController.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/10/26.
//

import UIKit

protocol CarsProtocol{
    func setupUI()
}

class CarsCollectionViewController: UIViewController{
    let icons = [Catogory( name: "Misc", icons: [
        "globe",
        "location",
        "location.fill",
        "wifi",
        "wifi.slash",
        "battery.100",
        "bolt",
        "bolt.fill",
        "flame",
        "leaf"
    ]),
     Catogory(name: "Folder", icons: [
        "folder",
        "folder.fill",
        "doc",
        "doc.fill",
        "doc.text",
        "doc.text.fill",
        "paperclip",
        "tray",
        "tray.fill",
        "archivebox"
     ])]
    let carsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        //layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupUI()
        
        carsCollectionView.register(CarsCollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCells.carCell)
        carsCollectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "header"
        )
        
        carsCollectionView.delegate = self
        carsCollectionView.dataSource = self
    }
}

extension CarsCollectionViewController: CarsProtocol{
    func setupUI(){
        view.addSubview(carsCollectionView)
        
        NSLayoutConstraint.activate([
            carsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            carsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            carsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
}

extension CarsCollectionViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        icons[section].icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCells.carCell, for: indexPath) as! CarsCollectionViewCell
        cell.imageView.image = UIImage(systemName: icons[indexPath.section].icons[indexPath.row])
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {

        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "header",
            for: indexPath
        )
        
        let label: UILabel = {
            let label = UILabel()
            label.text = icons[indexPath.section].name
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textColor = .white
            return label
        }()
        label.text = icons[indexPath.section].name
        //label.frame = CGRect(x: 16, y: 5, width: 200, height: 30)

        header.addSubview(label)
        pinAllCorners(child: label, parent: header, leading: 0)
        //header.backgroundColor = .lightGray
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: carsCollectionView.frame.width, height: 40)
    }
    
}

extension CarsCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Tapped cell at \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
//        var size = CGSize()
//        size.width =
//        size.height = collectionView.frame.width/5
//        return size
        CGSize(width:collectionView.frame.width/5-10, height:collectionView.frame.width/5-10)
    }
    
}




