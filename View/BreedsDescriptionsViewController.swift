//
//  ViewController.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 12/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

//import UIKit
//
class BreedsDescripitionsViewController: UIViewController {
    
    let tableview = UITableView()
    
    var breeds = LoaderJson().itemData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        configureTableView()
    }
    
    func configureTableView(){
        view.addSubview(tableview)
        setTableViewDelegates()
        tableview.rowHeight = 100
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setTableViewDelegates(){
        tableview.delegate = self
        tableview.dataSource = self
    }


}

extension BreedsDescripitionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
        
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    
    }
}
