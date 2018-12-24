//
//  ReuseBase+UICollectionView.swift
//  ANReuse
//
//  Created by 刘栋 on 2018/8/30.
//  Copyright © 2018年 anotheren.com. All rights reserved.
//

import UIKit

extension UICollectionView: ReuseCompatible { }

extension ReuseBase where Base: UICollectionView {
    
    public enum ElementKind: RawRepresentable {
        
        case sectionHeader
        case sectionFooter
        
        public init(rawValue: String) {
            switch rawValue {
            case UICollectionView.elementKindSectionHeader:
                self = .sectionHeader
            case UICollectionView.elementKindSectionFooter:
                self = .sectionFooter
            default:
                fatalError()
            }
        }
        
        public var rawValue: String {
            switch self {
            case .sectionHeader:
                return UICollectionView.elementKindSectionHeader
            case .sectionFooter:
                return UICollectionView.elementKindSectionFooter
            }
        }
    }
}

extension ReuseBase where Base: UICollectionView {
    
    public func registerClass<T: UICollectionViewCell>(reusableCell type: T.Type) where T: Reusable {
        base.register(type.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    public func registerNib<T: UICollectionViewCell>(reusableCell type: T.Type, in bundle: Bundle = Bundle.main) where T: Reusable {
        let nib = UINib(nibName: type.reusableIdentifier, bundle: bundle)
        base.register(nib, forCellWithReuseIdentifier: type.reusableIdentifier)
    }
    
    public func registerClass<T: UICollectionReusableView>(reusableView type: T.Type, for kind: ElementKind) where T: Reusable {
        base.register(type.self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: type.reusableIdentifier)
    }
    
    public func registerNib<T: UICollectionReusableView>(reusableView type: T.Type, for kind: ElementKind, in bundle: Bundle = Bundle.main) where T: Reusable {
        let nib = UINib(nibName: type.reusableIdentifier, bundle: bundle)
        base.register(nib, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: type.reusableIdentifier)
    }
}

extension ReuseBase where Base: UICollectionView {
    
    public func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = base.dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Register Cell: \(T.reusableIdentifier) first!")
        }
        return cell
    }
    
    public func dequeueView<T: UICollectionReusableView>(kind: ElementKind, for indexPath: IndexPath) -> T where T: Reusable {
        guard let view = base.dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: T.reusableIdentifier, for: indexPath) as? T else {
            fatalError("Register View: \(T.reusableIdentifier) first!")
        }
        return view
    }
}
