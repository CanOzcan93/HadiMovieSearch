//
//  HMSRepository.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSRepository {
    
    public var exchangeFlow: HMSExchangeFlow!
    public var persistentStorage: HMSPersistentStorage!
    public var stateMachine: HMSStateMachine!
    public var dataStorage: HMSDataStorage!
    
    public required init() {
        
    }
    
}
