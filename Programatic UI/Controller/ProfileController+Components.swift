//
//  ProfileController+Components.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/5/26.
//
import UIKit

extension ProfileController{
    
    func makeCard(label: String, count: Int, backgroundColor: UIColor) -> UIView{
        let card = UIView()
        card.translatesAutoresizingMaskIntoConstraints = false
        card.backgroundColor = backgroundColor
        let cardLabel = UIElements.label(text: label, fontSize: 10, fontWeight: .bold)
        let cardCount = UIElements.label(text: String(count), fontSize: 20, fontWeight: .bold)
        card.layer.cornerRadius = 15
        
        card.addSubview(cardLabel)
        card.addSubview(cardCount)
        
        NSLayoutConstraint.activate([
            card.widthAnchor.constraint(equalToConstant: 75),
            cardLabel.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            cardLabel.topAnchor.constraint(equalTo: card.topAnchor, constant: 10),
            cardCount.centerXAnchor.constraint(equalTo: card.centerXAnchor),
            cardCount.bottomAnchor.constraint(equalTo: card.bottomAnchor, constant: -10)

        ])
        return card
    }
    
    func makeStackView(_ cards: [UIView]) -> UIStackView {
        let stack =  UIStackView(arrangedSubviews: cards)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
}
