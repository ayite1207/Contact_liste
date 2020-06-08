//
//  ContactService.swift
//  Liste
//
//  Created by ayite  on 05/06/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation

class ContactService {

    
    private static let contactUrl = URL(string: "https://randomuser.me/api/?nat=fr&inc=name,phone,picture,location,email&results=5")!
    
    static func getContact(callback: @escaping (Bool, [Person]?)-> Void){
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: contactUrl) { (data, response, error) in
            if let data = data,  error == nil {
                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    if let product = try? JSONDecoder().decode(ListeContacts.self, from: data){
                        var tabContact: [Person] = []
                        for contact in product.results{
                            let name = contact.name["last"]
                            let firstName = contact.name["first"]
                            let phone = contact.phone
                            let adress = contact.location.street.name
                            let cp = String(contact.location.postcode)
                            let city = contact.location.city
                            let email = contact.email
                            let picture = contact.picture["medium"]
                            let person = Person(name: name!, firstName: firstName!, tel: phone, adress: adress, cP: cp, city: city, mail: email, picture: picture!)
                            tabContact.append(person)
                            callback(true, tabContact)
                        }
                    }
                }
            }
        }
        task.resume()
    }
    
}
