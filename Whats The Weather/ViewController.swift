//
//  ViewController.swift
//  Whats The Weather
//
//  Created by Chatterjee, Snigdhaman on 29/12/15.
//  Copyright © 2015 Chatterjee, Snigdhaman. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var placeName: UITextField!
    
    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func searchButton(sender: AnyObject) {
        
        if !(placeName.text!.isEmpty) {
            
            let place = ((placeName.text!).stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())).stringByReplacingOccurrencesOfString(" ", withString: "-")
            let url = "http://www.weather-forecast.com/locations/\(place)/forecasts/latest"
            let weburl = NSURL(string: url)!
            
            webView.loadRequest(NSURLRequest(URL: weburl))
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.placeName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }


}

