//
//  ViewControllerMemory.swift
//  About This Hack 2
//
//  Created by Felix on 29.03.23.
//

import Cocoa

class ViewControllerMemory: NSViewController {

    @IBOutlet weak var ramInfo: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    }
    
    func start() {
        ramInfo.stringValue = HardwareCollector.AdvancedRAMInfo
    }

   
    
    
    @IBAction func dismissScreen(_ sender: Any) {
        view.window?.close()
    }
}
