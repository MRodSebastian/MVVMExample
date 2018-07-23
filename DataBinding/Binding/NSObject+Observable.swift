//
//  NSObject+Observable.swift
//  DataBinding
//
//  Created by Manu Rodríguez on 23/07/2018.
//  Copyright © 2018 Manu Rodríguez. All rights reserved.
//

import Foundation

extension NSObject{
    public func observe<T>(for observable: Observable<T>, with: @escaping (T) -> ()) {
        observable.bind { observable, value  in
            DispatchQueue.main.async {
                with(value)
            }
        }
    }
}
