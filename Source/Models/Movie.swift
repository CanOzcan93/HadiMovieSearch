//
//  Movie.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 15.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

public struct Movie:Decodable {
    
    public var popularity: Double
    public var id: Int
    public var video:Bool
    public var vote_count: Int
    public var vote_average: Double
    public var title: String
    public var release_date: String
    public var original_language: String
    public var original_title: String
    public var genre_ids: [Int]
    public var backdrop_path: String?
    public var adult: Bool
    public var overview: String
    public var poster_path: String?
    
}
