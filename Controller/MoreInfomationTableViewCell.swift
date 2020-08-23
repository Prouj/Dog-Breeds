//
//  MoreInfomationTableViewCell.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 20/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

//import UIKit
//class MoreInormationTableViewController: UITableViewCell {
//
//    let titleLabel = UILabel()
//    let infoLabel = UILabel()
// 
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureTitleLabel()
//        configureInfoLabel()
//      }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configureTitleLabel(){
//        addSubview(titleLabel)
//        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        titleLabel.numberOfLines = 0
//
//        //Constraints
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
//    }
//        
//    func configureInfoLabel(){
//        addSubview(infoLabel)
//        infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
//        infoLabel.numberOfLines = 0
//            
//        //Constraints
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
//        infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
//        infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
////        infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
//    }
//    
//    func configCell(breed: Breeds, row: Int){
//        switch row {
//        case 0:
//            titleLabel.text = "Expectativa de Vida"
//            infoLabel.text = breed.vida
////        case 1:
////            titleLabel.text = "Origem"
////            infoLabel.text = breed.origem
////        case 2:
////            titleLabel.text = "Altura"
////            infoLabel.text = breed.altura
////        case 3:
////            titleLabel.text = "Peso"
////            infoLabel.text = breed.peso
////        case 4:
////            titleLabel.text = "Cores"
////            infoLabel.text = breed.cores
////        case 5:
////            titleLabel.text = "Personalidade"
////            infoLabel.text = breed.personalidade
//
//        default:
//            break
//        }
//    }
//}
//
