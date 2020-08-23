//
//  File.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 12/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import Foundation

//Struct Breeds que guardas as variáveis que compõem cada item do json Description
struct Breeds: Codable {
    var name: String?
    var descripition: String?
    var vida: String?
    var origem: String?
    var altura: String?
    var peso: String?
    var cores: String?
    var personalidade: String?
    var source: String?
    var image: String?
    var favorite: Bool?
}
