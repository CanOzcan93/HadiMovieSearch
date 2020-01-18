//
//  HMSNetworkManager.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation
//import Alamofire
//import SwiftyJSON



open class HMSNetworkManager: NSObject {
    
    /*
    -
    -
    // MARK: Sharepoint
    -
    -
    */
    
    private var sharepoint: HMSSharepoint!
    
    private var agency: HMSAgency!
    private var repository: HMSRepository!
    
    private var manager: HMSManager!
    
    private var eventManager: HMSEventManager!
    private var networkManager: HMSNetworkManager!
    
    private var dataStorage: HMSDataStorage!
    private var persistentStorage: HMSPersistentStorage!
    private var exchangeFlow: HMSExchangeFlow!
    private var stateMachine: HMSStateMachine!
    
    public func injectDependencies() {

        sharepoint = HMSSharepoint.getInstance()
        agency = sharepoint.agency
        repository = sharepoint.repository
        manager =  agency.manager
        
        eventManager = manager.eventManager!
        networkManager = manager.networkManager!
        
        dataStorage = repository.dataStorage
        persistentStorage = repository.persistentStorage
        exchangeFlow = repository.exchangeFlow
        stateMachine = repository.stateMachine
        
    }
}
