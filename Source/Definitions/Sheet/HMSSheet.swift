//
//  HMSSheet.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 13.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

import UIKit

open class HMSSheet<LayoutType: HMSLayout>: UIViewController {
    
    /*
     -
     -
     // MARK: Basic Definitions
     -
     -
     */
    
    private var initialized: Bool = false
    
    private var layout: LayoutType!
    
    open func onInit() {}
    open func onLayoutReady(layout: LayoutType) {}
    open func onLayoutAppear(layout: LayoutType) {}
    open func onLayoutFirstAppear(layout: LayoutType) {}
    open func onLayoutReappear(layout: LayoutType) {}
    open func onLayoutDisappear(layout: LayoutType) {}
    
    open func onDismiss() {}
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onInjection()
        
        onInit()
        
        layout = LayoutType.init()
        
        self.view = layout
        
        onLayoutReady(layout: layout)
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if (initialized) {
            onLayoutReappear(layout: layout)
        }
        else {
            onLayoutFirstAppear(layout: layout)
        }
        onLayoutAppear(layout: layout)
        
        self.initialized = true
        
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        
        onLayoutDisappear(layout: layout)
        
        super.viewDidDisappear(animated)
        
        
    }
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        onDismiss()
        
        super.dismiss(animated: flag, completion: completion)
        
    }
    
    /*
     -
     -
     // MARK: Sharepoint Definitions
     -
     -
     */
    
    private var sharepoint: HMSSharepoint!
    
    private var agency: HMSAgency!
    private var repository: HMSRepository!
    
    private var manager: HMSManager!
    private var provider: HMSProvider!
    
    open var apiManager: HMSApiManager!
    open var eventManager: HMSEventManager!
    open var networkManager: HMSNetworkManager!
    open var mediaManager: HMSMediaManager!
    
    open var fontProvider: HMSFontProvider!
    open var colorProvider: HMSColorProvider!
    open var imageProvider: HMSImageProvider!
    
    open var dataStorage: HMSDataStorage!
    open var exchangeFlow: HMSExchangeFlow!
    open var persistentStorage: HMSPersistentStorage!
    open var stateMachine: HMSStateMachine!
    
    open func onInjection() {
        
        sharepoint = HMSSharepoint.getInstance()
        
        agency = sharepoint.agency
        repository = sharepoint.repository
        
        manager = agency.manager
        provider = agency.provider
        
        apiManager = manager.apiManager
        eventManager = manager.eventManager
        networkManager = manager.networkManager
        mediaManager = manager.mediaManager
        
        colorProvider = provider.colorProvider
        fontProvider = provider.fontProvider
        imageProvider = provider.imageProvider
        
        dataStorage = repository.dataStorage
        exchangeFlow = repository.exchangeFlow
        persistentStorage = repository.persistentStorage
        stateMachine = repository.stateMachine
        
    }
    
}
