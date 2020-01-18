//
//  HMSFactory.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 13.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSFactory<SheetFactoryType: HMSSheetFactory, TransitionFactoryType: HMSTransitionFactory>{
    
    public var sheetFactory: SheetFactoryType!
    public var transitionFactory: TransitionFactoryType!
    
    public required init() {
        
    }
    
}
