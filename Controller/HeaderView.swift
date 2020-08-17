//
//  TableViewCell.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 15/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        configureImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(breeds: Breeds){
        self.imageView.image = UIImage(named: breeds.image ?? "Erro-2")
    }
    
    func configureImageView(){
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
    }

}

