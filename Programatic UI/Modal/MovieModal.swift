//
//  MovieModal.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/5/26.
//

import UIKit

struct Movie: Decodable {
    let title: String
    let genre: String
    let rating: Double
    let year: Double
    let overview: String
    let director: String
    let duration: String?
    let images: [String]?
    //let bannerColor: UIColor?
    
    enum CodingKeys: String, CodingKey{
        case title
        case genre = "category"
        case rating
        case year = "price"
        case overview = "description"
        case director = "brand"
        case duration
        case images
    }
}

struct Product: Decodable {
    let products: [Movie]
}
 

