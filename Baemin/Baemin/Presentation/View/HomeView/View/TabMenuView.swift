//
//  TabMenuView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

protocol TabMenuViewDelegate: AnyObject {
    func didSelectTab(_ tab: HomeTabType)
}

final class TabMenuView: UIView {

    weak var delegate: TabMenuViewDelegate?
    
    // MARK: - Properties
    
    private var isInitialLayoutDone = false

    // MARK: - UI Components
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let underline = UIView()

    private var buttons: [UIButton] = []

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        if !isInitialLayoutDone {
            isInitialLayoutDone = true
            selectTab(.delivery, animated: false)
        }
    }

    private func setUI() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addSubview(underline)
        backgroundColor = .white

        scrollView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.alwaysBounceHorizontal = true
        }

        stackView.do {
            $0.axis = .horizontal
            $0.spacing = 16

        }

        underline.do {
            $0.backgroundColor = .black
            $0.layer.cornerRadius = 2
        }

        HomeTabType.allCases.forEach { tab in
            let button = UIButton(type: .custom)
            button.setTitle(tab.title, for: .normal)
            button.tag = tab.rawValue

            button.setTitleColor(.gray, for: .normal)
            button.setTitleColor(.black, for: .selected)
            button.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
            button.titleLabel?.lineBreakMode = .byClipping   // 말줄임표 X

            button.addTarget(self, action: #selector(didTapTab(_:)), for: .touchUpInside)

            stackView.addArrangedSubview(button)
            buttons.append(button)
        }
    }

    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalToSuperview()
        }

        underline.snp.makeConstraints {
            $0.height.equalTo(3)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(0)
        }
    }

    @objc
    private func didTapTab(_ sender: UIButton) {
        guard let tab = HomeTabType(rawValue: sender.tag) else { return }
        selectTab(tab, animated: true)
        delegate?.didSelectTab(tab)
    }

    func selectTab(_ tab: HomeTabType, animated: Bool = true) {
        guard buttons.indices.contains(tab.rawValue) else { return }

        let selectedButton = buttons[tab.rawValue]

        buttons.forEach { $0.isSelected = false }
        selectedButton.isSelected = true

        layoutIfNeeded()

        underline.snp.remakeConstraints {
            $0.height.equalTo(3)
            $0.bottom.equalTo(stackView.snp.bottom)
            $0.leading.equalTo(selectedButton.snp.leading)
            $0.width.equalTo(selectedButton.snp.width)
        }

        let animations = {
            self.layoutIfNeeded()
        }

        if animated {
            UIView.animate(withDuration: 0.25, animations: animations)
        } else {
            animations()
        }

        let buttonFrameInScroll = selectedButton.convert(selectedButton.bounds, to: scrollView)
        let targetX = buttonFrameInScroll.midX - self.bounds.width / 2
        let maxOffsetX = max(scrollView.contentSize.width - scrollView.bounds.width, 0)
        let finalOffsetX = min(max(targetX, 0), maxOffsetX)

        scrollView.setContentOffset(CGPoint(x: finalOffsetX, y: 0), animated: animated)
    }
}
