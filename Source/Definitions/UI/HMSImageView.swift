//
//  HMSImageView.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 15.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class HMSImageView: UIImageView {
    
    // Virtuals
    
    open func onInit() {}
    open func onInjection() {}
    open func onConstruct() {}
    open func onConstrain() {}
    
    public var onDraw: ActionWith<CGRect>!
    
    
    // init
    
    required public init() { super.init(frame: .zero); self.initialize() }
    required public init?(coder decoder: NSCoder) { super.init(coder: decoder) }
    private func initialize() {
        
        self.contentMode = .redraw
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        onInit()
        onInjection()
        onConstruct()
        onConstrain()
        
    }
    
    
    // Tap Implementation
    
    private var onTapDelegate: Action!
    public func onTap(delegate: Action!) {
        
        self.onTapDelegate = delegate
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(on_tap))
        self.isUserInteractionEnabled = true
        gesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(gesture)
        
    }
    
    @objc
    private func on_tap() {
        onTapDelegate()
    }
    
    
    // Draw Implementation
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        onDraw?(rect)
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
    
    
}
