//
//  Flavor.swift
//  
//
//  Created by Haozhe XU on 22/4/2023.
//

/// 五味
public enum Flavor: String, CaseIterable, Equatable {

    /// 甘
    case sweet

    /// 苦
    case bitter

    /// 酸
    case sour

    /// 辛
    case spicy

    /// 咸
    case salty
}

public extension Flavor {

    /// 五味對應內臟
    func into() -> Organ.Zang {
        switch self {
        case .sour:
            // 酸入肝
            return .liver
        case .bitter:
            // 苦入心
            return .heart
        case .sweet:
            // 甘入脾
            return .spleen
        case .spicy:
            // 辛入肺
            return .lungs
        case .salty:
            // 鹹入腎
            return .kidney
        }
    }
}
