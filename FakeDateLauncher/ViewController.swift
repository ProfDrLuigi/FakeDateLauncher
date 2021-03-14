//
//  ViewController.swift
//  FakeDate
//
//  Created by Prof. Dr. Luigi on 14.03.21.
//

import Cocoa

class ViewController: NSViewController {

    
    let scriptPath = Bundle.main.path(forResource: "/script/script", ofType: "command")!
    
    //self.syncShellExec(path: self.scriptPath, args: ["_start_app"])
    
    //UserDefaults.standard.removeObject(forKey: "SelectedDate")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let input = "12/10/2018"
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        if let date = formatter.date(from: input) {
          print(date)  // Prints:  2018-12-10 06:00:00 +0000
        }

        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func reset_selection(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "SelectedDate")
    }
    
    func syncShellExec(path: String, args: [String] = []) {
        let process            = Process()
        process.launchPath     = "/bin/bash"
        process.arguments      = [path] + args
        process.launch() // Start process
        process.waitUntilExit() // Wait for process to terminate.
    }

}

