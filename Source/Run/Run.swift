//
//  Run.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 13.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

@UIApplicationMain
class App: HMSApplication {
    
    override func onRootViewController() -> UIViewController? {
                
        return Main.Module.getInstance().factory.sheetFactory.getMainSheet()
        
    }
    
}
