//
//  ViewController.swift
//  Pos-Chair
//
//  Created by Paul MD on 9/4/15.
//  Copyright (c) 2015 Paul MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelToViewController(segue:UIStoryboardSegue) {
    }

    @IBOutlet weak var ActivityButton: UIButton!

    @IBOutlet weak var AboutUsButton: UIButton!
    

}

