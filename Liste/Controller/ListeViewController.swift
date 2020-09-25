//
//  ListeViewController.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

class ListeViewController: UIViewController, UITableViewDataSource , UITableViewDelegate  {
    
    @IBOutlet weak var recordingContact: UIButton!
    
    var table : UITableView?
    var tabContacts: [Person] = []
    var listeContact: Contact?
    var contactToDisplay : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayContact()
//        roundPicture()
//        shadowBackground()
        // Do any additional setup after loading the view.
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func displayContact(){
         print("fonction displayContact")
        ContactService.getContact { (success, listeContact) in
            if success, let listeContact = listeContact {
                self.listeContact = listeContact
            }
            self.update()
        }
    }
    
    func update(){
        if let tab = table {
            tab.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "error"
//        label.backgroundColor = UIColor.lightGray
        guard let numberOfSection = listeContact?.numberOfSection, let titleHeader = listeContact?.tabLetters else { return label}
        for i in 0...numberOfSection - 1{
            if section == i {
                let headerLetter = titleHeader[i]
                label.text = headerLetter
                return label
            }
        }
        return label
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        table = tableView
        var numberOfSections = 0
            if let number = listeContact?.numberOfSection {
                numberOfSections = number
            }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRow = listeContact?.tabContacts else { return 0}
        let numberOfRowInSection = numberOfRow[section].count
        
        return numberOfRowInSection
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactsTableViewCell else{
            return UITableViewCell()
        }
        if let contact = listeContact?.tabContacts[indexPath.section] {
            let name = contact[indexPath.row].name
            let firstName = contact[indexPath.row].firstName
            let stringPicture = contact[indexPath.row].picture
            let urlPicture =  URL(string: stringPicture)
            cell.name.text = "\(firstName)  \(name)"
            cell.photo.load(url: urlPicture!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController( withIdentifier: "ContactViewController") as? ContactViewController, let contacts =  listeContact?.tabContacts[indexPath.section] else {return}
        self.navigationController?.pushViewController(vc, animated: true)
        let contact = contacts[indexPath.row]
        print("le nom que je selectionne : \(contact.name)")
        vc.displaycontact = contact
        vc.name = "contact.name"
    }
    
}


extension ListeViewController: DisplayViewControllerDelegate {
    
    func doSomethingWith(data: Person) {
        listeContact?.tabPerson.append(data)
        if let tab = table {
            tab.reloadData()
        }
    }
    
    func roundPicture(){
        recordingContact.layer.masksToBounds = false
        recordingContact.layer.borderColor = UIColor.black.cgColor
        recordingContact.layer.cornerRadius = recordingContact.frame.height/2
        recordingContact.clipsToBounds = true
        recordingContact.layer.shadowColor = UIColor.red.cgColor
         recordingContact.layer.shadowRadius = 5
        recordingContact.layer.shadowOpacity = 1
        recordingContact.layer.shadowOffset = CGSize(width: 10, height: 10)
    }
    
//    func shadowBackground(){
//        recordingContact.layer.shadowColor = UIColor.red.cgColor
//         recordingContact.layer.shadowRadius = 5
//        recordingContact.layer.shadowOpacity = 1
//        recordingContact.layer.shadowOffset = CGSize(width: 0, height: 1)
//    }
    
    
}


