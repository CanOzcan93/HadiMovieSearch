//
//  HMSSharepoint.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSSharepoint {
    
    public var agency: HMSAgency!
    public var repository: HMSRepository!
    
    private static var instance: HMSSharepoint?
    
    public required init() {
        
    }
    
    public static func getInstance() -> HMSSharepoint {
        
        guard instance != nil else {
            
            instance = HMSSharepoint()
            
            instance!.agency = HMSAgency()
            instance!.agency!.manager = HMSManager()
            instance!.agency!.manager!.apiManager = HMSApiManager()
            instance!.agency!.manager!.eventManager = HMSEventManager()
            instance!.agency!.manager!.networkManager = HMSNetworkManager()
            instance!.agency!.manager!.mediaManager = HMSMediaManager()
            instance!.agency!.provider = HMSProvider()
            instance!.agency!.provider!.colorProvider = HMSColorProvider()
            instance!.agency!.provider!.fontProvider = HMSFontProvider()
            instance!.agency!.provider!.imageProvider = HMSImageProvider()
            
            instance!.repository = HMSRepository()
            instance!.repository!.dataStorage = HMSDataStorage()
            instance!.repository!.exchangeFlow = HMSExchangeFlow()
            instance!.repository!.persistentStorage = HMSPersistentStorage()
            instance!.repository!.stateMachine = HMSStateMachine()
            
            instance!.agency!.manager!.apiManager!.injectDependencies()
            instance!.agency!.manager!.networkManager!.injectDependencies()
            
            return instance!
            
        }
        
        return instance!
        
    }
    
    public static func resetSharepoint() {
        instance = nil
        
    }
    
    
}
