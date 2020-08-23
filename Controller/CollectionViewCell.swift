//
//  CollectionViewCell.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 21/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    let bg: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        return iv
    }()
    
//    let title: UILabel = {
//        let tt = UILabel()
//        tt.
//    }
    
    func configImage(breeds: Breeds){
        
        let url = breeds.image ?? "Erro"
            
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
                
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    self.bg.image = UIImage(named: "Erro")
                }
                print("Ocorreu um erro")
                return
            }
            
                DispatchQueue.main.async {
                    self.bg.image = UIImage(data: data)
                }
        
        })
            
        task.resume()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    
        contentView.addSubview(bg)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


