//
//  CarCell.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/10/26.
//

import UIKit

class CarsCollectionViewCell: UICollectionViewCell{
    let imageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CarsCollectionViewCell{
    func setupUI() {
        self.addSubview(imageView)
        pinAllCorners(child: imageView,parent: self)
    }
}
