//
//  MainModel.swift
//  GeeksBar
//
//  Created by Abdylda Mamashev on 8/4/24.
//

import UIKit

struct carss: Decodable {
    var id: Int
    var make: String
    var model: String
    var year: Int
    var color: String
    var mileage: Int
    var price: Int
    var fuelType: String
    var transmission: String
    var engine: String
    var horsepower: Int
    var features: [String]
    var owners: Int
    var image: String
}


