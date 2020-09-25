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
    var tabLetters : [String] = []
    var tabContacts : [[Person]] = [[]]
    var numberOfSection = 0
    
    init(tabPerson: [Person]) {
        calculNumberOfSection(tabPerson: tabPerson)
    }
    
    mutating func calculNumberOfSection(tabPerson: [Person]){
        // Je boucle mon tableau d'objets Person
        // Pour chaque objet je recupere la premiere lettre de la propriete firstName pour classer tout mes objets par ordre alphabetique
        // Je creer un dictionnaire dans lequel chaque objet est classé dans un tableau par rapport à la premiere lettre de la propriete firstName
        for contact in tabPerson{
            let firstName = contact.firstName
            let firstLetter = firstName.prefix(1)
            if dicoContacts[String(firstLetter)] == nil{
                var tabContact : [Person] = []
                tabContact.append(contact)
                dicoContacts[String(firstLetter)] = tabContact
            } else {
                var tabContact = dicoContacts[String(firstLetter)]!
                tabContact.append(contact)
                dicoContacts[String(firstLetter)] = tabContact            }
        }
        numberOfSection = dicoContacts.count
        classifyContacts()
    }
    
    mutating func classifyContacts (){
        let alphabet = ["A" : 0,"B": 1,"C": 2,"D": 3,"E": 4,"F": 5,"G": 6,"H": 7,"I": 8,"J": 9,"K": 10,"L": 11,"M": 12,"N": 13,"O": 14,"P": 15,"Q": 16,"R": 17,"S": 18,"T": 19,"U": 20,"V": 21,"W": 22,"X": 23,"Y": 24,"Z": 25]
        // Je boucle mon dictionnaire
        for (lettre, _) in dicoContacts {
            // Si mon tableau tabLetter est vide j'incere la cle dans celui ci et la valeur "contacts" dans le tableau tabContact
            if tabLetters == [] {
                tabLetters.append(lettre)
            } else {
                var num = 0
                let laLettreDeMonDicoAComparer = alphabet[lettre]
                for i in tabLetters {
                    let laLettreDeMonTabQueJeCompare = alphabet[i]
                    if laLettreDeMonDicoAComparer! <= laLettreDeMonTabQueJeCompare! {
                        tabLetters.insert(lettre, at: num)
                        break
                    } else if laLettreDeMonDicoAComparer! > laLettreDeMonTabQueJeCompare! && num == tabLetters.count - 1{
                        tabLetters.append(lettre)
                        break
                    }
                    num += 1
                }
            }
            
        }
        for letter in tabLetters {
            let sectionContact = dicoContacts[letter]
            tabContacts.append(sectionContact!)
            for contacts in sectionContact!{
                self.tabPerson.append(contacts)
            }
        }
        tabContacts.remove(at: 0)
    }
    
}
