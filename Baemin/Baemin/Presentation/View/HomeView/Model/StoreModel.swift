//
//  StoreModel.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

struct StoreModel {
    let image: UIImage
    let name: String
    let rating: Double
    let reviewCount: Int
    let discountPrice: String?
    let originalPrice: String?
}

extension StoreModel {
    static let mock: [StoreModel] = [
        StoreModel(
            image: UIImage(named: "image1") ?? UIImage(),
            name: "백억보쌈제육 신도림점",
            rating: 5.0,
            reviewCount: 1973,
            discountPrice: "12,000원",
            originalPrice: "16,000원"
        ),
        StoreModel(
            image: UIImage(named: "image2") ?? UIImage(),
            name: "ASAP PIZZA 구로디지털점",
            rating: 5.0,
            reviewCount: 862,
            discountPrice: nil,
            originalPrice: nil
        ),
        StoreModel(
            image: UIImage(named: "image3") ?? UIImage(),
            name: "도미노피자 구로점",
            rating: 4.8,
            reviewCount: 1248,
            discountPrice: "8,900원",
            originalPrice: "13,000원"
        ),
        StoreModel(
            image: UIImage(named: "image4") ?? UIImage(),
            name: "도미노피자 구로점",
            rating: 4.8,
            reviewCount: 1248,
            discountPrice: "8,900원",
            originalPrice: "13,000원"
        )
    ]
}
