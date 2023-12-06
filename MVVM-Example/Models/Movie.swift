//
//  Movie.swift
//  MVVM-Example
//
//  Created by safa uslu on 30.11.2023.
//

import Foundation

struct Movie : Decodable{
    let results: [MovieResult]?

}

struct MovieResult : Decodable{
    let id:Int?
    let posterPath:String?
    let overView, releaseDate, title:String?

    enum CodingKeys: String, CodingKey{
        case id
        case posterPath = "poster_path"
        case overView = "overview"
        case title
        case releaseDate = "release_date"
        
    }
    
    var _id:Int{
        id ?? Int.min
    }
    
    var _posterPath:String{
        posterPath ?? ""
    }
    
    var _title: String{
        title ?? "N/A"
    }
    
    var _releaseDate:String {
        releaseDate ?? "N/A"
    }
    
    var _overView:String{
        overView ?? "There is no ow"
    }
}
