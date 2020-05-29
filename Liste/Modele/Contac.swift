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
    
    init(person: Person) {
        tabPerson.append(person)
    }
}
