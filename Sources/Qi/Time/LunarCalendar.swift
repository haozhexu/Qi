//
//  File.swift
//  
//
//  Created by Haozhe XU on 17/5/2023.
//

import Foundation

public struct LunarCalendar {

    /// 傳統節日
    public enum Holiday: String, CaseIterable, Equatable {

        /// 春節，農曆正月初一
        case springFestival

        /// 元宵節，農曆正月十五
        case lanternFestival

        /// 龍抬頭，農曆二月初二
        case dragonHeadRaisingDay

        /// 上巳節，農曆三月初三
        case doubleThirdFestival

        /// 清明節，農曆四月五日前後
        case tombSweepingDay

        /// 端午節，農曆五月初五
        case dragonBoatFestival

        /// 七夕節，農曆七月初七
        case qixi

        /// 中元節，農曆七月十五
        case hungryGhostFestival

        /// 中秋節，農曆八月十五
        case midAutumnDay

        /// 重陽節，農曆九月初九
        case doubleNinthFestival

        /// 除夕，農曆十二月廿九或三十
        case springFestivalEve
    }

    /// 農曆日期
    /// 年月日時以及日期對應的節氣
    public struct LunarDate: Equatable {

        /// 甲子
        public let era: Int

        /// 當前甲子年份
        public let year: Int
        public let month: Int
        public let day: Int
        public let hour: EarthlyBranch
        public let isLeapMonth: Bool
        public let solarTermDayRange: SolarTerm.DayRange?

        /// 黃帝紀元
        public var yellowEmperorYear: Int {
            era * 60 + year
        }

        public var lastDayOfMonth: Int? {
            let chinese = Calendar(identifier: .chinese)
            guard let date = DateComponents(calendar: chinese, era: era, year: year, month: month).date else {
                return nil
            }
            let components = DateComponents(calendar: chinese, month: 1, second: -1)
            guard let lastDay = chinese.date(byAdding: components, to: date) else {
                return nil
            }
            let dateComponents = chinese.dateComponents([.day], from: lastDay)
            return dateComponents.day
        }

        /// 此日期所對應之傳統節日
        public var holiday: Holiday? {
            switch (month, day) {
            case (1, 1): return .springFestival
            case (1, 15): return .lanternFestival
            case (2, 2): return .dragonHeadRaisingDay
            case (3, 3): return .doubleThirdFestival
            case (5, 5): return .dragonBoatFestival
            case (7, 7): return .qixi
            case (7, 15): return .hungryGhostFestival
            case (8, 15): return .midAutumnDay
            case (9, 9): return .doubleNinthFestival
            case (12, 30) where lastDayOfMonth == 30: return .springFestivalEve
            case (12, 29) where lastDayOfMonth == 29: return .springFestivalEve
            case (_, _) where solarTermDayRange == .onTheDay(.clearAndBright): return .tombSweepingDay
            default: return nil
            }
        }
    }

    public init() {}

    /// 計算指定日期的農曆日期
    ///
    /// - Parameters:
    ///  - date: 指定需要計算農曆日期的`Date`
    /// - Returns: 對應指定`Date`的農曆日期
    ///
    public func lunarDate(from date: Date) -> LunarDate {
        let chinese = Calendar(identifier: .chinese)
        let comps = chinese.dateComponents([.era, .year, .month, .day, .hour], from: date)

        guard let era = comps.era,
              let year = comps.year,
              let month = comps.month,
              let day = comps.day,
              let hour = comps.hour else {
            preconditionFailure("Cannot get date component from date.")
        }

        let hourBranch = EarthlyBranch.fromTwentyFourHours(hour)

        return LunarDate(era: era,
                         year: year,
                         month: month,
                         day: day,
                         hour: hourBranch,
                         isLeapMonth: comps.isLeapMonth == true,
                         solarTermDayRange: SolarTerm.rangeOf(date))
    }
}
