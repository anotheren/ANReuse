//
//  Reusable.swift
//  ANReuse
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import Foundation

public protocol Reusable: class {
    
    static var reusableIdentifier: String { get }
}

extension Reusable {
    
    public static var reusableIdentifier: String {
        return String(describing: Self.self)
    }
}
