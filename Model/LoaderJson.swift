//
//  LoaderJson.swift
//  Dog Breeds
//
//  Created by Paulo Uchôa on 12/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import Foundation

public class LoaderJson {

    @Published var itemData = [Breeds]()

    let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let mainDirectory = Bundle.main.resourceURL!

    init(){
        
        load()
        sort()
    }
//
    func loadInicial() {
        if let fileLocation = Bundle.main.url(forResource: "Descripitions", withExtension: "json") {
            do{
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson = try jsonDecoder.decode([Breeds].self, from: data)

                self.itemData = dataFromJson

                save(update: self.itemData)
            } catch {
                print (error)
            }
        }
    }
    
    //Função que carrega o arquivo json
    func load() {

        do {
            let data = try Data(contentsOf: mainDirectory.appendingPathComponent("Descriptions.json"))
            let jsonDecoder = JSONDecoder()
            let dataFromJson = try jsonDecoder.decode([Breeds].self, from: data)

            self.itemData = dataFromJson
        } catch {
            print (error)
        }

    }
    //Salva o json com as alterações feitas
    func save(update: [Breeds]) {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(update)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            let data = Data(json!.utf8)

            do {
                if FileManager.default.fileExists(atPath: directory.appendingPathComponent("Descriptions.json").relativePath) {
                    try data.write(to: URL(fileURLWithPath: directory.appendingPathComponent("Descriptions.json").relativePath))
                } else {
                    FileManager.default.createFile(atPath: directory.appendingPathComponent("Descriptions.json").relativePath, contents: data, attributes: [:])
                }

                load()

            } catch {
                print(error.localizedDescription)
            }
        } catch {
            print(error)
        }

    }
    
    //Ordena os nomes em ordem alfabética
    func sort() {
    
    self.itemData = self.itemData.sorted {
        var isSorted = false
        if let first = $0.name, let second = $1.name {
            isSorted = first < second
        }
        return isSorted
        }
    }
}
