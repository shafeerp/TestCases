//
//  CommonHelper+Protocols.swift
//  Test Cases
//
//  Created by Shafeer P on 24/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

import Foundation

protocol CellUpdateProtocol : AnyObject {
    associatedtype Item
    func updateCellContent(_ data : Item)
}
