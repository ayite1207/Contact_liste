//
//  Recording ViewController.swift
//  Liste
//
//  Created by ayite  on 28/05/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import UIKit

protocol DisplayViewControllerDelegate : NSObjectProtocol{
    func doSomethingWith(data: Person)
}


class RecordingViewController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var adress: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var cP: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var mail: UITextField!
    var person : Person?
    var listeContact : [Person] = []
    weak var delegate : DisplayViewControllerDelegate?
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        addGesture()
        roundPicture()
        // Do any additional setup after loading the view.
    }
    
    func roundPicture(){
        picture.layer.masksToBounds = false
        picture.layer.borderColor = UIColor.black.cgColor
        picture.layer.cornerRadius = picture.frame.height/2
        picture.clipsToBounds = true
    }
    
    fileprivate func addGesture() {
        picture.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        picture.addGestureRecognizer(tapRecognizer)
    }
    
    // MARK: - Navigation

    @IBAction func recording(_ sender: Any) {
        guard let name = name.text, let firstName = firstName.text, let phone = tel.text, let adress = adress.text,  let city = city.text, let cP = cP.text, let mail = mail.text, let picture = picture else {return}
        
        let checkData = CheckData(name: name, firstName: firstName, phone: phone)
        
        guard checkData.emptyField() else {
            return indicateEmptyFields()
        }
        guard checkData.checkThePhoneNumber() else {
            tel.text = ""
            return tel.placeholder = "votre numéro n'est pas correct"
        }
        guard checkData.haveTenNumber() else {
            tel.text = ""
            return tel.placeholder = "votre numéro n'est pas complet"
        }
        let photo = "person"
        person = Person(name: checkData.name!, firstName: checkData.firstName!, tel: checkData.phone!, adress: adress, cP: cP, city: city, mail: mail, picture: photo)
       listeContact.append(person!)
        if let delegate = delegate{
            if let conact = person{
             delegate.doSomethingWith(data: conact)
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    func indicateEmptyFields(){
        let tabFeild = [name, firstName, tel]
        for feild in tabFeild {
            if let text = feild?.text{
                if text == "" {
                    feild?.placeholder = "champs obligatoire"
                } else {
                    feild?.layer.backgroundColor = .none
                }
            }
        }
    }
    
    @objc func imageTapped(recognizer: UITapGestureRecognizer) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }

    
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let newViewController = segue.destination as? ListeViewController{
                newViewController.tabContacts = listeContact
        }
    }
}
