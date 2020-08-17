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
//    let collection = UICollectionView()
    
    
    var breeds = LoaderJson().itemData //Todos os dados do Json
    var item = Breeds() //Salva os dados do item que vai ser passado pra tela de descrição
    var breedsData = LoaderJson().itemData //Dados dos itens que vão ser carregados na tableView (altera de acordo com a pesquisa)
    var section:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
//        loadSection()
//        configureCollection()
        configureSearch()
    }
    
    //Conetar a tela de lista
    @objc func myRightSideBarButtonItemTapped(Button: UIButton,_ sender:UIBarButtonItem!) {
        let vc = ListBreedsViewController()
        self.navigationController?.pushViewController(vc, animated: false)
       
        print("press")
    }
    
    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        breeds = LoaderJson().itemData //reload dos dados
//        loadSection()
    }

    
    
//    func configureCollection(){
//        view.addSubview(collection)
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        collection.topAnchor.constraint(equalTo: search.topAnchor, constant: 0).isActive = true
//        collection.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
//        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        collection.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
    
    
    
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
//        search.bottomAnchor.constraint(equalTo: collection.bottomAnchor).isActive = true
    }
        
        
//        override func prepare(for segue: UIViewController, sender: Any?) {
//            let descricao = segue.destination as! BreedsDescriptionViewController
//            descricao.item = item
//        }
        

//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            if searchText.isEmpty {
//                self.searchBar(searchBar, selectedScopeButtonIndexDidChange: section!)
//                collection.reloadData()
//            } else {
//                self.searchBar(searchBar, selectedScopeButtonIndexDidChange: section!)
//                breedsData = breedsData.filter({ itemData -> Bool in itemData.name!.lowercased().contains(searchText.lowercased())
//                })
//            }
//            collection.reloadData() //atualiza a tableView
//        }

//            func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//                switch selectedScope {
//                case 0:
//                    breedsData = breeds
//                case 1:
//                    breedsData = breeds.filter({ itemData -> Bool in
//                        itemData.favorite!
//                    })
//                default:
//                    break
//                }
//                section = selectedScope
//                collection.reloadData()
//            }
//
//               //carrega o escopo e os dados que vão aparecer na table view
//               func loadSection() {
//                   self.searchBar(search, selectedScopeButtonIndexDidChange: section ?? 0)
//                   search.selectedScopeButtonIndex = section ?? 0
//                   collection.reloadData()
//               }

}
//
//extension InitialViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 2
//    }
//    
//    func colle
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return UICollectionViewCell()
//    }
//}

