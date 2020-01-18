//
//  HMSManager.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSManager {
    
    public var apiManager: HMSApiManager?
    public var eventManager: HMSEventManager?
    public var networkManager: HMSNetworkManager?
    public var mediaManager: HMSMediaManager?
    
    public required init() {
        
    }
    
}
