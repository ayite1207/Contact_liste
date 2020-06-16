//
//  Contac.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation


struct Contact{
    var tabPerson : [Person] = []
    var dicoContacts : [String : [Person]] = [:]
    var numberOfSection = 0
    
    init(person: [Person]) {
        tabPerson = person
        numberOfSection(tabPerson: tabPerson)
    }
    
    mutating func numberOfSection(tabPerson: [Person]){
        for contact in tabPerson{
            let lastName = contact.name
            let firstLetter = lastName.prefix(1)
            if dicoContacts[String(firstLetter)] == nil{
                var tabContact : [Person] = []
                tabContact.append(contact)
                dicoContacts[String(firstLetter)] = tabContact
            } else {
                var tabContact = dicoContacts[String(firstLetter)]!
                tabContact.append(contact)
            }
        }
        numberOfSection = dicoContacts.count
    }
}
