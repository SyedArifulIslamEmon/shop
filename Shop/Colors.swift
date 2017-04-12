//
//  Colors.swift
//  Shop
//
//  Created by Roland Michelberger on 12.04.17.
//  Copyright © 2017 rolandmichelberger. All rights reserved.
//

import UIKit

struct Colors {
    
    static let LabelTextColor = UIColor.blue
    static let NavigationBarBarTintColor = UIColor.orange
    static let NavigationBarTintColor = UIColor.white
    static let BackgroundColor = UIColor.darkGray
    
    
    static func setupAppeareance() {

        UINavigationBar.appearance().barTintColor = NavigationBarBarTintColor
        UINavigationBar.appearance().tintColor = NavigationBarTintColor
        
        
        UILabel.appearance().textColor = LabelTextColor
    }
    
}
