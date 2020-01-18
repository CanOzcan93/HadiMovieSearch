//
//  DetailSheet-Main.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 18.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit
import SwiftyJSON
import PromiseKit
//import AlamofireImage

extension Main {
    
    public class DetailSheet: Sheet<DetailLayout> {
        
        public override func onLayoutReady(layout: DetailLayout) {
            
            layout.iv_back.onTap {
                self.demonstrator.goBack()
            }
            
        }
        
        public override func onLayoutAppear(layout: Main.DetailLayout) {
            
            layout.dataInitilization(movie: self.exchangeFlow.grabLastSelectedMovie()!, poster: self.exchangeFlow.grabLastSelectedPoster())
            
        }
        
        
    }
    
}
