//
//  ContentView.swift
//  Storm Viewer
//
//  Created by Jackson Barnes on 24/12/2020.
//

import UIKit

class ViewController: UIViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            pictures.append(item)
        }
    }
}
