//
//  Ext+UICollectionView.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 09/04/24.
//

import UIKit

extension UIView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
    
// swiftlint:disable all
extension UICollectionView {
    
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(header: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func register<T: UICollectionReusableView>(footer: T.Type) {
        register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
    
    func dequeue<T: UICollectionReusableView>(for indexPath: IndexPath, kind: String) -> T {
        return dequeueReusableSupplementaryView( ofKind: kind, withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
