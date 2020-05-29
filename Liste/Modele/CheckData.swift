//
//  CheckData.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation


class CheckData{
    var name : String?
    var firstName: String?
    var phone: String?
    
    init(name: String, firstName: String, phone: String) {
        self.name = name
        self.firstName = firstName
        self.phone = phone
    }
    
    func emptyField()-> Bool{
        var result =  true
        if name == "" || firstName == "" || phone == "" {
            result = false
        }
        return result
    }
    
    func checkThePhoneNumber()-> Bool{
        var result =  false

        if isStringContainsOnlyNumbers(string: phone!){
            result =  true
        }
//            tel.text = ""
//            tel.placeholder = "votre numéro est incorect"
        return result
    }
    
    func haveTenNumber()-> Bool{
        var result =  false
            var telCount : Bool{
                return phone!.count == 10
            }
            if telCount {
                result =  true
            }
        return result
    }
    
    func isStringContainsOnlyNumbers(string: String) -> Bool {
        return string.rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
}
