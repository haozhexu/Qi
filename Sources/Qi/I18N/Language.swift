//
//  Language.swift
//  
//
//  Created by Haozhe XU on 24/4/2023.
//

import Foundation

public enum Language: String, Equatable {
    case zhHans = "zh-Hans"
    case zhHant = "zh-Hant"
    case en = "en"
}

public protocol LocalizedTextProvider {
    func text(of language: Language) -> String
}

public extension LocalizedTextProvider {
    var CNs: String { text(of: .zhHans) }
    var CNt: String { text(of: .zhHant) }
    var EN: String { text(of: .en) }
}

public struct LocalizedText: LocalizedTextProvider {
    let localizedText: [Language: String]
    public func text(of language: Language) -> String {
        guard let text = localizedText[language] else {
            preconditionFailure("Missing text for language: \(language)")
        }
        return text
    }
}

extension YinYang: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["阴", "阳"]
        case .zhHant:
            return ["陰", "陽"]
        case .en:
            return ["Yin", "Yang"]
        }
    }
}

extension Element: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["木", "火", "土", "金", "水"]
        case .zhHant:
            return ["木", "火", "土", "金", "水"]
        case .en:
            return ["Tree", "Fire", "Earth", "Metal", "Water"]
        }
    }
}

extension HeavenlyStem: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
        case .zhHant:
            return ["甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸"]
        case .en:
            return ["jiǎ", "yǐ", "bǐng", "dīng", "wù", "jǐ", "gēng", "xīn", "rén", "guǐ"]
        }
    }
}

extension EarthlyBranch: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
        case .zhHant:
            return  ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
        case .en:
            return ["zǐ", "chǒu", "yín", "mǎo", "chén", "sì", "wǔ", "wèi", "shēn", "yǒu", "xū", "hài"]
        }
    }

    public var twoHourPeriodTime: TwoHourPeriodTime {
        .init(branch: self)
    }

    public var pinyin: String {
        switch self {
        case .zi:
            return "zǐ"
        case .chou:
            return "chǒu"
        case .yin:
            return "yín"
        case .mao:
            return "mǎo"
        case .chen:
            return "chén"
        case .si:
            return "sì"
        case .wu:
            return "wǔ"
        case .wei:
            return "wèi"
        case .shen:
            return "shēn"
        case .you:
            return "yǒu"
        case .xu:
            return "xū"
        case .hai:
            return "hài"
        }
    }
}

public struct TwoHourPeriodTime: IterableLocalizedTextProvider {

    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["夜半", "鸡鸣", "平旦", "日出", "食时", "隅中", "午时", "日昳", "哺时", "日入", "黄昏", "人定"]
        case .zhHant:
            return ["夜半", "雞鳴", "平旦", "日出", "食時", "隅中", "午時", "日昳", "哺時", "日入", "黃昏", "人定"]
        case .en:
            return ["Midnight", "Crow of Rooster", "Dawn", "Sunrise", "Breakfast Time", "Morning", "Mid Day", "Sun Moving West", "Feed Time", "Sunset", "Dusk", "Rest Time"]
        }
    }

    public static var allCases: [TwoHourPeriodTime] {
        EarthlyBranch.allCases.map { Self(branch: $0) }
    }

    let branch: EarthlyBranch
}

extension StemBranch: LocalizedTextProvider {
    public func text(of language: Language) -> String {
        "\(stem.text(of: language))\(branch.text(of: language))"
    }
}

extension ThreeOf<YinYang>: LocalizedTextProvider {
    public func text(of language: Language) -> String {
        let text: [Language: String]
        switch self {
        case .one(.nothing):
            text = [.en: "Weak Yang",
                    .zhHans: "少阳",
                    .zhHant: "少陽"]
        case .two(.nothing):
            text = [.en: "Mild Yang",
                    .zhHans: "阳明",
                    .zhHant: "陽明"]
        case .three(.nothing):
            text = [.en: "Dominant Yang",
                    .zhHans: "太阳",
                    .zhHant: "太陽"]
        case .one(.something):
            text = [.en: "Weak Yin",
                    .zhHans: "厥阴",
                    .zhHant: "厥陰"]
        case .two(.something):
            text = [.en: "Mild Yin",
                    .zhHans: "少阴",
                    .zhHant: "少陰"]
        case .three(.something):
            text = [.en: "Dominant Yin",
                    .zhHans: "太阴",
                    .zhHant: "太陰"]
        }
        return text[language] ?? "???"
    }
}

extension Qi: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["厥阴风木", "少阴君火", "太阴湿土", "少阳相火", "阳明燥金", "太阳寒水"]
        case .zhHant:
            return ["厥陰風木", "少陰君火", "太陰濕土", "少陽相火", "陽明燥金", "太陽寒水"]
        case .en:
            return ["Weak Yin Windy Tree",
                    "Mild Yin Fire",
                    "Dominant Yin Damp Earth",
                    "Weak Yang Fire",
                    "Mild Yang Dry Metal",
                    "Dominant Yang Cold Water"]
        }
    }
}

extension Qi.Factor: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["风", "热", "火", "湿", "燥", "寒"]
        case .zhHant:
            return ["風", "熱", "火", "濕", "燥", "寒"]
        case .en:
            return ["Wind", "Heat", "Fire", "Damp", "Dryness", "Cold"]
        }
    }
}

extension Qi.Compound: LocalizedTextProvider {
    public func text(of language: Language) -> String {
        let factorText: [Language: String]
        switch factor {
        case .heat where threeYinYang.yinyang == .yin:
            factorText = [.en: "Monarch",
                          .zhHans: "君",
                          .zhHant: "君"]
        case .fire where threeYinYang.yinyang == .yang:
            factorText = [.en: "Ministerial",
                          .zhHans: "相",
                          .zhHant: "相"]
        default:
            factorText = [.en: factor.text(of: .en),
                          .zhHans: factor.text(of: .zhHans),
                          .zhHant: factor.text(of: .zhHant)]
        }
        return "\(threeYinYang.text(of: language))\(factorText[language] ?? "?")\(element.text(of: language))"
    }
}

extension Qi.Adequacy: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["太过", "不及"]
        case .zhHant:
            return ["太過", "不及"]
        case .en:
            return ["Excess", "Deficiency"]
        }
    }
}

extension Qi.ElementAndAdequacy: LocalizedTextProvider {
    public func text(of language: Language) -> String {
        "\(element.text(of: language))\(adequacy.text(of: language))"
    }
}

public protocol IterableLocalizedTextProvider: LocalizedTextProvider, CaseIterable, Equatable {
    static func textForIterables(for language: Language) -> [String]
}

extension IterableLocalizedTextProvider {
    public func text(of language: Language) -> String {
        guard let index = Self.allCases.firstIndex(of: self) as? Int else {
            preconditionFailure("\(self) isn't part of \(Self.self)!")
        }
        let text = Self.textForIterables(for: language)
        return text[index]
    }
}

extension ZodiacAnimal: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗", "猪"]
        case .zhHant:
            return ["鼠", "牛", "虎", "兔", "龍", "蛇", "馬", "羊", "猴", "雞", "狗", "豬"]
        case .en:
            return ["Rat", "Ox", "Tiger", "Rabbit", "Dragon", "Snake", "Horse", "Goat", "Monkey", "Rooster", "Dog", "Pig"]
        }
    }
}

public enum LunarDateTextHolder: LocalizedTextProvider {
    case day(Int)
    case month(Int, Bool)

    public func text(of language: Language) -> String {
        switch self {
        case let .day(day):
            return language == .en ? String(day) : Constants.dayTextZHHan[day - 1]
        case let .month(month, isLeap):
            switch language {
            case .zhHans:
                return (isLeap ? "闰" : "") + Constants.monthTextZHHans[month - 1] + "月"
            case .zhHant:
                return (isLeap ? "閏" : "") + Constants.monthTextZHHant[month - 1] + "月"
            case .en:
                return String(month)
            }
        }
    }

    private enum Constants {
        static let dayTextZHHan = ["初一", "初二", "初三", "初四", "初五",
                                   "初六", "初七", "初八", "初九", "初十",
                                   "十一", "十二", "十三", "十四", "十五",
                                   "十六", "十七", "十八", "十九", "二十",
                                   "廿一", "廿二", "廿三", "廿四", "廿五",
                                   "廿六", "廿七", "廿八", "廿九", "三十"]
        static let monthTextZHHant = ["正", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "臘"]
        static let monthTextZHHans = ["正", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "腊"]
    }
}

public extension LunarCalendar.LunarDate {

    var monthText: LunarDateTextHolder {
        .month(month, isLeapMonth)
    }

    var dayText: LunarDateTextHolder {
        .day(day)
    }

    func monthAndDayText(of language: Language) -> String {
        monthText.text(of: language) + dayText.text(of: language)
    }
}

extension SolarTerm: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["立春", "雨水", "惊蛰", "春分", "清明", "谷雨", "立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至", "小寒", "大寒"]
        case .zhHant:
            return ["立春", "雨水", "驚蟄", "春分", "清明", "谷雨", "立夏", "小滿", "芒種", "夏至", "小暑", "大暑", "立秋", "處暑", "白露", "秋分", "寒露", "霜降", "立冬", "小雪", "大雪", "冬至", "小寒", "大寒"]
        case .en:
            return ["Spring Begins",
                    "The Rains",
                    "Insects Awaken",
                    "Vernal Equinox",
                    "Clear And Bright",
                    "Grain Rain",
                    "Summer Begins",
                    "Grain Buds",
                    "Grain In Ear",
                    "Summer Solstice",
                    "Slight Heat",
                    "Great Heat",
                    "Autumn Begins",
                    "Heat Stops",
                    "White Dews",
                    "Autumn Equinox",
                    "Cold Dews",
                    "Frost Falls",
                    "Winter Begins",
                    "Light Snow",
                    "Heavy Snow",
                    "Winter Solstice",
                    "Slight Cold",
                    "Great Cold"]
        }
    }
}

extension LunarCalendar.Holiday: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["春节", "元宵节", "龙抬头", "上巳节", "清明节", "端午节", "七夕节", "中元节", "中秋节", "重阳节", "除夕"]
        case .zhHant:
            return ["春節", "元宵節", "龍抬頭", "上巳節", "清明節", "端午節", "七夕節", "中元節", "中秋節", "重陽節", "除夕"]
        case .en:
            return ["Spring Festival", "Lantern Festival", "Dragon Head-Raising Festival", "Double Third Festival", "Tomb Sweeping Festival", "Dragon Boat Festival", "Qixi", "Hungry Ghost Festival", "Mid-Autumn Festival", "Double Ninth Festival", "Spring Festival Eve"]
        }
    }
}

extension ThreeOf<YinYang> {
    var yinyang: YinYang {
        switch self {
        case let .one(yy): return yy
        case let .two(yy): return yy
        case let .three(yy): return yy
        }
    }
}

// MARK: - Debug

private let debugStringLanguage: Language = .zhHant

extension Element: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension HeavenlyStem: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension EarthlyBranch: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension StemBranch: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension ThreeOf<YinYang>: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension Qi: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension Qi.Factor: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension Qi.Compound: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension Qi.Adequacy: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}

extension Qi.ElementAndAdequacy: CustomDebugStringConvertible {
    public var debugDescription: String {
        text(of: debugStringLanguage)
    }
}
