//
//  File.swift
//  
//
//  Created by Haozhe XU on 5/6/2023.
//

import Foundation

/// 經絡
public enum Meridian: Equatable, CaseIterable {

    /// 手太阴肺经
    case taiyinLungChannelOfHand

    /// 手少阴心经
    case shaoyinHeartChannelOfHand

    /// 手厥阴心包经
    case jueyinPericardiumChannelOfHand

    /// 手少阳三焦经
    case shaoyangTripleEnergizerChannelOfHand

    /// 手太阳小肠经
    case taiyangSmallIntestineChannelOfHand

    /// 手阳明大肠经
    case yangmingLargeIntestineChannelOfHand

    /// 足太阴脾经
    case taiyinSpleenChannelOfFoot

    /// 足少阴肾经
    case shaoyinKidneyChannelOfFoot

    /// 足厥阴肝经
    case jueyinLiverChannelOfFoot

    /// 足少阳胆经
    case shaoyangGallBladderChannelOfFoot

    /// 足太阳膀胱经
    case taiyangUrinaryBladderChannelOfFoot

    /// 足阳明胃经
    case yangmingStomachChannelOfFoot
}

/// 奇經八脈
public enum ExtraordinaryMeridian {

    /// 任脈
    case conceptionVessel

    /// 督脈
    case governingVessel

    /// 衝脈
    case penetratingVessel

    /// 帶脈
    case girdleVessel

    /// 陰維脈
    case yinLinkingVessel

    /// 陽維脈
    case yangLinkingVessel

    /// 陰蹻脈
    case yinHeelVessel

    /// 陽蹻脈
    case yangHeelVessel
}

public extension EarthlyBranch {

    /// 子午流注
    var meridianOnDuty: Meridian {
        switch self {
        case .zi:
            return .shaoyangGallBladderChannelOfFoot
        case .chou:
            return .jueyinLiverChannelOfFoot
        case .yin:
            return .taiyinLungChannelOfHand
        case .mao:
            return .yangmingLargeIntestineChannelOfHand
        case .chen:
            return .yangmingStomachChannelOfFoot
        case .si:
            return .taiyinSpleenChannelOfFoot
        case .wu:
            return .shaoyinHeartChannelOfHand
        case .wei:
            return .taiyangSmallIntestineChannelOfHand
        case .shen:
            return .taiyangUrinaryBladderChannelOfFoot
        case .you:
            return .shaoyinKidneyChannelOfFoot
        case .xu:
            return .jueyinPericardiumChannelOfHand
        case .hai:
            return .shaoyangTripleEnergizerChannelOfHand
        }
    }
}

public extension Meridian {

    var onDutyHourBranch: EarthlyBranch {
        switch self {
        case .taiyinLungChannelOfHand:
            return .yin
        case .shaoyinHeartChannelOfHand:
            return .wu
        case .jueyinPericardiumChannelOfHand:
            return .xu
        case .shaoyangTripleEnergizerChannelOfHand:
            return .hai
        case .taiyangSmallIntestineChannelOfHand:
            return .wei
        case .yangmingLargeIntestineChannelOfHand:
            return .mao
        case .taiyinSpleenChannelOfFoot:
            return .si
        case .shaoyinKidneyChannelOfFoot:
            return .you
        case .jueyinLiverChannelOfFoot:
            return .chou
        case .shaoyangGallBladderChannelOfFoot:
            return .zi
        case .taiyangUrinaryBladderChannelOfFoot:
            return .shen
        case .yangmingStomachChannelOfFoot:
            return .chen
        }
    }
}
