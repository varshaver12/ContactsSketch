//
//  ProfileCell.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

class ProfileCell: UICollectionViewCell, SelfConfiguringCell {
    static var reuseId: String = "ProfileCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: UserProtocol) {
        
    }
}
