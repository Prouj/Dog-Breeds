//
//  InformationTableViewCell.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 17/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

//import UIKit
////
//class InformationTableViewCell: UITableViewCell {
//    
//    static let identifier = "InformationTableViewCell"
//        let titleLabel = UILabel()
//        let infoLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        configureTitleLabel()
//        configureInfoLabel()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configureTitleLabel(){
//        addSubview(titleLabel)
//        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
//        titleLabel.numberOfLines = 0
//
//        //Constraints
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
//        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
//    }
//        
//    func configureInfoLabel(){
//        addSubview(infoLabel)
//        infoLabel.font = UIFont.systemFont(ofSize: 17, weight: .regular)
//        infoLabel.numberOfLines = 0
//          
//
//          //Constraints
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
//        infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
//        infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
//    }
//
//    func configCell(breed: Breeds){
//        titleLabel.text = breed.name
//        infoLabel.text = breed.descripition
//    }
//}
