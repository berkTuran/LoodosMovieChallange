//
//  Movie.swift
//  LoodosMovieChallange
//
//  Created by Berk Turan on 2/1/21.
//

import Foundation
import ObjectMapper

class Movie: Codable, Mappable {
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        Title    <- map["Title"]
        Year         <- map["Year"]
        Rated      <- map["Rated"]
        Released       <- map["Released"]
        Runtime  <- map["Runtime"]
        Genre  <- map["Genre"]
        Director     <- map["Director"]
        Writer    <- map["Writer"]
        Actors  <- map["Actors"]
        Plot     <- map["Plot"]
        Language    <- map["Language"]
        Country  <- map["Country"]
        Awards     <- map["Awards"]
        PosterUrlString    <- map["Poster"]
        Ratings <- map["Ratings"]
        Metascore     <- map["Metascore"]
        imdbRating    <- map["imdbRating"]
        imdbVotes <- map["imdbVotes"]
        imdbID     <- map["imdbID"]
        movieType    <- map["Type"]
        DVD <- map["DVD"]
        BoxOffice <- map["BoxOffice"]
        Production     <- map["Production"]
        Website    <- map["Website"]
        Response <- map["Response"]
    }
    
    var Title: String?
    var Year: String?
    var Rated: String?
    var Released: String?
    var Runtime: String?
    var Genre: String?
    var Director: String?
    var Writer: String?
    var Actors: String?
    var Plot: String?
    var Language: String?
    var Country: String?
    var Awards: String?
    var PosterUrlString: String?
    var Ratings: [Rating]?
    var Metascore: String?
    var imdbRating: String?
    var imdbVotes: String?
    var imdbID: String?
    var movieType: String?
    var DVD: String?
    var BoxOffice: String?
    var Production: String?
    var Website: String?
    var Response: String?
}

class Rating: Codable, Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        Source    <- map["Source"]
        Value         <- map["Value"]
    }
    
    var Source: String?
    var Value: String?
}

