//
//  WelcomeViewController.swift
//  Baemin
//
//  Created by 진소은 on 10/31/25.
//

import UIKit

import SnapKit
import Then

final class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    var name: String?
    
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar(title: "화녕해요")
    private let welcomeImageView = UIImageView()
    private let welcomeLabel = UILabel()
    private let userLabel = UILabel()
    private lazy var gotoHomeButton = CTAButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        view.backgroundColor = .white
        
        navigationBar.onBackButtonTapped = { [weak self] in
            self?.navigationController?.popViewController(animated: true)
        }
        
        welcomeImageView.do {
            $0.image = UIImage(named: "img_welcome")
        }
        
        welcomeLabel.applyStyle(text: "환영합니다", font: .pretendard(.head_b_24))
        
        gotoHomeButton.configure(style: .active, title: "메인으로 가기")
        gotoHomeButton.do {
            $0.addTarget(self, action: #selector(homeButtonDidTapped), for: .touchUpInside)
        }
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        view.addSubviews(navigationBar, welcomeImageView, welcomeLabel, userLabel, gotoHomeButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(42)
        }
        
        welcomeImageView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(211)
        }
        
        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        userLabel.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(16)
            $0.horizontalEdges.centerX.equalToSuperview()
        }
        
        gotoHomeButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(48)
            $0.height.equalTo(52)
        }
    }
    
    // MARK: - Public Methods
    
    public func setName(name: String?) {
        self.name = name
        self.userLabel.applyStyle(text: "\(name ?? "nil")님 \n반가워요!", font: .pretendard(.title_sb_18), numberOfLines: 0)
    }
    
    // MARK: - Actions
    
    @objc
    func homeButtonDidTapped() {
        let nav = UINavigationController(rootViewController: HomeViewController())
        UIApplication.shared.windows.first?.rootViewController = nav
    }
}

#Preview {
    WelcomeViewController()
}
