//
//  BMartBannerView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class BMartBannerView: UIView {

    private let bmartLogoImage = UIImageView()
    private let titleLabel = UILabel()
    private let moreIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {
        
        backgroundColor = .baeminMint300
        addSubviews(bmartLogoImage, titleLabel, moreIcon)

        bmartLogoImage.do {
            $0.image = UIImage(named: "ic_bmart")
        }
        
        titleLabel.do {
            $0.text = "전상품 쿠폰팩 + 60%특가"
            $0.font = .pretendard(.head_b_18)
            $0.textColor = .black
        }
        
        moreIcon.do {
            $0.image = UIImage(named: "ic_chevron_right")
        }
    }

    private func setLayout() {
        bmartLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(16)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(bmartLogoImage.snp.bottom).offset(4)
            $0.leading.equalTo(bmartLogoImage)
            $0.height.equalTo(17)
        }
        
        moreIcon.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(2)
            $0.size.equalTo(12)
        }
    }
}
