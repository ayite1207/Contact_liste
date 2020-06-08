//
//  ViewController+UIImagePickerController.swift
//  Liste
//
//  Created by ayite  on 03/06/2020.
//  Copyright © 2020 ayite . All rights reserved.
//

import Foundation
import UIKit

extension RecordingViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    /**
    imagePickerController()  allows to display the photo selected
    */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("hello")
        if let photo = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                picture.image = photo
                picture.contentMode = .scaleAspectFill
        }
        dismiss(animated: true, completion: nil)
    }
}

