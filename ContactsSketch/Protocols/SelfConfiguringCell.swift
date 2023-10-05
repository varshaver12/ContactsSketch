//
//  SelfConfiguringCell.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with user: UserProtocol)
}
