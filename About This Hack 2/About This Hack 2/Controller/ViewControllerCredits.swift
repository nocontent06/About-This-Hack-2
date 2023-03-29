//
//  ViewControllerCredits.swift
//  About This Hack 2
//
//  Created by Felix on 29.03.23.
//

import Cocoa

class ViewControllerCredits: NSViewController {

    @IBOutlet weak var creditsInfo: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        start()
    }
    
    func start() {
        creditsInfo.stringValue = """
        
        Creator of the Project:                 NoContent_06 (AppleGuy#7469)
        (Parts of the) Code provided by:        0xCUB3 (0xCUBE#9118)
        Also important to be credited:  Nautilus704 (Lord Naut#7826) because: 
        A German saying: All good things are 3
        """
    }

   
    
    
    @IBAction func dismissScreen(_ sender: Any) {
        view.window?.close()
    }
}

