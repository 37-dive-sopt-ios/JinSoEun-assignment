//
//  MartCategoryModel.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

struct MartCategoryModel {
    let image: UIImage
    let title: String
}

extension MartCategoryModel {
    static let mock: [MartCategoryModel] = [
        .init(image: UIImage(named: "image1") ?? UIImage(), title: "B마트"),
        .init(image: UIImage(named: "image2") ?? UIImage(), title: "CU"),
        .init(image: UIImage(named: "image3") ?? UIImage(), title: "이마트슈퍼"),
        .init(image: UIImage(named: "image4") ?? UIImage(), title: "홈플러스"),
        .init(image: UIImage(named: "image5") ?? UIImage(), title: "GS25"),
        .init(image: UIImage(named: "image6") ?? UIImage(), title: "이마트24"),
    ]
}
