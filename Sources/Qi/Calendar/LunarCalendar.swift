//
//  File.swift
//  
//
//  Created by Haozhe XU on 17/5/2023.
//

import Foundation

public struct LunarCalendar {

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
        public let solarTerm: SolarTerm?

        /// 黃帝紀元
        public var yellowEmperorYear: Int {
            era * 60 + year
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
                         solarTerm: SolarTerm.of(date))
    }
}
