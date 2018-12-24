//
//  ReuseBase+UITableView.swift
//  ANReuse
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import UIKit

extension UITableView: ReuseCompatible { }

extension ReuseBase where Base: UITableView {
    
    public func registerClass<T: UITableViewCell>(reusableCell type: T.Type) where T: Reusable {
        base.register(type.self, forCellReuseIdentifier: type.reusableIdentifier)
    }
    
    public func registerClass<T: UITableViewHeaderFooterView>(reusableView type: T.Type) where T: Reusable {
        base.register(type.self, forHeaderFooterViewReuseIdentifier: type.reusableIdentifier)
    }
    
    public func registerNib<T: UITableViewCell>(reusableCell type: T.Type, in bundle: Bundle = Bundle.main) where T: Reusable {
        let nib = UINib(nibName: type.reusableIdentifier, bundle: bundle)
        base.register(nib, forCellReuseIdentifier: type.reusableIdentifier)
    }
    
    public func registerNib<T: UITableViewHeaderFooterView>(reusableView type: T.Type, in bundle: Bundle = Bundle.main) where T: Reusable {
        let nib = UINib(nibName: type.reusableIdentifier, bundle: bundle)
        base.register(nib, forHeaderFooterViewReuseIdentifier: type.reusableIdentifier)
    }
}

extension ReuseBase where Base: UITableView {
    
    public func dequeueCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = base.dequeueReusableCell(withIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Register Cell: \(T.reusableIdentifier) first!")
        }
        return cell
    }
    
    public func dequeueView<T: UITableViewHeaderFooterView>() -> T where T: Reusable {
        guard let view = base.dequeueReusableHeaderFooterView(withIdentifier: T.reusableIdentifier) as? T else {
            fatalError("Register View: \(T.reusableIdentifier) first!")
        }
        return view
    }
}
