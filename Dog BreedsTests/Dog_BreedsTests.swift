//
//  Dog_BreedsTests.swift
//  Dog BreedsTests
//
//  Created by Paulo Uchôa on 12/08/20.
//  Copyright © 2020 Paulo Uchôa. All rights reserved.
//

import XCTest
@testable import Dog_Breeds

class Dog_BreedsTests: XCTestCase {
    
    func testLoaderJson() {

        let data = LoaderJson()

        let output = data.itemData
        let count = output.count

        XCTAssertEqual(count, 4)
    }

    func testTableForDescription() {

//        let table = ListBreedsViewController()
        let description = BreedsDescriptionsViewController()

//        let breeds = Breeds()

        let itemDescription = description.item

        XCTAssertNotNil(itemDescription)
//        XTC
    }
//    
    func testImage() {

        let headerView = HeaderView()

        let image = headerView.configImage(breeds: )
        
        XCTAssertNotNil(image)
    }
//    
    func testNetworking() {
        
        let headerView = HeaderView()
        let table = ListBreedsViewController()
        
        let item = table.item
        
        let url = headerView.configImage(breeds: item)
        
        XCTAssertNotNil(url)
        
    }
}
