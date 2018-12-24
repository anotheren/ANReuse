//
//  ReuseBase.swift
//  ANReuse
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import Foundation

public struct ReuseBase<Base> {
    
    public let base: Base
    
    public init(base: Base) {
        self.base = base
    }
}
