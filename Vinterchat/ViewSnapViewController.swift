//
//  ViewSnapViewController.swift
//  Vinterchat
//
//  Created by Guillermo García on 17/01/2017.
//  Copyright © 2017 Guillermo García. All rights reserved.
//

import UIKit

class ViewSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = snap.descrip

    }

   

}
