//
//  HMSExchangeFlow.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class HMSExchangeFlow {
    
    public required init() {
        
    }
    
    private var lastSelectedMovie: Movie?
    public func letSelectedMovie(place: Movie?) {
        self.lastSelectedMovie = place
    }
    public func grabLastSelectedMovie() -> Movie? {
        return self.lastSelectedMovie
    }
    
    private var lastSelectedPoster: UIImage?
    public func letSelectedPoster(poster: UIImage?) {
        self.lastSelectedPoster = poster
    }
    public func grabLastSelectedPoster() -> UIImage? {
        return self.lastSelectedPoster
    }
    
}
