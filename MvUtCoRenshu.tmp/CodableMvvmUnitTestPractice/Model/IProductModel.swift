//
//  IProductModel.swift
//  CodableMvvmUnitTestPractice
//
//  Created by Jerry Ren on 8/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct IProductModel: Codable {
    let results: [ProductResult]
}

struct ProductResult: Codable {
    let trackName: String
    let sellerUrl: String?
    let description: String
}


