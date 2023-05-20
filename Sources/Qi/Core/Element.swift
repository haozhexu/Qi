//
//  Elements.swift
//  
//
//  Created by Haozhe XU on 21/4/2023.
//

public protocol Elemental {
    var element: Element { get }
}

/// 五行
/// 此處“木”命名為tree而非wod，皆因五行中木色青，对应春，方位东，主生发、生长、舒畅。《黄帝内经》有句话叫：木曰曲直。
public enum Element: CaseIterable, Equatable {
    case tree                   // 木
    case fire                   // 火
    case earth                  // 土
    case metal                  // 金
    case water                  // 水
}

/// 五行生剋
extension Element: Cycle {

    public func generate() -> Element {
        switch self {
        case .metal:
            return .water
        case .tree:
            return .fire
        case .water:
            return .tree
        case .fire:
            return .earth
        case .earth:
            return .metal
        }
    }

    public func restrain() -> Element {
        switch self {
        case .metal:
            return .tree
        case .tree:
            return .earth
        case .water:
            return .fire
        case .fire:
            return .metal
        case .earth:
            return .water
        }
    }
}
