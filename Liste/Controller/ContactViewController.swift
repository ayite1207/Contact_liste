//
//  ContactViewController.swift
//  Liste
//
//  Created by ayite  on 17/06/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var cp: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var mail: UITextField!
    
    @IBOutlet weak var whiteBackground: UIView!
    
    var displaycontact : Person?
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayContact()
        roundPicture()
        roundBackground()
        shadowBackground()
        // Do any additional setup after loading the view.
    }
    
    func roundPicture(){
        picture.layer.masksToBounds = false
        picture.layer.borderColor = UIColor.black.cgColor
        picture.layer.cornerRadius = picture.frame.height/2
        picture.clipsToBounds = true
    }
    func roundBackground(){
        whiteBackground.layer.masksToBounds = false
        whiteBackground.layer.borderColor = UIColor.black.cgColor
        whiteBackground.layer.cornerRadius = whiteBackground.frame.height/40
        whiteBackground.clipsToBounds = true
    }

    func shadowBackground(){
        whiteBackground.layer.shadowColor = UIColor.red.cgColor
         whiteBackground.layer.shadowRadius = 5
        whiteBackground.layer.shadowOpacity = 1
        whiteBackground.layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    func displayContact(){
        lastName.text = displaycontact?.name
        firstName.text =  displaycontact?.firstName
        phone.text = displaycontact?.tel
        adress.text = displaycontact?.adress
        cp.text = displaycontact?.cP
        city.text = displaycontact?.city
        mail.text = displaycontact?.mail
        let urlPicture =  URL(string: displaycontact!.picture)!
        picture.load(url: urlPicture)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
