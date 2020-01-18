//
//  HMSPersistentStorage.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 14.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

open class HMSPersistentStorage {
    
    public required init() {
        
    }
    
    public func store(key: String, value: Any){
        UserDefaults.standard.set(value, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    public func recall(key: String) -> Any? {
        return UserDefaults.standard.object(forKey: key)
    }
    
    public func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        UserDefaults.standard.synchronize()
    }
    
}
