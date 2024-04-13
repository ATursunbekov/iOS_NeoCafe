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


//// Usage example
//class MyCollectionViewCell: UICollectionViewCell {
//    // Your cell implementation
//}
//
//class MyCollectionReusableView: UICollectionReusableView {
//    // Your reusable view implementation
//}
//
//class MyViewController: UIViewController, UICollectionViewDataSource {
//    private var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Initialize your collection view layout
//        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 100, height: 100)
//
//        // Initialize your collection view
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
//
//        // Register cell classes
//        collectionView.register(cell: MyCollectionViewCell.self)
//        collectionView.register(header: MyCollectionReusableView.self)
//        collectionView.register(footer: MyCollectionReusableView.self)
//    }
//
//    // MARK: - UICollectionViewDataSource
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // Return the number of items in the section
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        // Dequeue and configure the cell
//        let cell: MyCollectionViewCell = collectionView.dequeue(for: indexPath)
//        // Configure the cell...
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        // Dequeue and configure the supplementary view
//        if kind == UICollectionView.elementKindSectionHeader {
//            let headerView: MyCollectionReusableView = collectionView.dequeue(for: indexPath, kind: kind)
//            // Configure the header view...
//            return headerView
//        } else {
//            let footerView: MyCollectionReusableView = collectionView.dequeue(for: indexPath, kind: kind)
//            // Configure the footer view...
//            return footerView
//        }
//    }
//}
