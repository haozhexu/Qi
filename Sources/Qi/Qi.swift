//
//  Qi.swift
//  Qi
//
//  Created by Haozhe XU on 21/4/23.
//

import Foundation

public enum Qi: Equatable, CaseIterable {

    public typealias YearlyFortune = ElementAndAdequacy
    public typealias GuestFortune = ElementAndAdequacy

    /// 厥陰風木
    case weakYinWood

    /// 少陰君火
    case mildYinFire

    /// 太陰濕土
    case dominantYinEarth

    /// 少陽相火
    case weakYangFire

    /// 陽明燥金
    case mildYangMetal

    /// 太陽寒水
    case dominantYangWater

    /// 六氣
    /// 六氣為風、熱、火、濕、燥、寒，概括六種不同氣候，為古人總結長期生活經驗而得。
    /// 可視為從中國的氣候區劃、氣候特徵來研究氣旋活動的規律。
    /// 六氣分主氣、客氣，主氣測常，客氣測變。
    /// 客主加臨則是將主客氣合看，以進一步分析氣候變化及影響。
    /// 六氣是氣候變化的本源，三陰三陽是氣候變化的標象。
    /// 六氣與三陰三陽的關係為風化厥陰，熱化少陰，濕化太陰，火化少陽，燥化陽明，寒化太陽。
    /// 六氣時至氣至，便為宇宙間的六種正氣；如果化非其時，便為邪氣，即氣象學上的災害性天氣。
    public enum Factor: CaseIterable, Equatable {

        /// 风
        case wind

        /// 热
        case heat

        /// 火
        case fire

        /// 濕
        case damp

        /// 燥
        case dryness

        /// 寒
        case cold
    }

    /// 太過不及
    public enum Adequacy: CaseIterable, Equatable {
        case excess
        case deficiency
    }

    /// 五行太過不及
    public struct ElementAndAdequacy: Equatable {
        public let element: Element
        public let adequacy: Adequacy

        public init(element: Element, adequacy: Adequacy) {
            self.element = element
            self.adequacy = adequacy
        }
    }

    public struct ClimaticEffect: Equatable {
        public let celestial: Qi
        public let terrestrial: Qi
    }

    public struct Division: Equatable {
        public let start: SolarTerm
        public let end: SolarTerm

        public init(start: SolarTerm, end: SolarTerm) {
            self.start = start
            self.end = end
        }
    }

    /// 六氣
    /// 每一氣包含陰陽、程度（`ThreePhase`），氣後特徵（`Factor`）以及節氣跨度（`Division`）
    public struct Compound: Equatable {
        public let phasedYinYang: PhasedYinYang
        public let factor: Factor
        public let element: Element
        public let division: Division

        public init(phase: ThreePhase, yinyang: YinYang, factor: Factor, element: Element, division: Division) {
            self.phasedYinYang = .init(phase: phase, yinyang: yinyang)
            self.factor = factor
            self.element = element
            self.division = division
        }
    }
    
    public struct FortuneAndQiOfYear {
        public let yearlyFortune: YearlyFortune
        public let hostFortunes: [Element]
        public let guestFortunes: [GuestFortune]
        public let hostSixQi: [Qi]
        public let guestSixQi: [Qi]
        public let climaticEffect: ClimaticEffect
    }

    public struct FortuneAndQiOfNow {
        public let fortune: (host: Element, guest: GuestFortune)
        public let qi: (host: Qi, guest: Qi)
    }

    public struct FiveFortuneSixQi {
        public let year: FortuneAndQiOfYear
        public let now: FortuneAndQiOfNow
    }

    /// 歲運
    /// 歲運統管全年五運之氣，可反映全年的氣候特徵及發病規律，
    /// 太過表主歲的運氣旺盛而有餘，不及表主歲的運氣衰少而不足，
    /// 甲丙戊庚壬為陽乾，主歲運的有餘；乙丁己辛癸為陰乾，主歲運的不足，
    /// 因此逢甲年歲運為土運太過，乙年金運不及，丙年水運太過，丁年木運不及，戊年火運太過，
    /// 己年土運不及，庚年金運太過，辛年水運不及，壬年木運太過，癸年火運不及。
    ///
    /// - Parameters:
    ///  - stem: 指定天干
    /// - Returns: 歲運
    ///
    public static func fortuneOfYear(of stem: HeavenlyStem) -> YearlyFortune {
        YearlyFortune(element: stem.element, adequacy: stem.adequacy)
    }

    /// 主運
    /// 主運指五運之氣分別主管一年五時的運。
    /// 全年分作五步，每一步運各主一時，各主七十三天零五刻。
    /// 始於木運，而火運，而土運，而金運，終於水運，按五行相生次序運行。年年如此，固定不變。
    ///
    /// - Returns: 一年五季對應主運
    ///
    public static func hostFortunesOfYear() -> [Element] {
        [.tree, .fire, .earth, .metal, .water]
    }

    /// 客運
    /// 客運與主運相對而言，因其十年之內年年不同，如客之往來，故名客運。
    /// 客運也是主時之運，即每年五步的任一步，同時有一個主運和一個客運共同主持。
    ///
    /// - Parameters:
    ///  - stem: 指定計算客運的天干
    /// - Returns: 對應指定天干的五步客運
    ///
    public static func guestFortunesOfYearStem(_ stem: HeavenlyStem) -> [GuestFortune] {
        var last = fortuneOfYear(of: stem)
        var elements = [GuestFortune]()
        for _ in 0..<5 {
            elements.append(last)
            let next = GuestFortune(element: last.element.generate(), adequacy: last.adequacy.opposite())
            last = next
        }
        return elements
    }

    /// 主氣
    /// 主氣主治一年六個季節的正常氣候變化，故稱為主時之氣。因其恆居不變，年年如此。又稱地氣。
    /// 將一年二十四節氣分屬於六氣六步之中，主氣一年分六步，一步主四個節氣，即六十天八十七刻半。
    ///
    /// - Returns: 一年五季對應的主氣
    ///
    public static func hostQiOfYear() -> [Qi] {
        [
            /// 厥陰風木
            .weakYinWood,

            /// 少陰君火
            .mildYinFire,

            /// 少陽相火
            .weakYangFire,

            /// 太陰濕土
            .dominantYinEarth,

            /// 陽明燥金
            .mildYangMetal,

            /// 太陽寒水
            .dominantYangWater
        ]
    }

    /// 客氣
    public static func guestQiOfYear(of branch: EarthlyBranch) -> [Qi] {
        let effect = climaticEffectOfYearBranch(branch)
        return [effect.celestial.previous().previous(),
                effect.celestial.previous(),
                effect.celestial,
                effect.terrestrial.previous().previous(),
                effect.terrestrial.previous(),
                effect.terrestrial]
    }

    /// 司天在泉
    /// 客氣即是在天的三陰三陽之氣，因其運動不息，猶如客之往來，故稱客氣。又稱天氣。
    /// 客氣使用三陰三陽和司天在泉四間氣推算。
    ///
    /// - Parameters:
    ///  - branch: 需要計算客氣的地支
    /// - Returns: 對應地支的客氣，分上半年和下半年
    ///
    public static func climaticEffectOfYearBranch(_ branch: EarthlyBranch) -> ClimaticEffect {
        switch branch {
        case .zi, .wu: return .init(celestial: .mildYinFire, terrestrial: .mildYangMetal)
        case .chou, .wei: return .init(celestial: .dominantYinEarth, terrestrial: .dominantYangWater)
        case .yin, .shen: return .init(celestial: .weakYangFire, terrestrial: .weakYinWood)
        case .mao, .you: return .init(celestial: .mildYangMetal, terrestrial: .mildYinFire)
        case .chen, .xu: return .init(celestial: .dominantYangWater, terrestrial: .dominantYinEarth)
        case .si, .hai: return .init(celestial: .weakYinWood, terrestrial: .weakYangFire)
        }
    }

    // MARK: - 具體日期計算

    public static func fortune(of stemBranch: StemBranchCalendar.StemBranchDate) -> (host: Element, guest: GuestFortune) {
        let guestFortunes = guestFortunesOfYearStem(stemBranch.year.stem)
        let date = stemBranch.date

        switch stemBranch.year.branch {
        case .zi, .chen, .shen: // 子、辰、申年
            // 初运大寒日寅初初刻起
            // 二运春分后十三日寅正一刻起
            // 三运芒种后十日卯初二刻起
            // 四运处暑后七日卯正三刻起
            // 终运立冬后四日辰初四刻起
            let fortuneAndQi = date.returnBeforeFirst([
                (.greatCold, .yin, 0, (Element.water, guestFortunes[4])),
                (.vernalEquinox, .yin, 13, (Element.tree, guestFortunes[0])),
                (.grainInEar, .mao, 10, (Element.fire, guestFortunes[1])),
                (.heatStops, .mao, 7, (Element.earth, guestFortunes[2])),
                (.winterBegins, .chen, 4, (Element.metal, guestFortunes[3]))
            ], defaultValue: (Element.water, guestFortunes[4]))
            return (host: fortuneAndQi.0, guest: fortuneAndQi.1)
        case .chou, .si, .you: // 丑、巳、酉年
            // 初运大寒日巳初初刻起
            // 二运春分后十三日巳正一刻起
            // 三运芒种后十日午初二刻起
            // 四运处暑后七日午正三刻起
            // 终运立冬后四日未初四刻起
            let fortuneAndQi = date.returnBeforeFirst([
                (.greatCold, .si, 0, (Element.water, guestFortunes[4])),
                (.vernalEquinox, .si, 13, (Element.tree, guestFortunes[0])),
                (.grainInEar, .wu, 10, (Element.fire, guestFortunes[1])),
                (.heatStops, .wu, 7, (Element.earth, guestFortunes[2])),
                (.winterBegins, .wei, 4, (Element.metal, guestFortunes[3]))
            ], defaultValue: (Element.water, guestFortunes[4]))
            return (host: fortuneAndQi.0, guest: fortuneAndQi.1)
        case .yin, .wu, .xu: // 寅、午、戌年
            // 初运大寒日申初初刻起
            // 二运春分后十三日申正一刻起
            // 三运芒种后十日酉初二刻起
            // 四运处暑后七日酉正三刻起
            // 终运立冬后四日戌初四刻起
            let fortuneAndQi = date.returnBeforeFirst([
                (.greatCold, .shen, 0, (Element.water, guestFortunes[4])),
                (.vernalEquinox, .shen, 13, (Element.tree, guestFortunes[0])),
                (.grainInEar, .you, 10, (Element.fire, guestFortunes[1])),
                (.heatStops, .you, 7, (Element.earth, guestFortunes[2])),
                (.winterBegins, .xu, 4, (Element.metal, guestFortunes[3]))
            ], defaultValue: (Element.water, guestFortunes[4]))
            return (host: fortuneAndQi.0, guest: fortuneAndQi.1)
        case .mao, .wei, .hai: // 卯、未、亥年
            // 初运大寒日亥初初刻起
            // 二运春分后十三日亥正一刻起
            // 三运芒种后十日子初二刻起
            // 四运处暑后七日子正三刻起
            // 终运立冬后四日丑初四刻起
            let fortuneAndQi = date.returnBeforeFirst([
                (.greatCold, .hai, 0, (Element.water, guestFortunes[4])),
                (.vernalEquinox, .hai, 13, (Element.tree, guestFortunes[0])),
                (.grainInEar, .zi, 10, (Element.fire, guestFortunes[1])),
                (.heatStops, .zi, 7, (Element.earth, guestFortunes[2])),
                (.winterBegins, .chou, 4, (Element.metal, guestFortunes[3]))
            ], defaultValue: (Element.water, guestFortunes[4]))
            return (host: fortuneAndQi.0, guest: fortuneAndQi.1)
        }
    }

    /// 六步    六气    二十四节气
    /// 初之气    厥阴风木    大寒到春分
    /// 二之气    少阴君火    春分到小满
    /// 三之气    少阳相火    小满到大暑
    /// 四之气    太阴湿土    大暑到秋分
    /// 五之气    阳明燥金    秋分到小雪
    /// 终之气    太阳寒水    小雪到大寒
    public static func of(stemBranch: StemBranchCalendar.StemBranchDate) -> (host: Qi, guest: Qi) {
        let guestQi = guestQiOfYear(of: stemBranch.year.branch)
        let date = stemBranch.date
        if date.isBefore(solarTerm: .greatCold, offset: 0) {
            return (.dominantYangWater, guestQi[5])
        } else if
            date.isAfter(solarTerm: .greatCold, offset: 0),
            date.isBefore(solarTerm: .vernalEquinox, offset: 0) {
            return (.weakYinWood, guestQi[0])
        } else if
            date.isAfter(solarTerm: .vernalEquinox, offset: 0),
            date.isBefore(solarTerm: .grainBuds, offset: 0) {
            return (.mildYinFire, guestQi[1])
        } else if
            date.isAfter(solarTerm: .grainBuds, offset: 0),
            date.isBefore(solarTerm: .greatHeat, offset: 0) {
            return (.weakYangFire, guestQi[2])
        } else if
            date.isAfter(solarTerm: .greatHeat, offset: 0),
            date.isBefore(solarTerm: .autumnEquinox, offset: 0) {
            return (.dominantYinEarth, guestQi[3])
        } else if
            date.isAfter(solarTerm: .autumnEquinox, offset: 0),
            date.isBefore(solarTerm: .lightSnow, offset: 0) {
            return (.mildYangMetal, guestQi[4])
        } else if date.isAfter(solarTerm: .lightSnow, offset: 0) {
            return (.dominantYangWater, guestQi[5])
        }

        preconditionFailure("Cannot get host Qi of date \(date).")
    }

    /// 計算指定日期的五運六氣
    ///
    public static func fortuneAndQi(of stemBranch: StemBranchCalendar.StemBranchDate) -> FiveFortuneSixQi {
        let yearlyFortune = fortuneOfYear(of: stemBranch.year.stem)
        let year = FortuneAndQiOfYear(
            yearlyFortune: yearlyFortune,
            hostFortunes: hostFortunesOfYear(),
            guestFortunes: guestFortunesOfYearStem(stemBranch.year.stem),
            hostSixQi: hostQiOfYear(),
            guestSixQi: guestQiOfYear(of: stemBranch.year.branch),
            climaticEffect: climaticEffectOfYearBranch(stemBranch.year.branch))
        let now = FortuneAndQiOfNow(
            fortune: fortune(of: stemBranch),
            qi: of(stemBranch: stemBranch))
        return .init(year: year, now: now)
    }
}

extension HeavenlyStem: Elemental {

    /// 十干化運
    /// 十天干對應五運關係為甲己屬土，乙庚屬金，丙辛屬水，丁壬屬木，戊癸屬火
    public var element: Element {
        switch self {
        case .jia, .ji:
            return .earth
        case .yi, .geng:
            return .metal
        case .bing, .xin:
            return .water
        case .ding, .ren:
            return .tree
        case .wu, .gui:
            return .fire
        }
    }
}

public extension HeavenlyStem {

    /// 天干對應的太過與不及
    var adequacy: Qi.Adequacy {
        switch self {
        case .jia, .bing, .wu, .geng, .ren:
            return .excess
        case .yi, .ding, .ji, .xin, .gui:
            return .deficiency
        }
    }
}

public extension Qi {

    func compound() -> Compound {
        switch self {
        case .weakYinWood:
            return .init(phase: .weak, yinyang: .yin, factor: .wind, element: .tree, division: .init(start: .greatCold, end: .vernalEquinox))
        case .mildYinFire:
            return .init(phase: .mild, yinyang: .yin, factor: .heat, element: .fire, division: .init(start: .vernalEquinox, end: .grainBuds))
        case .dominantYinEarth:
            return .init(phase: .dominant, yinyang: .yin, factor: .damp, element: .earth, division: .init(start: .greatHeat, end: .autumnEquinox))
        case .weakYangFire:
            return .init(phase: .weak, yinyang: .yang, factor: .fire, element: .fire, division: .init(start: .grainBuds, end: .greatHeat))
        case .mildYangMetal:
            return .init(phase: .mild, yinyang: .yang, factor: .dryness, element: .metal, division: .init(start: .autumnEquinox, end: .lightSnow))
        case .dominantYangWater:
            return .init(phase: .dominant, yinyang: .yang, factor: .cold, element: .water, division: .init(start: .lightSnow, end: .greatCold))
        }
    }

    func previous() -> Self {
        switch self {
        case .weakYinWood:
            return .dominantYangWater
        case .mildYinFire:
            return .weakYinWood
        case .dominantYinEarth:
            return .mildYinFire
        case .weakYangFire:
            return .dominantYinEarth
        case .mildYangMetal:
            return .weakYangFire
        case .dominantYangWater:
            return .mildYangMetal
        }

    }
}

extension Qi.Adequacy {

    func opposite() -> Qi.Adequacy {
        self == .deficiency ? .excess : .deficiency
    }
}

extension Date {

    func isBefore(solarTerm: SolarTerm, hourBranch: EarthlyBranch? = nil, offset days: Int) -> Bool {
        let range = dateRangeOf(solarTerm: solarTerm, hourBranch: hourBranch, offsetInDays: days)
        return self < range.lowerBound
    }

    func isAfter(solarTerm: SolarTerm, hourBranch: EarthlyBranch? = nil, offset days: Int) -> Bool {
        let range = dateRangeOf(solarTerm: solarTerm, hourBranch: hourBranch, offsetInDays: days)
        return self > range.upperBound
    }

    func returnBeforeFirst<T>(_ solarTerms: [(solarTerm: SolarTerm, hourBranch: EarthlyBranch?, offset: Int, value: T)], defaultValue: T) -> T {
        guard let first = returnBeforeFirst(solarTerms) else {
            return defaultValue
        }
        return first
    }

    func returnBeforeFirst<T>(_ solarTerms: [(solarTerm: SolarTerm, hourBranch: EarthlyBranch?, offset: Int, value: T)]) -> T? {
        if let solarTerm = solarTerms.first(where: { isBefore(solarTerm: $0.solarTerm, hourBranch: $0.hourBranch, offset: $0.offset) }) {
            return solarTerm.value
        }
        return nil
    }

    func dateRangeOf(solarTerm: SolarTerm, hourBranch: EarthlyBranch? = nil, offsetInDays days: Int) -> ClosedRange<Date> {
        guard let year = Calendar(identifier: .gregorian)
            .dateComponents([.year], from: self)
            .year else {
            preconditionFailure("Cannot get year from date \(self) with Gregorian calendar!")
        }
        let hours = hourBranch?.toTwentyFourHours() ?? (0, 0)
        let monthAndDay = SolarTerm.monthAndDay(of: solarTerm, in: year)

        let gregorian = Calendar(identifier: .gregorian)
        guard let fromDate = DateComponents(
            calendar: gregorian,
            year: year,
            month: monthAndDay.month,
            day: monthAndDay.day,
            hour: hours.0)
            .date?
            .addingTimeInterval(TimeInterval(days * 24 * 60 * 60)) else {
            preconditionFailure("Cannot extract Gregorian date for month and day \(monthAndDay) of year \(year)!")
        }
        guard let toDate = DateComponents(
            calendar: gregorian,
            year: year,
            month: monthAndDay.month,
            day: monthAndDay.day,
            hour: hours.1 > hours.0 ? hours.1 : hours.1 + 24)
            .date?
            .addingTimeInterval(TimeInterval(days * 24 * 60 * 60)) else {
            preconditionFailure("Cannot extract Gregorian date for month and day \(monthAndDay) of year \(year)!")
        }
        return fromDate...toDate
    }
}