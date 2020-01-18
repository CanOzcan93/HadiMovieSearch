//
//  HMSEventManager.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSEventManager {
    
    private var delegates: Dictionary<String, [Action]>!
    
    public init() {
        
        self.delegates = Dictionary<String, [Action]>()
        
    }
    
    public func listen(key: String, delegate: @escaping Action) {
        
        if self.delegates[key] == nil {
            self.delegates[key] = [Action]()
        }
        
        self.delegates[key]?.append(delegate)
        
    }
    
    public func shout(key: String) {
        
        if let delegates = self.delegates[key] {
            
            for delegate in delegates {
                delegate()
            }
            
        }
        
    }
    
    public func forget(key: String) {
        
        self.delegates.removeValue(forKey: key)
        
    }
    
    public func resetEventManager() {
        self.delegates = Dictionary<String, [Action]>()
    }
    
}
