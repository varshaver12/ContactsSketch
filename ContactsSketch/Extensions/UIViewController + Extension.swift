//
//  UIViewController + Extension.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

extension UIViewController {
    func configure<T: SelfConfiguringCell>(collectionView: UICollectionView, cellType: T.Type, with user: User, for indexPath: IndexPath) -> T {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseId, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)") }
        cell.configure(with: user)
        return cell
    }
}
