//
//  HMSImageProvider.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class HMSImageProvider {
    
    public required init() {
        
    }
    
    private var left_arrow: UIImage?
    public func getLeftArrow() -> UIImage {
        
        guard left_arrow != nil else {
            left_arrow = UIImage(named: "ic_left_arrow")
            return left_arrow!
        }
        
        return left_arrow!
        
    }
    
}
