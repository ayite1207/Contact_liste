//
//  ContactCodableJSON.swift
//  Liste
//
//  Created by ayite  on 05/06/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

struct ListeContacts: Codable{
    var results: [Contacts]
}

struct Contacts: Codable {
    var name : [String : String]
    var location : Location
    var phone : String
    var email : String
    var picture : [String: String]
    
}

struct Location: Codable {
    var street : Street
    var city : String
    var state : String
    var country : String
    var postcode : Int
    var coordinates : [String : String]
    var timezone : [String : String]
}

struct Street: Codable {
    var number: Int
    var name: String
}
