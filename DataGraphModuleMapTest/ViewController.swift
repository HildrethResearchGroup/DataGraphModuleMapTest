//
//  ViewController.swift
//  DataGraphModuleMapTest
//
//  Created by Owen Hildreth on 5/7/17.
//  Copyright © 2017 Owen Hildreth. All rights reserved.
//

import Cocoa
import datagraph

class ViewController: NSViewController {
    
    var controller: DGController? = nil
    
    @IBOutlet weak var dpview: DPDrawingView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let testController = DGController.init(fileInBundle: "Basic Script") {
            controller = testController
            controller?.setDrawingView(dpview)
            controller?.setDelegate(self)
        } else {
            print("Controller did not load")
        }
        
        
    }

    @IBAction func updateGraph(_ sender: NSButton) {
        let xEntries = ["0", "2", "3", "5", "7", "10"]
        let yEntries = ["0", "3", "2", "1", "3", "5"]
        controller?.dataColumn(at: 1).setDataFrom(xEntries)
        controller?.dataColumn(at: 2).setDataFrom(yEntries)
        
        let xAxis = controller?.xAxisNumber(0)
        xAxis?.setCropRange(DGRange(minV: 1.0, maxV: 2.0))
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
            
        }
    }


}


