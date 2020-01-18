//
//  HMSDemonstrator.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 13.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class HMSDemonstrator {
    
    open var sheet: UIViewController!
    open var transition: CATransition!
    
    public required init() {
        
    }
    
    open var current: UIViewController!
    public func setCurrent(vc: UIViewController) {
        current = vc
    }
    
    open func present() {
        
        HMSApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: nil)
        
    }
    
    open func present(completion: @escaping () -> ()) {
        
        HMSApplication.window.layer.add(transition, forKey: kCATransition)
        sheet.modalPresentationStyle = .fullScreen
        current.present(sheet, animated: false, completion: completion)
        
    }
    
    open func dismiss() {
        
        HMSApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismiss(completion: @escaping () -> ()) {
        
        HMSApplication.window.layer.add(transition, forKey: kCATransition)
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissNotAnimated() {
        
        current.dismiss(animated: false, completion: nil)
        
    }
    
    open func dismissNotAnimated(completion: @escaping () -> ()) {
        
        current.dismiss(animated: false, completion: completion)
        
    }
    
    open func dismissViewControllers() {
        HMSApplication.window.rootViewController?.dismiss(animated: false) {
        }
    }
    
    open func dismissViewControllers(completion: @escaping () -> ()) {
        HMSApplication.window.rootViewController?.dismiss(animated: false) {
            completion()
        }
    }
        
}
