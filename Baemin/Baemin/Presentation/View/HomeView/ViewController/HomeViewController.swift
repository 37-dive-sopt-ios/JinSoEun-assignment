//
//  HomeViewController.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

import UIKit

final class HomeViewController: UIViewController {

    private let homeView = HomeView()

    private var currentTab: HomeTabType = .delivery {
        didSet { updateCategoryData() }
    }

    private var categories: [CategoryModel] = CategoryModel.deliveryMock
    private var banners: [BannerModel] = BannerModel.mock

    override func loadView() {
        view = homeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        homeView.martView.items = MartCategoryModel.mock

    }

    private func setDelegate() {
        homeView.tabMenu.delegate = self
        homeView.categoryCollectionView.dataSource = self
        homeView.categoryCollectionView.delegate = self
        homeView.bannerCollectionView.dataSource = self        
    }

    private func updateCategoryData() {
        switch currentTab {
        case .delivery:
            categories = CategoryModel.deliveryMock
        case .pickup:
            categories = CategoryModel.pickupMock
        default:
            categories = []
        }
    }
}

extension HomeViewController: TabMenuViewDelegate {
    func didSelectTab(_ tab: HomeTabType) {
        currentTab = tab
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == homeView.categoryCollectionView { return categories.count }
        return banners.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if collectionView == homeView.categoryCollectionView {
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CategoryCell.identifier,
                for: indexPath
            ) as! CategoryCell
            cell.configure(categories[indexPath.item])
            return cell
        }

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: BannerCell.identifier,
            for: indexPath
        ) as! BannerCell
        cell.configure(banners[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == homeView.categoryCollectionView {
            let width = (collectionView.frame.width - 48) / 5
            return CGSize(width: width, height: 90)
        }
        return CGSize(width: 280, height: 160)
    }
}
