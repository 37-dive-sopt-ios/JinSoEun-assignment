//
//  BannerModel.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

struct BannerModel {
    let color: UIColor
}

extension BannerModel {
    static let mock: [BannerModel] = [
        .init(color: .systemYellow),
        .init(color: .systemRed),
        .init(color: .systemBlue),
        .init(color: .systemGreen)
    ]
}
