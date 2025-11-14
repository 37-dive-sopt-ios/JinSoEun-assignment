//
//  LocationHeaderView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class LocationHeaderView: UIView {

    
    private let locationStack = UIStackView()
    private let locationLabel = UILabel()
    private let moreButton = UIButton()
    
    private let iconStack = UIStackView()
    private let couponButton = UIButton()
    private let notificationButton = UIButton()
    private let cartButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {

        addSubviews(locationStack, iconStack)
        
        locationStack.do {
            $0.axis = .horizontal
            $0.spacing = 3
            $0.addArrangedSubviews(locationLabel, moreButton)
        }
        
        locationLabel.applyStyle(text: "우리집", font: .pretendard(.head_b_18))
        
        moreButton.do {
            $0.setImage(UIImage(named: "ic_toggle_down"), for: .normal)
        }
        
        iconStack.do {
            $0.axis = .horizontal
            $0.spacing = 12
            $0.addArrangedSubviews(couponButton, notificationButton, cartButton)
        }

        couponButton.setImage(UIImage(named: "ic_discount"), for: .normal)
        notificationButton.setImage(UIImage(named: "ic_notification"), for: .normal)
        cartButton.setImage(UIImage(named: "ic_cart"), for: .normal)
    }

    private func setLayout() {
        locationStack.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }

        iconStack.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(locationStack)
        }
    }
}
