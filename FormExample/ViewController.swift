//
//  ViewController.swift
//  FormExample
//
//  Created by Webdior Mac - 2 on 07/02/18.
//  Copyright © 2018 Raj Dhakate. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    static let cellIdentifier: String = "FieldCell"
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TextField", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: ViewController.cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = tableView.dequeueReusableCell(withIdentifier: ViewController.cellIdentifier, for: indexPath) as! TextField
        field.fieldHeight = 40
//        field.lineCustomColor = .red
//        field.button.setTitle("Reload", for: .normal)
//        field.buttonAlignment = .left
        return field
    }
}

