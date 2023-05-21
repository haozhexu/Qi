//
//  YinYang.swift
//  
//
//  Created by Haozhe XU on 21/4/2023.
//

public enum YinYang: String, CaseIterable, Equatable {
    case yin                    // 陰
    case yang                   // 陽
}

/// 三陰三陽
/// 中文的說法，陰陽各自分三個程度：厥陰，少陰，太陰，少陽，陽明，太陽
/// 對陰陽由盛轉衰的順序，目前存在不同的說法：
/// 漢.張仲景《傷寒論》：少陰、太陰、厥陰；太陽、陽明、少陽
/// 徐文兵：太陰、厥陰、少陰；太陽、少陽、陽明
/// 清.黃元御《素問懸解》：厥陰、少陰、太陰；陽明、少陽、太陽
/// 中醫教科書《經絡學》：太陰、少陰、厥陰；陽明、太陽、少陽
///
/// 《黄帝内经.素问》：
/// 少阳之上，火气治之，中见厥阴。
/// 阳明之上，燥气治之，中见太阴。
/// 太阳之上，寒气治之，中见少阴。
/// 厥阴之上，风气治之，中见少阳。
/// 少阴之上，热气治之，中见太阳。
/// 太阴之上，湿气治之，中见阳明。
///
/// 為避免爭議，此處只將陰陽各自抽象的表述為弱、中、強
public enum ThreePhase: Equatable {
    case weak           // 少陽，厥陰
    case mild           // 太陽，少陰
    case dominant       // 陽明，太陰
}

/// 陰陽反轉
public extension YinYang {
    static prefix func !(yy: YinYang) -> YinYang {
        return yy == .yin ? .yang : .yin
    }
}

public struct PhasedYinYang: Equatable {
    let phase: ThreePhase
    let yinyang: YinYang
}
