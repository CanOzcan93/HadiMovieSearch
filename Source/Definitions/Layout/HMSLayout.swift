//
//  HMSLayout.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 13.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class HMSLayout: UIView {
    
    /*
     -
     -
     // MARK: Basic Definitions
     -
     -
     */
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    // Virtuals
    
    open func onInit() {}
    open func onConstruct() {}
    open func onConstrain(set: inout [NSLayoutConstraint]) {}
    open var setTouchEvent: Action?
    
    // init
    
    public required init() { super.init(frame: .zero); self.initialize() }
    public required init?(coder decoder: NSCoder) { super.init(coder: decoder) }
    private func initialize() {
        
        let window = HMSApplication.window!
        
        let top = window.safeAreaInsets.top
        let bottom = window.safeAreaInsets.bottom
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height - top - bottom + 16
        
        let origin = CGPoint(x: 0, y: top)
        let size = CGSize(width: width, height: height)
        
        self.frame = CGRect(origin: origin, size: size)
        
        self.translatesAutoresizingMaskIntoConstraints = true
        
        self.set = [NSLayoutConstraint]()
        
        onInit()
        onInjection()
        onConstruct()
        
        onConstrain(set: &self.set)
        self.addConstraints(set)
        self.layoutIfNeeded()
        
    }
    
    
    // Constraining
    
    public func relayout() {
        self.layoutIfNeeded()
    }
    
    public func constrain(constraint: NSLayoutConstraint) {
        self.addConstraint(constraint)
    }
    
    public func release(constraint: NSLayoutConstraint) {
        self.removeConstraint(constraint)
    }
    
    public func shift(from: NSLayoutConstraint, to: NSLayoutConstraint) {
        self.release(constraint: from)
        self.constrain(constraint: to)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setTouchEvent?()
    }
    
    // Movement
    
    open func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration )
        self.frame = self.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
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
    
    private var provider: HMSProvider!
    
    public var fontProvider: HMSFontProvider!
    public var colorProvider: HMSColorProvider!
    public var imageProvider: HMSImageProvider!
    
    open func onInjection() {
        
        sharepoint = HMSSharepoint.getInstance()
        
        agency = sharepoint.agency
        
        provider = agency.provider
        
        fontProvider = provider.fontProvider
        colorProvider = provider.colorProvider
        imageProvider = provider.imageProvider
        
    }
    
}
