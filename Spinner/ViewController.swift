//
//  ViewController.swift
//  Spinner
//
//  Created by Mauro Callegari on 26/05/15.
//  Copyright (c) 2015 Mauro Callegari. All rights reserved.
//

import UIKit
let screenSize: CGRect = UIScreen.mainScreen().bounds

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        VMGearLoadingView(showGearLoadingForView: self.view)
        NSTimer.scheduledTimerWithTimeInterval(80, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update(){
        if let spinner = getGearLoadingForView(self.view) as? VMGearLoadingView{
            spinner.hideGearLoadingForView(spinner)
        }
    }

}

