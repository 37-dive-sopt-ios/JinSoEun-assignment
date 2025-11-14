//
//  CategoryModel.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

struct CategoryModel {
    let image: UIImage
    let title: String
}

extension CategoryModel {
    static let deliveryMock: [CategoryModel] = [
        .init(image: UIImage(named: "image1") ?? UIImage(), title: "한그릇"),
        .init(image: UIImage(named: "image2") ?? UIImage(), title: "치킨"),
        .init(image: UIImage(named: "image3") ?? UIImage(), title: "카페·디저트"),
        .init(image: UIImage(named: "image4") ?? UIImage(), title: "피자"),
        .init(image: UIImage(named: "image5") ?? UIImage(), title: "분식"),
        .init(image: UIImage(named: "image6") ?? UIImage(), title: "고기"),
        .init(image: UIImage(named: "image7") ?? UIImage(), title: "찜·탕"),
        .init(image: UIImage(named: "image8") ?? UIImage(), title: "야식"),
        .init(image: UIImage(named: "image9") ?? UIImage(), title: "패스트푸드"),
        .init(image: UIImage(named: "image10") ?? UIImage(), title: "픽업")
    ]

    static let pickupMock: [CategoryModel] = [
        .init(image: UIImage(named: "image1") ?? UIImage(), title: "카페"),
        .init(image: UIImage(named: "image2") ?? UIImage(), title: "샌드위치"),
        .init(image: UIImage(named: "image3") ?? UIImage(), title: "분식")
    ]
}
