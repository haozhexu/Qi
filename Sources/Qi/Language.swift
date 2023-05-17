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

public protocol LanguageText {
    func text(of language: Language) -> String
}

public extension LanguageText {
    var CNs: String { text(of: .zhHans) }
    var CNt: String { text(of: .zhHant) }
    var EN: String { text(of: .en) }
}

extension YinYang: LanguageTextListProviding {
    func iterableCasesText(for language: Language) -> [String] {
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

extension Element: LanguageTextListProviding {
    func iterableCasesText(for language: Language) -> [String] {
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

extension HeavenlyStem: LanguageTextListProviding {

    func iterableCasesText(for language: Language) -> [String] {
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

extension EarthlyBranch: LanguageTextListProviding {

    func iterableCasesText(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
        case .zhHant:
            return  ["子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥"]
        case .en:
            return ["zǐ", "chǒu", "yín", "mǎo", "chén", "sì", "wǔ", "wèi", "shēn", "yǒu", "xū", "hài"]
        }
    }
}

extension StemBranch: LanguageText {
    public func text(of language: Language) -> String {
        "\(stem.text(of: language))\(branch.text(of: language))"
    }
}

extension PhasedYinYang: LanguageText {
    public func text(of language: Language) -> String {
        let text: [Language: String]
        switch (phase, yinyang) {
        case (.weak, .yin):
            text = [.en: "Weak Yin",
                    .zhHans: "厥阴",
                    .zhHant: "厥陰"]
        case (.mild, .yin):
            text = [.en: "Mild Yin",
                    .zhHans: "少阴",
                    .zhHant: "少陰"]
        case (.dominant, .yin):
            text = [.en: "Dominant Yin",
                    .zhHans: "太阴",
                    .zhHant: "太陰"]
        case (.weak, .yang):
            text = [.en: "Weak Yang",
                    .zhHans: "少阳",
                    .zhHant: "少陽"]
        case (.mild, .yang):
            text = [.en: "Mild Yang",
                    .zhHans: "阳明",
                    .zhHant: "陽明"]
        case (.dominant, .yang):
            text = [.en: "Dominant Yang",
                    .zhHans: "太阳",
                    .zhHant: "太陽"]
        }
        return text[language] ?? "???"
    }
}

extension Qi: LanguageTextListProviding {
    func iterableCasesText(for language: Language) -> [String] {
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

extension Qi.Factor: LanguageTextListProviding {
    func iterableCasesText(for language: Language) -> [String] {
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

extension Qi.Compound: LanguageText {
    public func text(of language: Language) -> String {
        let factorText: [Language: String]
        switch factor {
        case .heat where phasedYinYang.yinyang == .yin:
            factorText = [.en: "Monarch",
                          .zhHans: "君",
                          .zhHant: "君"]
        case .fire where phasedYinYang.yinyang == .yang:
            factorText = [.en: "Ministerial",
                          .zhHans: "相",
                          .zhHant: "相"]
        default:
            factorText = [.en: factor.text(of: .en),
                          .zhHans: factor.text(of: .zhHans),
                          .zhHant: factor.text(of: .zhHant)]
        }
        return "\(phasedYinYang.text(of: language))\(factorText[language] ?? "?")\(element.text(of: language))"
    }
}

extension Qi.Adequacy: LanguageTextListProviding {
    func iterableCasesText(for language: Language) -> [String] {
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

extension Qi.ElementAndAdequacy: LanguageText {
    public func text(of language: Language) -> String {
        "\(element.text(of: language))\(adequacy.text(of: language))"
    }
}

protocol LanguageTextListProviding: LanguageText, CaseIterable, Equatable {
    func iterableCasesText(for language: Language) -> [String]
}

extension LanguageTextListProviding {
    public func text(of language: Language) -> String {
        guard let index = Self.allCases.firstIndex(of: self) as? Int else {
            preconditionFailure("\(self) isn't part of \(Self.self)!")
        }
        let text = iterableCasesText(for: language)
        return text[index]
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

extension PhasedYinYang: CustomDebugStringConvertible {
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
