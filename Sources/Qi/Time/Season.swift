//
//  Season.swift
//  
//
//  Created by Haozhe XU on 21/4/2023.
//

import Foundation

/// 四季
public enum Season: String, CaseIterable, Equatable {
    case spring
    case summer
    case autumn
    case winter

    public var includedSolarTerms: [SolarTerm] {
        switch self {
        case .spring:
            return [.springBegins, .theRains, .insectsAwaken, .vernalEquinox, .clearAndBright, .grainRain]
        case .summer:
            return [.summerBegins, .grainBuds, .grainInEar, .summerSolstice, .slightHeat, .greatHeat]
        case .autumn:
            return [.autumnBegins, .heatStops, .whiteDews, .autumnEquinox, .coldDews, .frostFalls]
        case .winter:
            return [.winterBegins, .lightSnow, .heavySnow, .winterSolstice, .slightCold, .greatCold]
        }
    }

    public static func at(_ hemisphere: Hemisphere, with time: Date) -> Season? {
        switch hemisphere {
        case .northern:
            return solarTermBased(with: time)
        case .southern:
            return monthBasedAtSouthernHemisphere(with: time)
        case .eastern, .western:
            return nil
        }
    }

    public static func solarTermBased(with time: Date) -> Season? {
        let components = Calendar(identifier: .gregorian).dateComponents([.month, .day], from: time)

        guard let month = components.month,
              let day = components.day else {
            return nil
        }

        if isMonth(month, day: day, before: SolarTerm.springBegins.roughMonthAndDay) {
            return .winter
        } else if isMonth(month, day: day, before: SolarTerm.summerBegins.roughMonthAndDay) {
            return .spring
        } else if isMonth(month, day: day, before: SolarTerm.autumnBegins.roughMonthAndDay) {
            return .summer
        } else if isMonth(month, day: day, before: SolarTerm.winterBegins.roughMonthAndDay) {
            return .autumn
        } else {
            return .winter
        }
    }

    public static func monthBasedAtSouthernHemisphere(with time: Date) -> Season? {
        let components = Calendar(identifier: .gregorian).dateComponents([.month], from: time)
        guard let month = components.month else {
            return nil
        }
        switch month {
        case 9, 10, 11: return .spring
        case 12, 1, 2: return .summer
        case 3, 4, 5: return .autumn
        case 6, 7, 8: return .winter
        default: return nil
        }
    }

    private static func isMonth(_ month: Int, day: Int, before monthDay: SolarTerm.MonthAndDay) -> Bool {
        if month < monthDay.month {
            return true
        } else if month == monthDay.month {
            return day < monthDay.day
        }
        return false
    }
}
