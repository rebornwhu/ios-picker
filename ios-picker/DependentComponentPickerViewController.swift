//
//  DependentComponentPickerViewController.swift
//  ios-picker
//
//  Created by Xiao Lu on 10/4/15.
//  Copyright © 2015 Xiao Lu. All rights reserved.
//

import UIKit

class DependentComponentPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private let stateComponent = 0
    private let zipComponent = 1
    private var stateZips:[String : [String]]! // dictionary. Key is array of String
    private var states:[String]! // array declaration
    private var zips:[String]! // array declaration
    
    @IBOutlet weak var picker: UIPickerView!
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let stateRow = picker.selectedRowInComponent(stateComponent)
        let zipRow = picker.selectedRowInComponent(zipComponent)
        
        let state = states[stateRow]
        let zip = zips[zipRow]
        
        let title = "You selected zip code \(zip)"
        let message = "\(zip) is in \(state)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bundle = NSBundle.mainBundle()
        let plistURL = bundle.URLForResource("statedictionary", withExtension: "plist")
        stateZips = NSDictionary(contentsOfURL: plistURL!) as! [String : [String]] // "as" is type casting operator, here it's in forced form
        let allStates = stateZips.keys
        states = allStates.sort()
        
        let selectedState = states[0]
        zips = stateZips[selectedState]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:-
    // MARK: Picker Data Source Methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == stateComponent {
            return states.count
        }
        else {
            return zips.count
        }
    }
    
    // MARK:-
    // MARK: Picker Delegate Methods
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == stateComponent {
            return states[row]
        }
        else {
            return zips[row]
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == stateComponent {
            let selectedState = states[row]
            zips = stateZips[selectedState]
            picker.reloadComponent(zipComponent)
            picker.selectRow(0, inComponent: zipComponent, animated: true)
        }
    }
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        let pickerWidth = pickerView.bounds.size.width
        if component == zipComponent {
            return pickerWidth / 3
        }
        else {
            return 2 * pickerWidth / 3
        }
    }

}
