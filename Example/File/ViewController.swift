//
//  ViewController.swift
//  File
//
//  Created by Softshag & Me on 08/03/2015.
//  Copyright (c) 2015 Softshag & Me. All rights reserved.
//

import UIKit
//import Bytes
import File

func getPath(path: String) -> String? {
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true)
    
    let documentsDirectory = paths.first!
    return documentsDirectory.stringByAppendingPathComponent(path)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("test", ofType: ".txt")
        let file = ReadableFileStream(path!, binary: false)
        
        let bytes = file![0..<file!.size].string
        print(bytes)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

