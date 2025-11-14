//
//  StoreCardCell.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class StoreCardCell: UICollectionViewCell {

    static let identifier = "StoreCardCell"

    private let storeImageView = UIImageView()
    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let discountLabel = UILabel()
    private let originalPriceLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {

        storeImageView.do {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 12
            $0.clipsToBounds = true
            $0.backgroundColor = .lightGray
        }

        nameLabel.do {
            $0.font = .systemFont(ofSize: 14, weight: .semibold)
            $0.textColor = .black
            $0.numberOfLines = 2
        }

        ratingLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .gray
        }

        discountLabel.do {
            $0.font = .systemFont(ofSize: 15, weight: .bold)
            $0.textColor = .red
        }

        originalPriceLabel.do {
            $0.font = .systemFont(ofSize: 12)
            $0.textColor = .gray
        }

        contentView.addSubviews(
            storeImageView,
            nameLabel,
            ratingLabel,
            discountLabel,
            originalPriceLabel
        )
    }

    private func setLayout() {

        storeImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(130)
        }

        nameLabel.snp.makeConstraints {
            $0.top.equalTo(storeImageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview()
        }

        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview()
        }

        discountLabel.snp.makeConstraints {
            $0.top.equalTo(ratingLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }

        originalPriceLabel.snp.makeConstraints {
            $0.top.equalTo(discountLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }

    func configure(_ model: StoreModel) {

        storeImageView.image = model.image
        nameLabel.text = model.name

        ratingLabel.text = "\(model.rating) (\(model.reviewCount))"

        if let discount = model.discountPrice {
            discountLabel.text = discount
        } else {
            discountLabel.text = nil
        }

        originalPriceLabel.text = model.originalPrice
    }
}
