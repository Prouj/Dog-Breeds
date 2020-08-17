//
//  ViewController.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 12/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import UIKit
//
class BreedsDescriptionsViewController: UIViewController {
    
    let tableview = UITableView()
    
    var item = Breeds()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTableView()
        navButton()
        configureTableHeader()
    }
    
    func navButton() {
        
        // Cria um botão modelo e suas configurações
        let favButton = UIButton(type: .custom)
        favButton.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
        if item.favorite == false {
            favButton.setImage(UIImage(named:"Favorite"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "Favorite-select"), for: .normal)
        }
            
        favButton.setImage(UIImage(named:"Favorite"), for: .normal)
        favButton.addTarget(self, action: #selector(myRightSideBarButtonItemTapped(favButton:_:)), for: UIControl.Event.touchUpInside)
                  
        // Seta o botão modelo como um botão da Navigation Bar
        let favBarButton = UIBarButtonItem(customView: favButton)
        let currWidth = favBarButton.customView?.widthAnchor.constraint(equalToConstant: 24)
        currWidth?.isActive = true
        let currHeight = favBarButton.customView?.heightAnchor.constraint(equalToConstant: 24)
        currHeight?.isActive = true
        self.navigationItem.rightBarButtonItem = favBarButton
    }
    
    @objc func myRightSideBarButtonItemTapped(favButton: UIButton,_ sender:UIBarButtonItem!) {
//        item.favorite = !item.favorite!
//        if item.favorite == false {
//            favButton.setImage(UIImage(named:"Favorite"), for: .normal)
//        } else {
//            favButton.setImage(UIImage(named: "Favorite-Selected"), for: .normal)
//        }

//        var data = LoaderJson().itemData
//        for i in 0...data.count {
//            if data[i].name == item.name {
//                data[i].favorite = item.favorite
//                break
//            }
//        }
    }
    
    func configureTableHeader(){
        let tableHeader = HeaderView(frame: CGRect(x:0, y: 0, width: view.frame.size.width, height: 232))
        tableHeader.set(breeds: item)
        tableview.tableHeaderView = tableHeader
    }
    
    func configureTableView(){
        view.addSubview(tableview)
        setTableViewDelegates()
        tableview.rowHeight = 100
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.sectionHeaderHeight = 100
        tableview.allowsSelection = false
        tableview.separatorStyle = .none
        tableview.contentInsetAdjustmentBehavior = .never
        
    }
    
    func setTableViewDelegates(){
        tableview.delegate = self
        tableview.dataSource = self
    }


}

extension BreedsDescriptionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
        
    
    }
}
