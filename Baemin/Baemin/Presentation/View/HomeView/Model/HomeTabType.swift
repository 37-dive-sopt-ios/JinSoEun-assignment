//
//  HomeTabType.swift
//  Baemin
//
//  Created by 진소은 on 11/14/25.
//

enum HomeTabType: Int, CaseIterable {
    case delivery
    case pickup
    case mart
    case gift
    case benefit

    var title: String {
        switch self {
        case .delivery: return "음식배달"
        case .pickup: return "픽업"
        case .mart: return "장보기·쇼핑"
        case .gift: return "선물하기"
        case .benefit: return "혜택모아보기"
        }
    }
}
