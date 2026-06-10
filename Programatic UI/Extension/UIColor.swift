//
//  UIColor.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/10/26.
//
import UIKit

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: CGFloat.random(in: 0...1),
            green: CGFloat.random(in: 0...1),
            blue: CGFloat.random(in: 0...1),
            alpha: 1.0
        )
    }
}
