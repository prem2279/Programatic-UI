//
//  RandomColorCell.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/10/26.
//

import UIKit

class RandomColorCollectionViewCell: UICollectionViewCell{
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .white
        return label
    }()
    
    override init (frame: CGRect){
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension RandomColorCollectionViewCell: RandomColorProtocol{
    func setupUI() {
        self.addSubview(label)
        centerX(child: label, parent: self)
        centerY(child: label, parent: self)
    }
}
