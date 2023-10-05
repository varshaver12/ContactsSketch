//
//  ContactCell.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

class ContactCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "ContactCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: UserProtocol) {
        
    }
}
