//
//  ReuseCompatible.swift
//  ANReuse
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import Foundation

public protocol ReuseCompatible {
    
    associatedtype CompatibleType
    
    static var reuse: ReuseBase<CompatibleType>.Type { get }
    
    var reuse: ReuseBase<CompatibleType> { get }
}

extension ReuseCompatible {
    
    public static var reuse: ReuseBase<Self>.Type {
        get {
            return ReuseBase<Self>.self
        }
        
    }
    
    public var reuse: ReuseBase<Self> {
        get {
            return ReuseBase(base: self)
        }
    }
}
