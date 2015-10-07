//
//  DoubleComponentViewController.swift
//  ios-picker
//
//  Created by Xiao Lu on 10/4/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class DoubleComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var picker: UIPickerView!
    
    private let characterNames = ["Luke", "Leia", "Han", "ChewBacca", "Artoo", "Threepio", "Lando"]
    
    private let cars = ["Volkswagen", "BMW", "Mercedez", "Bentley"]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let row1 = picker.selectedRowInComponent(0)
        let selected1 = characterNames[row1]
        
        let row2 = picker.selectedRowInComponent(1)
        let selected2 = cars[row2]
        
        let title = "\(selected1) picks \(selected2)"
        
        let alert = UIAlertController(title: title, message: "Different people choose different car", preferredStyle: .Alert)
        let action = UIAlertAction(title: "Done", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0) {
            return characterNames.count
        }
        else {
            return cars.count
        }
    }
    
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return characterNames[row]
        }
        else {
            return cars[row]
        }
    }
    
}
