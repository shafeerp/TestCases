//
//  Extensions+Date.swift
//  Test Cases
//
//  Created by Shafeer P on 24/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToFormat(_ format : String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}
