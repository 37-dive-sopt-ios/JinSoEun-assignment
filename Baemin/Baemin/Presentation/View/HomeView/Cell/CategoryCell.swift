//
//  CategoryCell.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class CategoryCell: UICollectionViewCell {

    static let identifier = "CategoryCell"

    private let imageView = UIImageView()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(_ model: CategoryModel) {
        imageView.image = model.image
        titleLabel.text = model.title
    }

    private func setUI() {
        contentView.addSubviews(imageView, titleLabel)

        imageView.do {
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 22
            $0.backgroundColor = .baeminGray200
            $0.contentMode = .scaleAspectFill
        }

        titleLabel.applyStyle(font: .pretendard(.body_r_14))
    }

    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(60)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(6)
            $0.centerX.equalToSuperview()
        }
    }
}
