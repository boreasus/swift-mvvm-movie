//
//  APIURLs.swift
//  MVVM-Example
//
//  Created by safa uslu on 30.11.2023.
//

import Foundation

enum APIURLs{
    static func movies(page: Int) -> String{
        "https://api.themoviedb.org/3/movie/popular?api_key=5d4723a0122242ec31d0d5ead9979a46&language=en-US&page=\(page)"
    }
    
    static func imageUrl(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String{
        "https://api.themoviedb.org/3/movie/\(id)?api_key=5d4723a0122242ec31d0d5ead9979a46&language=en-US"
    }
}

