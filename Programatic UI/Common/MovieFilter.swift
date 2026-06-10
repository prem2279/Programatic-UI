//
//  MovieFilter.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

struct Movies: Equatable {
    let title: String
    let genre: String
    let rating: Double
    let year: Int
}
 
struct MoviesFilter {
    func filterByGenre(_ genre: String, from movies: [Movies]) -> [Movies] {
        return movies.filter { $0.genre == genre }
    }
 
    func filterByMinRating(_ rating: Double, from movies: [Movies]) -> [Movies] {
        return movies.filter { $0.rating >= rating }
    }
 
    func filterByYear(_ year: Int, from movies: [Movies]) -> [Movies] {
        return movies.filter { $0.year == year }
    }
}
