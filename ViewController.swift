//
//  ViewController.swift
//  Connect_To_Server
//
//  Created by Matthew Jacobsen on 6/6/21.
//

import UIKit

class ViewController: UIViewController {
    var recently_created_file = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var ls: UILabel!
    @IBAction func call_ls(_ sender: Any) {
        APIFunctions().ls { txt in
            self.ls.text = txt
        }
    }
    @IBAction func cat(_ sender: Any) {
        APIFunctions().cat(file: recently_created_file) { txt in
            self.ls.text = txt
        }
    }
    
    @IBOutlet weak var text_box_name: UITextField!
    @IBAction func call_vim(_ sender: Any) {
        let name_str: String = text_box_name.text!
        recently_created_file = text_box_name.text!
        if name_str != "" {
            APIFunctions().vim(name: name_str)
            text_box_name.text! = ""
        }
    }
    
    @IBOutlet weak var append_txt: UITextField!
    @IBAction func append(_ sender: Any) {
        let append_str: String = append_txt.text!
        if append_str != "" && recently_created_file != "" {
            APIFunctions().append(str: append_str, file: recently_created_file)
            append_txt.text! = ""
        }
    }
}

