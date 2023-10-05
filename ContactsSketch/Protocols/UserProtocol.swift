//
//  UserProtocol.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

protocol UserProtocol {
    var fullname: String { get set }
    var imageString: String { get set }
    var firstCharacter: String { get set }
    var id: Int { get set }
}
