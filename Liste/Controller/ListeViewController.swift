//
//  ListeViewController.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

class ListeViewController: UIViewController, UITableViewDataSource , UITableViewDelegate  {
    
    var table : UITableView?
    var tabContacts: [Person] = []
    var listeContact: Contact?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayContact()
        // Do any additional setup after loading the view.
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        table = tableView
        var numberOfSections = 0
        if let number = listeContact?.numberOfSection {
            numberOfSections = number
        }
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRowsInSection = 0
        if let number = listeContact?.tabPerson.count {
            numberOfRowsInSection = number
        }
        return numberOfRowsInSection
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactsTableViewCell else{
            return UITableViewCell()
        }
        if let name = listeContact?.tabPerson[indexPath.row].name, let firstName = listeContact?.tabPerson[indexPath.row].firstName, let stringPicture = listeContact?.tabPerson[indexPath.row].picture {
            let urlPicture =  URL(string: stringPicture)
            cell.name.text = "\(firstName)  \(name)"
            cell.photo.load(url: urlPicture!)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = indexPath.row
        print(number)
        _ =  listeContact?.tabPerson[number]
        performSegue(withIdentifier: "listeContacts", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "listeContacts"){
            let displayVC = segue.destination as! RecordingViewController
            displayVC.delegate = self as DisplayViewControllerDelegate
        }
    }
}


extension ListeViewController: DisplayViewControllerDelegate {
    
    func doSomethingWith(data: Person) {
        listeContact?.tabPerson.append(data)
        if let tab = table {
            tab.reloadData()
        }
    }
    
}


