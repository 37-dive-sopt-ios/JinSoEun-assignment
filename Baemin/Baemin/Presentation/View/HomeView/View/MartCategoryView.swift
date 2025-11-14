//
//  MartCategoryView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class MartCategoryView: UIView {

    private let collectionView: UICollectionView

    var items: [MartCategoryModel] = [] {
        didSet { collectionView.reloadData() }
    }

    override init(frame: CGRect) {

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {
        addSubviews(collectionView)
        backgroundColor = .white

        collectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.dataSource = self
            $0.delegate = self
            $0.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        }
    }

    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
            $0.bottom.equalToSuperview()
        }
    }
}

extension MartCategoryView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.identifier,
            for: indexPath
        ) as! CategoryCell

        cell.configure(.init(image: items[indexPath.item].image,
                             title: items[indexPath.item].title))
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: 70, height: 100)
    }
}
