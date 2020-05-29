//
//  Contact.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
import UIKit

struct Person {
    let picture : UIImageView
    let name : String
    let firstName : String
    let adress : String?
    let cP : String?
    let city : String?
    let tel : String
    let mail : String?
    
    init(name: String, firstName: String, tel: String, adress: String, cP: String, city: String, mail: String, picture: UIImageView) {
        self.name = name
        self.firstName = firstName
        self.adress = adress
        self.city = city
        self.cP = cP
        self.tel = tel
        self.mail = mail
        self.picture = picture
    }
}
