//
//  ViewController.swift
//  Exam Local Database
//
//  Created by Choudhary Dipika on 12/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        FMDB.createFile()
    }

    @IBAction func addDataButton(_ sender: UIButton) {
        if let x = idTextField.text, let y = Int(x)
        {
            FMDB.addData(id: y, name: nameTextField.text!)
        }
    }
    
    @IBAction func deleteDataButton(_ sender: UIButton) {
        if let x = idTextField.text, let y = Int(x)
        {
            FMDB.deleteData(id: y)
        }
    }
    
    
    @IBAction func getDataButton(_ sender: UIButton) {
        let navigate = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(navigate, animated: true)
    }
}

