//
//  BannerCell.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit

final class BannerCell: UICollectionViewCell {

    static let identifier = "BannerCell"

    private let bannerView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(_ model: BannerModel) {
        bannerView.backgroundColor = model.color
    }

    private func setUI() {
        contentView.addSubview(bannerView)
    }

    private func setLayout() {
        bannerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
