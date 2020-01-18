//
//  HMSModule.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSModule<FactoryType: HMSFactory<SheetFactoryType,TransitionFactoryType>,SheetFactoryType: HMSSheetFactory,TransitionFactoryType: HMSTransitionFactory, DemonstratorType: HMSDemonstrator> {
    
    public var factory: FactoryType!
    public var demonstrator: DemonstratorType!
    
    public required init() {
        
    }
    
}
