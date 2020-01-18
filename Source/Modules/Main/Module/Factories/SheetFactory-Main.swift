//
//  SheetFactory-Main.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 15.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class SheetFactory: HMSSheetFactory {
        
        private var mainSheet: MainSheet?
        public func getMainSheet() -> MainSheet {
            
            guard mainSheet != nil else {
                mainSheet = MainSheet()
                return mainSheet!
            }
            
            return mainSheet!
            
        }
        
        private var detailSheet: DetailSheet?
        public func getDetailSheet() -> DetailSheet {
           
            guard detailSheet != nil else {
                detailSheet = DetailSheet()
                return detailSheet!
            }
           
            return detailSheet!
           
        }
        
        
    }
}
