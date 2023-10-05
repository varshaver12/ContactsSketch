//
//  UserModel.swift
//  ContactsSketch
//
//  Created by 1234 on 05.10.2023.
//

import UIKit

struct User: UserProtocol, Hashable, Decodable {
    var fullname: String
    var imageString: String
    var firstCharacter: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
