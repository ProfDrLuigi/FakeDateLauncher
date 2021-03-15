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
        
        print(Date())
        let check_date = UserDefaults.standard.object(forKey: "SelectedDate")
        if check_date == nil{
            UserDefaults.standard.set(Date(), forKey: "SelectedDate")
            let str = String(decoding: Data(), as: UTF8.self)
            UserDefaults.standard.set(str, forKey: "Bla")
        }
       
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func reset_selection(_ sender: Any) {
        UserDefaults.standard.set(Date(), forKey: "SelectedDate")
    }
    
    @IBAction func start_app(_ sender: Any) {
        self.syncShellExec(path: self.scriptPath, args: ["_start_app"])
    }
    
    func syncShellExec(path: String, args: [String] = []) {
        let process            = Process()
        process.launchPath     = "/bin/bash"
        process.arguments      = [path] + args
        process.launch() // Start process
        process.waitUntilExit() // Wait for process to terminate.
    }

    
}

