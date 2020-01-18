//
//  DetailLayout-Main.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 18.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension Main {
    
    public class DetailLayout: HMSLayout {
        
        private var iv_poster: HMSImageView!
        public var iv_back: HMSImageView!
        private var tv_title: HMSTextView!
        private var tv_overview: HMSMultilineTextInput!

        
        public override func onConstruct() {
            
            constructPosterImageView()
            constructBackImageView()
            constructTitleTextView()
            constructOverviewTextView()
            
        }
        
        private func constructPosterImageView() {
            
            iv_poster = HMSImageView()
            iv_poster.backgroundColor = UIColor.red
            self.addSubview(iv_poster)
            
        }
        
        private func constructBackImageView() {
            
            iv_back = HMSImageView()
            iv_back.image = imageProvider.getLeftArrow()
            self.addSubview(iv_back)
            
        }
        
        private func constructTitleTextView() {
            
            tv_title = HMSTextView()
            tv_title.text = "Title"
            tv_title.numberOfLines = 2
            tv_title.font = fontProvider.getSemiboldLarge()
            tv_title.textColor = colorProvider.getDarkGray()
            self.addSubview(tv_title)
            
        }
        
        private func constructOverviewTextView() {
            
//            tv_overview = HMSTextView()
            tv_overview = HMSMultilineTextInput()
            tv_overview.isUserInteractionEnabled = false
            tv_overview.font = fontProvider.getRegularMedium()
            tv_overview.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ultrices magna nec erat mollis, quis tincidunt orci imperdiet. Maecenas at dapibus neque. Curabitur faucibus orci ligula, a porta nibh dictum id. Fusce ut posuere est. Orci varius natoque penatibus et."
            tv_overview.textColor = colorProvider.getDarkGray()
            tv_overview.backgroundColor = colorProvider.getWhiteFull()
//            tv_overview.numberOfLines = 0
            self.addSubview(tv_overview)
            
        }
        
        public override func onConstrain(set: inout [NSLayoutConstraint]) {
            
            constrainPosterImageView(set: &set)
            constrainBackImageView(set: &set)
            constrainTitleTextView(set: &set)
            constrainOverviewTextView(set: &set)
            
        }
        
        private func constrainPosterImageView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: iv_poster, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_poster, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_poster, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0))
            set.append(NSLayoutConstraint(item: iv_poster, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0.4, constant: 0))
        
        }
        
        private func constrainBackImageView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: iv_back, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 30))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30))
            set.append(NSLayoutConstraint(item: iv_back, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30))
            
        }
        
        private func constrainTitleTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_title, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .top, relatedBy: .equal, toItem: iv_poster, attribute: .bottom, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -30))
            set.append(NSLayoutConstraint(item: tv_title, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 60))
            
        }
        
        private func constrainOverviewTextView(set: inout [NSLayoutConstraint]) {
            
            set.append(NSLayoutConstraint(item: tv_overview, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 15))
            set.append(NSLayoutConstraint(item: tv_overview, attribute: .top, relatedBy: .equal, toItem: tv_title, attribute: .bottom, multiplier: 1, constant: 5))
            set.append(NSLayoutConstraint(item: tv_overview, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -30))
            set.append(NSLayoutConstraint(item: tv_overview, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -15))
            
        }
        
        public func dataInitilization (movie: Movie, poster: UIImage?) {
            
            self.tv_title.text = movie.title
            self.tv_overview.text = movie.overview
            self.iv_poster.image = poster
            self.tv_overview.sizeToFit()
        }
    
    }
}
