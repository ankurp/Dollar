//
//  ViewController.swift
//  DemoApp
//
//  Created by Ankur Patel on 9/25/14.
//  Copyright (c) 2014 Encore Dev Labs LLC. All rights reserved.
//

import UIKit
import Dollar

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let result = $.map([1, 2, 3]) {
            ($0 * 2).description
        }
        resultLabel.text = "=\n" + Swift.join(",", result)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

