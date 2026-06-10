//
//  MovieFilterTestCases.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

import XCTest
@testable import Programatic_UI

final class MovieFilterTestCases: XCTestCase{
    
    var movieFilter: MoviesFilter?
    var movies: [Movies]!
    
    override func setUpWithError() throws{
        movieFilter = MoviesFilter()
        movies = [
                    Movies(title: "Inception", genre: "Sci-Fi", rating: 8.8, year: 2010),
                    Movies(title: "Interstellar", genre: "Sci-Fi", rating: 8.6, year: 2014),
                    Movies(title: "Titanic", genre: "Romance", rating: 7.9, year: 1997),
                    Movies(title: "The Dark Knight", genre: "Action", rating: 9.0, year: 2008)
                ]
    }
    
    override func tearDownWithError() throws{
        movieFilter = nil
    }
}

//MARK: - Test Cases for Filter By Genere

extension MovieFilterTestCases{
    
    func testFilterByGenere(){
        let res = movieFilter?.filterByGenre("Action",from: movies)
        XCTAssertEqual(res?.count,1)
    }
    
    func testFilterByGenereNoMatch(){
        let res = movieFilter?.filterByGenre("Actio",from: movies)
        XCTAssertEqual(res?.count,0)
    }

}

//MARK: - Test Cases for Filter By Rating

extension MovieFilterTestCases{
    
    func testMinRatingAboveThreshold(){
        let res = movieFilter?.filterByMinRating(8.0,from: movies)
        XCTAssertEqual(res?.count,3)
    }
    
    func testZeroRating(){
        let res = movieFilter?.filterByMinRating(0.0,from: movies)
        XCTAssertEqual(res?.count,4)
    }
    
}

//MARK: - Test Cases for Filter By Year

extension MovieFilterTestCases{
    
    func testFilterByYear(){
        let res = movieFilter?.filterByYear(2010,from: movies)
        XCTAssertEqual(res?.count,1)
    }
    
    func testFilterByYearNoMatch(){
        let res = movieFilter?.filterByYear(2011,from: movies)
        XCTAssertEqual(res?.count,0)
    }
    
    
}
