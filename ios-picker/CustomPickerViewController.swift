//
//  CustomPickerViewController.swift
//  ios-picker
//
//  Created by Xiao Lu on 10/4/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class CustomPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBOutlet weak var winLabel: UILabel!
    
    private var images:[UIImage]!

    @IBAction func spin(sender: AnyObject) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
