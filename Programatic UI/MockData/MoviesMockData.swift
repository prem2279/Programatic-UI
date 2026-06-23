//
//  MoviesMockData.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/23/26.
//
import UIKit

func getMoviesData()->[Movie]{
    return [

        Movie(
            title: "Inception",
            genre: ["Sci-Fi", "Thriller", "Action"].prefix(2).joined(separator: " • "),
            rating: 8.8,
            year: 2010,
            overview: "A thief who enters dreams to steal secrets is given a final mission to implant an idea.",
            director: "Christopher Nolan",
            duration: "2h 28m",
            //bannerColor: .systemIndigo
        ),

        Movie(
            title: "Interstellar",
            genre: ["Sci-Fi", "Drama", "Adventure"].prefix(2).joined(separator: " • "),
            rating: 8.6,
            year: 2014,
            overview: "Explorers travel through a wormhole to find a new home for humanity.",
            director: "Christopher Nolan",
            duration: "2h 49m",
            //bannerColor: .systemBlue
        ),

        Movie(
            title: "The Dark Knight",
            genre: ["Action", "Crime", "Drama"].prefix(2).joined(separator: " • "),
            rating: 9.0,
            year: 2008,
            overview: "Batman faces the Joker, a criminal mastermind who creates chaos in Gotham.",
            director: "Christopher Nolan",
            duration: "2h 32m",
            //bannerColor: .darkGray
        ),

        Movie(
            title: "Avengers: Endgame",
            genre: ["Action", "Adventure", "Sci-Fi"].prefix(2).joined(separator: " • "),
            rating: 8.4,
            year: 2019,
            overview: "The Avengers assemble to undo Thanos' destruction and restore balance.",
            director: "Russo Brothers",
            duration: "3h 1m",
            //bannerColor: .systemRed
        ),

        Movie(
            title: "The Matrix",
            genre: ["Sci-Fi", "Action"].prefix(2).joined(separator: " • "),
            rating: 8.7,
            year: 1999,
            overview: "A hacker discovers reality is a simulation controlled by machines.",
            director: "Wachowskis",
            duration: "2h 16m",
            //bannerColor: .black
        ),

        Movie(
            title: "Titanic",
            genre: ["Romance", "Drama"].prefix(2).joined(separator: " • "),
            rating: 7.9,
            year: 1997,
            overview: "A love story unfolds aboard the doomed RMS Titanic.",
            director: "James Cameron",
            duration: "3h 15m",
            //bannerColor: .systemTeal
        ),

        Movie(
            title: "Joker",
            genre: ["Crime", "Drama", "Thriller"].prefix(2).joined(separator: " • "),
            rating: 8.4,
            year: 2019,
            overview: "A mentally troubled comedian spirals into madness in Gotham City.",
            director: "Todd Phillips",
            duration: "2h 2m",
            //bannerColor: .systemOrange
        ),

        Movie(
            title: "Spider-Man: No Way Home",
            genre: ["Action", "Adventure", "Fantasy"].prefix(2).joined(separator: " • "),
            rating: 8.2,
            year: 2021,
            overview: "Spider-Man’s identity is revealed, causing multiverse chaos.",
            director: "Jon Watts",
            duration: "2h 28m",
            //bannerColor: .systemPink
        )
    ]
}
