//
//  Bindable.swift
//  Test Cases
//
//  Created by Shafeer P on 23/06/20.
//  Copyright © 2020 Shafeer P. All rights reserved.
//

class Bindable<T> {
    
    var value : T? {
        didSet {
            observer?(value)
        }
    }
    var observer : ((T?) -> ())?
    
    func bind(observer : @escaping (T?) -> ()) {
        self.observer = observer
    }
}
