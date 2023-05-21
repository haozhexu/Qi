//
//  Organ.swift
//  
//
//  Created by Haozhe XU on 21/4/2023.
//

public enum Organ {

    // 臟
    public enum Zang: String, CaseIterable, Equatable {
        case liver              // 肝
        case heart              // 心
        case spleen             // 脾
        case lungs              // 肺
        case kidney             // 腎
    }

    // 腑
    public enum Fu: String, CaseIterable, Equatable {
        case gallBladder        // 膽
        case stomach            // 胃
        case largeIntestine     // 大腸
        case smallIntestine     // 小腸
        case urinaryBladder     // 膀胱
        case tripleEnergizer    // 三焦, san jiao
    }
}

/// 臟器五行歸屬
extension Organ.Zang: Elemental {

    public var element: Element {
        switch self {
        case .heart:
            return .fire
        case .liver:
            return .tree
        case .spleen:
            return .earth
        case .lungs:
            return .metal
        case .kidney:
            return .water
        }
    }
}

/// 臟器對應五行生剋
extension Organ.Zang: Cycle {

    public func generate() -> Organ.Zang {
        switch self {
        case .liver:
            return .heart
        case .heart:
            return .spleen
        case .spleen:
            return .lungs
        case .lungs:
            return .kidney
        case .kidney:
            return .liver
        }
    }

    public func restrain() -> Organ.Zang {
        switch self {
        case .liver:
            return .spleen
        case .heart:
            return .lungs
        case .spleen:
            return .kidney
        case .lungs:
            return .liver
        case .kidney:
            return .heart
        }
    }
}

/// 四季對應五臟
public extension Season {
    var zang: Organ.Zang {
        switch self {
        case .spring:
            return .liver
        case .summer:
            return .heart
        case .autumn:
            return .lungs
        case .winter:
            return .kidney
        }
    }
}
