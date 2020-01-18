//
//  ListView.swift
//  HadiMovieSearch
//
//  Created by Can Özcan on 15.01.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

extension Main {
    
    public class ListView: HMSListView<ListItemView> {
        
        public override func onInit() {
            self.backgroundColor = .white
        }
        
        public override func emptyMessage() -> String {
            return "Liste Yükleniyor..."
        }
        
    }
    
}
