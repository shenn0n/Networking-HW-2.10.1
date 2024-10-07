//
//  ViewController.swift
//  Networking HW 2.10.1
//
//  Created by Александр Манжосов on 07.10.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "urlSegue" {
            let tableVC = segue.destination as! TableViewController
            tableVC.fetchData()
        }
    }
}

