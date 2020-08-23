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
        imageView.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configImage(breeds: Breeds){
        let url = breeds.image ?? "Erro"
            
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
                
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(named: "Erro")
                }
                print("Ocorreu um erro")
                return
            }
            
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
        
        })
            
        task.resume()
    }
    
    func configureImageView(){
        
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}

