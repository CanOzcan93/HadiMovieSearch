//
//  HMSApplication.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 13.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class HMSApplication: UIResponder, UIApplicationDelegate {
    
    public static var instance: HMSApplication!
    public static var window: UIWindow!
    
    public func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        HMSApplication.instance = self
        HMSApplication.window = UIWindow(frame: UIScreen.main.bounds)
        
        HMSApplication.window.rootViewController = onRootViewController()!
        HMSApplication.window.makeKeyAndVisible()
        
        HMSApplication.window.backgroundColor = UIColor.white
        
        return true
        
    }
    
    open func onRootViewController() -> UIViewController? {
        return nil
    }
    
}
