//
//  ViewController.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 12/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import UIKit

class BreedsDescripitionViewController: UIViewController {
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

extension DescricaoRacaViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
