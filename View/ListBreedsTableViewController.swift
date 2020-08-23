//
//  ListBreedsTableViewController.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 13/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import UIKit

class ListBreedsViewController: UIViewController, UISearchBarDelegate {
    
    let tableView = UITableView()
    let search = UISearchBar()
    var segmentedControl = UISegmentedControl()
    
    var breeds = LoaderJson().itemData //Todos os dados do Json
    var item = Breeds() //Salva os dados do item que vai ser passado pra tela de descrição
    var breedsData = LoaderJson().itemData //Dados dos itens que vão ser carregados na tableView (altera de acordo com a pesquisa)
    var section: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        loadSection()
        NavButton()
        configureSearch()
        configureTableView()
        configSegmentedControl()
//        navigationItem.title = "Dog Breeds"
        
    }
    
    //Creates the button
    func NavButton() {
        let Button = UIButton(type: .custom)
        Button.frame = CGRect(x: 0.0, y: 0.0, width: 50, height: 50)
        Button.setImage(UIImage(named:"collection"), for: .normal)
        Button.addTarget(self, action: #selector(myRightSideBarButtonItemTapped), for: UIControl.Event.touchUpInside)

        // Seta o botão modelo como um botão da Navigation Bar
        let BarButton = UIBarButtonItem(customView: Button)
        let currWidth = BarButton.customView?.widthAnchor.constraint(equalToConstant: 30)
        currWidth?.isActive = true
        let currHeight = BarButton.customView?.heightAnchor.constraint(equalToConstant: 30)
        currHeight?.isActive = true
        navigationItem.title = "Dog Breeds"
        self.navigationItem.rightBarButtonItem = BarButton
        navigationItem.hidesBackButton = true
    }
    
    //Conecta a tela de collection
    @objc func myRightSideBarButtonItemTapped() {
        let vc = InitialViewController()
        self.navigationController?.pushViewController(vc, animated: false)
    }
    

    override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
        breeds = LoaderJson().itemData //reload dos dados
        loadSection()
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: search.bottomAnchor,constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configureSearch() {
        view.addSubview(search)
        search.placeholder = " Pesquise..."
        search.sizeToFit()
        search.isTranslucent = false
        search.backgroundImage = UIImage()
        search.showsCancelButton = false
        search.delegate = self
        search.translatesAutoresizingMaskIntoConstraints = false
        search.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        search.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        search.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        let tapKey: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Keyboard))
//        view.addGestureRecognizer(tapKey)
    }
    
//    @objc func Keyboard() {
//        view.endEditing(true)
//    }

    
    func configSegmentedControl() {
        let section = ["Todos", "Favoritos"]
        segmentedControl = UISegmentedControl(items: section)
        segmentedControl.backgroundColor = UIColor(red: 255/255, green: 240/255, blue: 210/255, alpha: 1)
        segmentedControl.selectedSegmentTintColor = UIColor(red: 217/255, green: 124/255, blue: 46/255, alpha: 1)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = segmentedControl
        segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
    
       segmentedControl.addTarget(self, action: #selector(ListBreedsViewController.segmentedButtomTapped(sender:)), for: .valueChanged)
        loadSection()
    }
    
    @objc func segmentedButtomTapped(sender: UISegmentedControl) {
        if section == 0 {
            section = 1
            loadSection()
        } else {
            section = 0
            loadSection()
        }
    }
    
    //Configuration of the search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.searchBar(searchBar, selectedScopeButtonIndexDidChange: section)
            tableView.reloadData()
        } else {
            self.searchBar(searchBar, selectedScopeButtonIndexDidChange: section)
            breedsData = breedsData.filter({ itemData -> Bool in itemData.name!.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData() //atualiza a tableView
    }
    
    

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case 0:
            breedsData = breeds
        case 1:
            breedsData = breeds.filter({ itemData -> Bool in
                itemData.favorite!
            })
        default:
            break
        }
        section = selectedScope
        tableView.reloadData()
    }
    
    //Load the scope and data that will appear in the table view
    func loadSection() {
        self.searchBar(search, selectedScopeButtonIndexDidChange: section)
        search.selectedScopeButtonIndex = section
        tableView.reloadData()
    }
}

extension ListBreedsViewController: UITableViewDelegate, UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breedsData.count
    }

    //Identifica a celula selecionada
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.item = breedsData[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = BreedsDescriptionsViewController()
        vc.item = self.item
        self.navigationController?.pushViewController(vc, animated: false)
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell = UITableViewCell()

        if cell.detailTextLabel == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }

        cell.textLabel?.text = breedsData[indexPath.row].name //Indica qual nome do array será printado

        let indicator = UIImage(named: "Indicator.pdf")  // Importa uma imagem personalizada do diclosureIndicator, pois o mesmo não pode ser editado
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView = UIImageView(image: indicator!)

        return cell

    }
}
    





    

