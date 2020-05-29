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
      
      override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
      }
    
      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return contacts.count
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
          cell.textLabel?.text = contacts[indexPath.row].name
          cell.detailTextLabel?.text = contacts[indexPath.row].firstName
          
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath)
    
       }
    
//    @IBAction func DidUnwindFromRecordingStoryboard(_ sender: UIStoryboardSegue) {
//        guard let recordingVC = sender.source as? RecordingViewController else {return}
//        recordingVC.person = Person(name: recordingVC.name.text!, firstName: recordingVC.firstName.text!, tel: recordingVC.tel.text!, adress: recordingVC.adress.text!, cP: recordingVC.cP.text!, city: recordingVC.city.text!, mail: recordingVC.mail.text!, picture: recordingVC.picture)
//        recordingVC.listeContact.append(recordingVC.person!)
//        contacts = recordingVC.listeContact
//}

}
