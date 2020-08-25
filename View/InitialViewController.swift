//
//  ViewController.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 13/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//


import UIKit

class InitialViewController: UIViewController, UISearchBarDelegate {

    let search = UISearchBar()

    var breeds = LoaderJson().itemData //All Json Data
    var item = Breeds() //Save the data of the item that will be passed to the description screen
    var breedsData = LoaderJson().itemData //Datas of the items that will be loaded in collectionView (change according to resarch)
    var section = 0
       
    let collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearch()
        view.backgroundColor = UIColor.init(named: "Teste")

        view.addSubview(collectionView)
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 450).isActive = true

        navButton()
    }

    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        breeds = LoaderJson().itemData //reload dos dados
    }

    func navButton() {
        //Cria um botão
        let Button = UIButton(type: .custom)
        Button.frame = CGRect(x: 0.0, y: 0.0, width: 50, height: 50)
        Button.setImage(UIImage(named:"list"), for: .normal)
        Button.addTarget(self, action: #selector(myRightSideBarButtonItemTapped(Button:_:)), for: UIControl.Event.touchUpInside)

        // Seta o botão modelo como um botão da Navigation Bar
        let BarButton = UIBarButtonItem(customView: Button)
        let currWidth = BarButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = BarButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        title = "Dog Breeds"
        self.navigationItem.rightBarButtonItem = BarButton
        navigationItem.hidesBackButton = true
    }

    //Connection of the list screen
    @objc func myRightSideBarButtonItemTapped(Button: UIButton,_ sender:UIBarButtonItem!) {
        let vc = ListBreedsViewController()
        self.navigationController?.pushViewController(vc, animated: false)

        }

    func configureSearch() {
        view.addSubview(search)

        search.placeholder = " Pesquise..."
        search.sizeToFit()
        search.isTranslucent = false
        search.backgroundImage = UIImage()
        search.delegate = self
        search.translatesAutoresizingMaskIntoConstraints = false
        search.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        search.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        search.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        breedsData = breeds
        section = selectedScope
        collectionView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.searchBar(searchBar, selectedScopeButtonIndexDidChange: section)
            collectionView.reloadData()
        } else {
            self.searchBar(searchBar, selectedScopeButtonIndexDidChange: section)
            breedsData = breedsData.filter({ itemData -> Bool in itemData.name!.lowercased().contains(searchText.lowercased())
            })
        }
              collectionView.reloadData() //atualiza a tableView
    }

}

extension InitialViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 330, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breedsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.item = breedsData[indexPath.row]
        let vc = BreedsDescriptionsViewController()
        vc.item = self.item
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        let itemcollection = breedsData [indexPath.row]
        cell.configImage(breeds: itemcollection)
        return cell
    }
}













