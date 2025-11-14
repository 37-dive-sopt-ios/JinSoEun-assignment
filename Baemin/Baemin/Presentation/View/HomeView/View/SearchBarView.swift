//
//  SearchBarView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//


import UIKit

import SnapKit
import Then

final class SearchBarView: UIView {

    let textField = UITextField()
    private let searchIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {
        backgroundColor = .white
        layer.cornerRadius = 20
        layer.borderColor = UIColor(.baeminBlack).cgColor
        layer.borderWidth = 1

        addSubviews(searchIcon, textField)
        
        searchIcon.do {
            $0.image = UIImage(resource: .icSearch)
            $0.tintColor = .darkGray
        }

        textField.do {
            $0.placeholder = "찾아라! 맛있는 음식과 맛집"
            $0.font = .pretendard(.body_r_14)
            $0.setPlaceholder(color: .baeminGray300)
        }
    }

    private func setLayout() {
        searchIcon.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(17)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(20)
        }

        textField.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(17)
            $0.verticalEdges.equalToSuperview().inset(8)
        }
    }
}
