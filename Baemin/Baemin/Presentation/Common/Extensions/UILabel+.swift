//
//  UILabel+.swift
//  Baemin
//
//  Created by 진소은 on 11/7/25.
//

import UIKit

extension UILabel {
    func applyStyle(
        text: String? = nil,
        font: UIFont,
        textColor: UIColor = .baeminBlack,
        alignment: NSTextAlignment = .center,
        numberOfLines: Int = 1
    ) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.numberOfLines = numberOfLines
    }
}
