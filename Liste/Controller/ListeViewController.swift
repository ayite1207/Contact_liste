//
//  ListeViewController.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

class ListeViewController: UIViewController, UITableViewDataSource , UITableViewDelegate  {
    
    
    var contacts: [Person] = []
    var table : UITableView?
    
      override func viewDidLoad() {
          super.viewDidLoad()
        
        ContactService.getContact { (success, person) in
            if success, let person = person {
                 self.update(persons: person)
            }
        }
          // Do any additional setup after loading the view.
      }
    
    @IBAction func button(_ sender: Any) {
        ContactService.getContact { (success, person) in
            if success, let person = person {
                 self.update(persons: person)
            }
        }
    }
    
    func update(persons: [Person]){
        
             contacts = persons
        
    }
      func numberOfSections(in tableView: UITableView) -> Int {
        table = tableView
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return contacts.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as? ContactsTableViewCell else{
            return UITableViewCell()
        }
        let name = contacts[indexPath.row].name
        let firstName = contacts[indexPath.row].firstName
        let photo = UIImage(named: contacts[indexPath.row].picture)
        cell.name.text = "\(firstName)  \(name)"
        cell.photo.image = photo
        
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath)
    
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
        contacts.append(data)
        if let tab = table {
            tab.reloadData()
        }
        for contact in contacts{
            print("NOm : \(contact.name)")
        }
    }
    
}
