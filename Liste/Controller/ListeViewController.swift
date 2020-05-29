//
//  ListeViewController.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

class ListeViewController: UIViewController, UITableViewDataSource , UITableViewDelegate  {
    
      var contacts: [Person]?
      
    var test = ""
      override func viewDidLoad() {
          super.viewDidLoad()
       
        for data in contacts!{
                print("HELLO")
                    print(data.name)
        }
        
          // Do any additional setup after loading the view.
      }
      func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }
      
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
          return 10
      }
      
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "name", for: indexPath)
//          cell.textLabel?.text = contact?.tabPerson[indexPath.row].name
//          cell.detailTextLabel?.text = contact?.tabPerson[indexPath.row].firstName
          
          return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let cell = tableView.cellForRow(at: indexPath)
          
          let name = cell?.textLabel?.text
          let firstName = cell?.detailTextLabel?.text
          
          print("\(name) \(firstName)")
       }

}
