//
//  StoreSectionView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//


import UIKit

import SnapKit
import Then

final class StoreSectionView: UIView {

    private let titleLabel = UILabel()
    private let seeAllButton = UIButton()
    private let collectionView: UICollectionView

    var items: [StoreModel] = [] {
        didSet { collectionView.reloadData() }
    }

    override init(frame: CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {

        backgroundColor = .white
        
        titleLabel.do {
            $0.font = .systemFont(ofSize: 18, weight: .bold)
            $0.textColor = .black
        }

        seeAllButton.do {
            $0.setTitle("전체보기 >", for: .normal)
            $0.setTitleColor(.systemBlue, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 13)
        }

        collectionView.do {
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .clear
            $0.register(StoreCardCell.self, forCellWithReuseIdentifier: StoreCardCell.identifier)
            $0.dataSource = self
            $0.delegate = self
        }

        addSubviews(titleLabel, seeAllButton, collectionView)
    }

    private func setLayout() {

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }

        seeAllButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(titleLabel)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(220)   // 카드 높이
            $0.bottom.equalToSuperview()
        }
    }

    func configure(title: String, items: [StoreModel]) {
        self.titleLabel.text = title
        self.items = items
    }
}

extension StoreSectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int { items.count }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: StoreCardCell.identifier,
            for: indexPath
        ) as! StoreCardCell

        cell.configure(items[indexPath.item])
        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        return CGSize(width: 160, height: 220)
    }
}
