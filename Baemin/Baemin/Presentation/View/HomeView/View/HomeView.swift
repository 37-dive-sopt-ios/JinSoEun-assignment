//
//  HomeView.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

import SnapKit
import Then

final class HomeView: UIView {

    let scrollView = UIScrollView()
    let contentView = UIView()

    let headerView = LocationHeaderView()
    let searchBar = SearchBarView()
    let bmartBanner = BMartBannerView()
    let tabMenu = TabMenuView()
    let martView = MartCategoryView()
    let rankingView = StoreSectionView()
    let recentOrderView = StoreSectionView()
    let discountView = StoreSectionView()

    let categoryCollectionView: UICollectionView
    let bannerCollectionView: UICollectionView

    override init(frame: CGRect) {

        let categoryLayout = UICollectionViewFlowLayout()
        categoryLayout.minimumInteritemSpacing = 12
        categoryLayout.minimumLineSpacing = 16

        categoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: categoryLayout)

        let bannerLayout = UICollectionViewFlowLayout()
        bannerLayout.scrollDirection = .horizontal
        bannerLayout.minimumLineSpacing = 0
        bannerLayout.minimumInteritemSpacing = 0
        bannerLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 120)

        bannerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: bannerLayout)
        bannerCollectionView.isPagingEnabled = true

        super.init(frame: frame)
        setUI()
        setLayout()
        
        rankingView.configure(title: "우리 동네 한그릇 인기 랭킹", items: StoreModel.mock)
        recentOrderView.configure(title: "최근에 주문했어요", items: StoreModel.mock)
        discountView.configure(title: "무조건 할인하는 가게", items: StoreModel.mock)
    }

    required init?(coder: NSCoder) { fatalError() }

    private func setUI() {

        addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.showsVerticalScrollIndicator = false
        
        self.backgroundColor = .baeminBackgroundWhite
        categoryCollectionView.backgroundColor = .white
        
        contentView.addSubviews(headerView,searchBar,bmartBanner,tabMenu,categoryCollectionView,martView, bannerCollectionView, rankingView, recentOrderView, discountView)

        categoryCollectionView.do {
            $0.backgroundColor = .clear
            $0.isScrollEnabled = false
            $0.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.identifier)
        }

        bannerCollectionView.do {
            $0.backgroundColor = .clear
            $0.showsHorizontalScrollIndicator = false
            $0.register(BannerCell.self, forCellWithReuseIdentifier: BannerCell.identifier)
        }
    }

    private func setLayout() {

        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }

        searchBar.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }

        bmartBanner.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(90)
        }

        tabMenu.snp.makeConstraints {
            $0.top.equalTo(bmartBanner.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }

        categoryCollectionView.snp.makeConstraints {
            $0.top.equalTo(tabMenu.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(220)
        }
        
        martView.snp.makeConstraints {
            $0.top.equalTo(categoryCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(150)
        }

        bannerCollectionView.snp.makeConstraints {
            $0.top.equalTo(martView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        rankingView.snp.makeConstraints {
            $0.top.equalTo(bannerCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        recentOrderView.snp.makeConstraints {
            $0.top.equalTo(rankingView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        discountView.snp.makeConstraints {
            $0.top.equalTo(recentOrderView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(300)
            $0.bottom.equalToSuperview().inset(40)
        }
        
    }
}
