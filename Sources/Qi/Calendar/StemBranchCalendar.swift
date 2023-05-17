//
//  File.swift
//  
//
//  Created by Haozhe XU on 7/5/2023.
//

import Foundation

public enum HeavenlyStem: Int, CaseIterable, Comparable {
    case jia    // 甲
    case yi     // 乙
    case bing   // 丙
    case ding   // 丁
    case wu     // 戊
    case ji     // 己
    case geng   // 庚
    case xin    // 辛
    case ren    // 壬
    case gui    // 癸

    public static func < (lhs: HeavenlyStem, rhs: HeavenlyStem) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

public enum EarthlyBranch: Int, CaseIterable, Comparable {
    case zi     // 子
    case chou   // 丑
    case yin    // 寅
    case mao    // 卯
    case chen   // 辰
    case si     // 巳
    case wu     // 午
    case wei    // 未
    case shen   // 申
    case you    // 酉
    case xu     // 戌
    case hai    // 亥

    public static func < (lhs: EarthlyBranch, rhs: EarthlyBranch) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

public struct StemBranch: Equatable {
    let stem: HeavenlyStem
    let branch: EarthlyBranch

    public init(stem: HeavenlyStem, branch: EarthlyBranch) {
        self.stem = stem
        self.branch = branch
    }
}

public extension StemBranch {
    static let jiazi: StemBranch = .init(stem: .jia, branch: .zi)
    static let yichou: StemBranch = .init(stem: .yi, branch: .chou)
    static let bingyin: StemBranch = .init(stem: .bing, branch: .yin)
    static let dingmao: StemBranch = .init(stem: .ding, branch: .mao)
    static let wuchen: StemBranch = .init(stem: .wu, branch: .chen)
    static let jisi: StemBranch = .init(stem: .ji, branch: .si)
    static let gengwu: StemBranch = .init(stem: .geng, branch: .wu)
    static let xinwei: StemBranch = .init(stem: .xin, branch: .wei)
    static let renshen: StemBranch = .init(stem: .ren, branch: .shen)
    static let guiyou: StemBranch = .init(stem: .gui, branch: .you)
    static let jiaxu: StemBranch = .init(stem: .jia, branch: .xu)
    static let yihai: StemBranch = .init(stem: .yi, branch: .hai)
    static let bingzi: StemBranch = .init(stem: .bing, branch: .zi)
    static let dingchou: StemBranch = .init(stem: .ding, branch: .chou)
    static let wuyin: StemBranch = .init(stem: .wu, branch: .yin)
    static let jimkao: StemBranch = .init(stem: .ji, branch: .mao)
    static let gengchen: StemBranch = .init(stem: .geng, branch: .chen)
    static let xinsi: StemBranch = .init(stem: .xin, branch: .si)
    static let renwu: StemBranch = .init(stem: .ren, branch: .wu)
    static let guiwei: StemBranch = .init(stem: .gui, branch: .wei)
    static let jiashen: StemBranch = .init(stem: .jia, branch: .shen)
    static let yiyou: StemBranch = .init(stem: .yi, branch: .you)
    static let bingxu: StemBranch = .init(stem: .bing, branch: .xu)
    static let dinghai: StemBranch = .init(stem: .ding, branch: .hai)
    static let wuzi: StemBranch = .init(stem: .wu, branch: .zi)
    static let jichou: StemBranch = .init(stem: .ji, branch: .chou)
    static let gengyin: StemBranch = .init(stem: .geng, branch: .yin)
    static let xinmao: StemBranch = .init(stem: .xin, branch: .mao)
    static let renchen: StemBranch = .init(stem: .ren, branch: .chen)
    static let guisi: StemBranch = .init(stem: .gui, branch: .si)
    static let jiawu: StemBranch = .init(stem: .jia, branch: .wu)
    static let yiwei: StemBranch = .init(stem: .yi, branch: .wei)
    static let bingshen: StemBranch = .init(stem: .bing, branch: .shen)
    static let dingyou: StemBranch = .init(stem: .ding, branch: .you)
    static let wuxu: StemBranch = .init(stem: .wu, branch: .xu)
    static let jihai: StemBranch = .init(stem: .ji, branch: .hai)
    static let gengzi: StemBranch = .init(stem: .geng, branch: .zi)
    static let xinchou: StemBranch = .init(stem: .xin, branch: .chou)
    static let renyin: StemBranch = .init(stem: .ren, branch: .yin)
    static let guimao: StemBranch = .init(stem: .gui, branch: .mao)
    static let jiachen: StemBranch = .init(stem: .jia, branch: .chen)
    static let yisi: StemBranch = .init(stem: .yi, branch: .si)
    static let bingwu: StemBranch = .init(stem: .bing, branch: .wu)
    static let dingwei: StemBranch = .init(stem: .ding, branch: .wei)
    static let wushen: StemBranch = .init(stem: .wu, branch: .shen)
    static let jiyou: StemBranch = .init(stem: .ji, branch: .you)
    static let gengxu: StemBranch = .init(stem: .geng, branch: .xu)
    static let xinhai: StemBranch = .init(stem: .xin, branch: .hai)
    static let renzi: StemBranch = .init(stem: .ren, branch: .zi)
    static let guichou: StemBranch = .init(stem: .gui, branch: .chou)
    static let jiayin: StemBranch = .init(stem: .jia, branch: .yin)
    static let yimao: StemBranch = .init(stem: .yi, branch: .mao)
    static let bingchen: StemBranch = .init(stem: .bing, branch: .chen)
    static let dingsi: StemBranch = .init(stem: .ding, branch: .si)
    static let wuwu: StemBranch = .init(stem: .wu, branch: .wu)
    static let jiwei: StemBranch = .init(stem: .ji, branch: .wei)
    static let gengshen: StemBranch = .init(stem: .geng, branch: .shen)
    static let xinyou: StemBranch = .init(stem: .xin, branch: .you)
    static let renxu: StemBranch = .init(stem: .ren, branch: .xu)
    static let guihai: StemBranch = .init(stem: .gui, branch: .hai)
}

public extension EarthlyBranch {
    static func fromTwentyFourHours(_ hours: Int) -> EarthlyBranch {
        let hourBranchIndex = (hours + 1) / 2 % 12
        return EarthlyBranch.allCases[hourBranchIndex]
    }

    func toTwentyFourHours() -> (Int, Int) {
        switch self {
        case .zi:
            return (23, 1)
        case .chou:
            return (1, 3)
        case .yin:
            return (3, 5)
        case .mao:
            return (5, 7)
        case .chen:
            return (7, 9)
        case .si:
            return (9, 11)
        case .wu:
            return (11, 13)
        case .wei:
            return (13, 15)
        case .shen:
            return (15, 17)
        case .you:
            return (17, 19)
        case .xu:
            return (19, 21)
        case .hai:
            return (21, 23)
        }
    }
}

/// 干支曆
public struct StemBranchCalendar {

    /// 干支日期
    /// 年干支，月干支，日干支以及時辰
    public struct StemBranchDate: Equatable {
        public let date: Date
        public let year: StemBranch
        public let month: StemBranch
        public let day: StemBranch
    }

    /// 計算月支方法
    public enum MonthCalculation {

        /// 以農曆月配干支，但不計閏月，閏月的干支取上一月的干支。
        /// 紀法是把月建配上天干，六十月(即五年)循環一週。
        /// 由於年天干的週期是十年，年干與月干有二對一的對應關係。
        /// 例如年干為甲或己時，正月的干支必然是丙寅，二月是丁卯，其餘可以類推。
        case lunarMonth

        /// 根據二十四節氣分月。子月定為由大雪至小寒前一日，丑月定為由小寒至立春前一日等等。
        case solarTerm
    }

    /// 默認按照二十四節氣計算月支
    public let calculateMonthBasedOn: MonthCalculation

    public init(calculateMonthBasedOn: MonthCalculation = .solarTerm) {
        self.calculateMonthBasedOn = calculateMonthBasedOn
    }

    /// 計算指定日期的干支
    ///
    /// - Parameters:
    ///  - date: 指定`Date`
    /// - Returns: 指定日期的干支
    ///
    public func stemBranchDate(of date: Date) -> StemBranchDate {
        let lunar = LunarCalendar().lunarDate(from: date)
        let year = stemBranchOfYear(of: lunar)
        let month: StemBranch

        switch calculateMonthBasedOn {
        case .lunarMonth:
            month = lunarBasedStemBranchOfMonth(of: date)
        case .solarTerm:
            month = solarTermBasedStemBranchOfMonth(of: date, yearStem: year.stem)
        }

        let day = stemBranchOfDay(of: date)

        return StemBranchDate(date: date, year: year, month: month, day: day)
    }

    /// 指定日期的日干支
    ///
    /// - Parameters:
    ///  - date: 指定`Date`
    /// - Returns: 指定日期的日干支
    ///
    public func stemBranchOfDay(of date: Date) -> StemBranch {
        let JD = Int(ceil(Constants.JDSince1970GMT + date.timeIntervalSince1970 / 86400))
        let day = 1 + ((JD - 11) % 60)
        let stemIndex = ((day - 1) % 10)
        let branchIndex = ((day - 1) % 12)
        let stem = HeavenlyStem.allCases[stemIndex]
        let branch = EarthlyBranch.allCases[branchIndex]
        return StemBranch(stem: stem, branch: branch)
    }

    private func lunarBasedStemBranchOfMonth(of date: Date) -> StemBranch {
        let lunar = LunarCalendar().lunarDate(from: date)
        let year = stemBranchOfYear(of: lunar)
        let monthStems = monthStemsForYear(year.stem)
        let monthStem = monthStems[lunar.month - 1]
        let monthBranchIndex = (lunar.month + 1) % EarthlyBranch.allCases.count
        return StemBranch(stem: monthStem, branch: EarthlyBranch.allCases[monthBranchIndex])
    }

    private func solarTermBasedStemBranchOfMonth(of date: Date, yearStem: HeavenlyStem) -> StemBranch {
        let stem: HeavenlyStem
        let branch = date.returnBeforeFirst([
            (.springBegins, nil, 0, EarthlyBranch.chou),
            (.insectsAwaken, nil, 0, EarthlyBranch.yin),
            (.clearAndBright, nil, 0, EarthlyBranch.mao),
            (.summerBegins, nil, 0, EarthlyBranch.chen),
            (.grainInEar, nil, 0, EarthlyBranch.si),
            (.slightHeat, nil, 0, EarthlyBranch.wu),
            (.autumnBegins, nil, 0, EarthlyBranch.wei),
            (.whiteDews, nil, 0, EarthlyBranch.shen),
            (.coldDews, nil, 0, EarthlyBranch.you),
            (.winterBegins, nil, 0, EarthlyBranch.xu),
            (.heavySnow, nil, 0, EarthlyBranch.hai),
            (.slightCold, nil, 0, EarthlyBranch.zi)
        ], defaultValue: .chou)
        let monthStems = monthStemsForYear(yearStem)
        let stemIndex = ((branch.rawValue - 2) % 12)
        stem = monthStems[stemIndex]

        return StemBranch(stem: stem, branch: branch)
    }

    private func stemBranchOfYear(of lunar: LunarCalendar.LunarDate) -> StemBranch {
        let yearStemIndex = (lunar.year % 10)
        let adjustedYearStemIndex = yearStemIndex == 0 ? 9 : yearStemIndex - 1
        let yearBranchIndex = (lunar.year % 12)
        let adjustedYearBranchIndex = yearBranchIndex == 0 ? 11 : yearBranchIndex - 1
        let yearStem = HeavenlyStem.allCases[adjustedYearStemIndex]
        return StemBranch(stem: yearStem, branch: EarthlyBranch.allCases[adjustedYearBranchIndex])
    }

    private func monthStemsForYear(_ stem: HeavenlyStem) -> [HeavenlyStem] {
        switch stem {
        case .jia, .ji:
            return [.bing, .ding, .wu, .ji, .geng, .xin, .ren, .gui, .jia, .yi, .bing, .ding]
        case .yi, .geng:
            return [.wu, .ji, .geng, .xin, .ren, .gui, .jia, .yi, .bing, .ding, .wu, .ji]
        case .bing, .xin:
            return [.geng, .xin, .ren, .gui, .jia, .yi, .bing, .ding, .wu, .ji, .geng, .xin]
        case .ding, .ren:
            return [.ren, .gui, .jia, .yi, .bing, .ding, .wu, .ji, .geng, .xin, .ren, .gui]
        case .wu, .gui:
            return [.jia, .yi, .bing, .ding, .wu, .ji, .geng, .xin, .ren, .gui, .jia, .yi]
        }
    }

    private enum Constants {
        static let JDSince1970GMT = 2440587.5
    }
}
