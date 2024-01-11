//
//  Dog.swift
//  bark
//
//  Created by Anagha K J on 10/01/24.
//

import Foundation

struct Dog: Decodable {
    let id: Int?
    let name: String?
    let reference_image_id: String?
    let bred_for: String?
}

struct Image: Decodable {
    let id: String?
    var url: String?
}
