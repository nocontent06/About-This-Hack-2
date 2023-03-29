//
//  ViewController.swift
//  About This Hack 2
//
//  Created by Felix on 29.03.23.
//

import Cocoa

class ViewController: NSViewController {
    
    
    
    // MARK: IBOutlets Overview:
    
    @IBOutlet weak var picture: NSImageView!
    @IBOutlet weak var macModel: NSTextField!
    @IBOutlet weak var cpu: NSTextField!
    @IBOutlet weak var graphics: NSTextField!
    @IBOutlet weak var ram: NSTextField!
    @IBOutlet weak var startupDisk: NSTextField!
    @IBOutlet weak var serialNumber: NSTextField!
    @IBOutlet weak var osPrefix: NSTextField!
    @IBOutlet weak var osVersion: NSTextField!
    @IBOutlet weak var systemVersion: NSTextField!
    @IBOutlet weak var display: NSTextField!
    @IBOutlet weak var blVersion: NSTextField!
    
    var osNumber = run("sw_vers | grep ProductVersion | cut -c 17-")
    var modelID = "Mac"
    var ocLevel = "Unknown"
    var ocVersionID = "Version"

    override func viewDidLoad() {
        super.viewDidLoad()
        start()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func viewDidAppear() {
        self.view.window?.styleMask.remove(NSWindow.StyleMask.resizable)
    }

    func start(){
        
        HardwareCollector.getAllData()
        
        switch HardwareCollector.OSvers {
        case .VENTURA:
            picture.image = NSImage(named: "Ventura")
            break
        case .MONTEREY:
            picture.image = NSImage(named: "Monterey")
            break
        case .BIG_SUR:
            picture.image = NSImage(named: "Big Sur")
            break
        case .CATALINA:
            picture.image = NSImage(named: "Catalina")
            break
        case .MOJAVE:
            picture.image = NSImage(named: "Mojave")
            break
        case .HIGH_SIERRA:
            picture.image = NSImage(named: "High Sierra")
            break
        case .SIERRA:
            picture.image = NSImage(named: "Sierra")
            break
        case .EL_CAPITAN:
            picture.image = NSImage(named: "El Capitan")
            break
        case .YOSEMITE:
            picture.image = NSImage(named: "Yosemite")
            break
        case .MAVERICKS:
            picture.image = NSImage(named: "Mavericks")
            break
        case .MOUNTAIN_LION:
            picture.image = NSImage(named: "Mountain Lion")
            break
        case .LEOPARD:
            picture.image = NSImage(named: "Leopard")
        case .macOS:
            picture.image = NSImage(named: "Unknown")
            break
        }
        
        osVersion.stringValue = HardwareCollector.OSname
        
        // macOS Version ID
        systemVersion.stringValue = HardwareCollector.OSBuildNum
        
        // Mac Model
        macModel.stringValue = HardwareCollector.macName
        
        // CPU
        cpu.stringValue = HardwareCollector.CPUString
        
        // RAM
        ram.stringValue = HardwareCollector.RAMString
        
        // GPU
        graphics.stringValue = HardwareCollector.GPUString
        
        // Display
        display.stringValue = HardwareCollector.DisplayString
        
        // Startup Disk
        startupDisk.stringValue = HardwareCollector.StartupDiskString
        
        // Serial Number
        serialNumber.stringValue = HardwareCollector.SerialNumberString
        
        // Bootloader Version (Optional)
        blVersion.stringValue = HardwareCollector.BootloaderString
        blVersion.isHidden = false
        
        
        func updateView() {
            picture.needsDisplay = true
            osVersion.needsDisplay = true
            systemVersion.needsDisplay = true
            macModel.needsDisplay = true
            cpu.needsDisplay = true
            ram.needsDisplay = true
            graphics.needsDisplay = true
            display.needsDisplay = true
            startupDisk.needsDisplay = true
            serialNumber.needsDisplay = true
            blVersion.needsDisplay = true
        }
    }
    @IBAction func showSystemReport(_ sender: NSButton) {
        print("Software Update...")
        _ = run("open /System/Library/SystemProfiler/SPPlatformReporter.spreporter")
    }
    @IBAction func showSoftwareUpdate(_ sender: NSButton) {
        _ = run("open /System/Library/PreferencePanes/SoftwareUpdate.prefPane")
    }
    
    @IBAction func showMoreInfo(_ sender: NSButton) {
        _ = run("open x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension")
    }
}

