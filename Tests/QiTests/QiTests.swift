import XCTest
@testable import Qi

final class QiTests: XCTestCase {

    typealias LunarDate = LunarCalendar.LunarDate

    /// 陰陽
    func testYinYang() {
        XCTAssertEqual(!YinYang.yin, .yang)
        XCTAssertEqual(!YinYang.yang, .yin)
    }

    /// 五行
    func testElements() {

        // 相生
        XCTAssertEqual(Element.tree.generate(), .fire)
        XCTAssertEqual(Element.fire.generate(), .earth)
        XCTAssertEqual(Element.earth.generate(), .metal)
        XCTAssertEqual(Element.metal.generate(), .water)
        XCTAssertEqual(Element.water.generate(), .tree)

        // 相剋
        XCTAssertEqual(Element.tree.restrain(), .earth)
        XCTAssertEqual(Element.fire.restrain(), .metal)
        XCTAssertEqual(Element.earth.restrain(), .water)
        XCTAssertEqual(Element.metal.restrain(), .tree)
        XCTAssertEqual(Element.water.restrain(), .fire)
    }

    /// 五味
    func testFlavors() {
        XCTAssertEqual(Flavor.sour.into(), .liver)
        XCTAssertEqual(Flavor.bitter.into(), .heart)
        XCTAssertEqual(Flavor.sweet.into(), .spleen)
        XCTAssertEqual(Flavor.spicy.into(), .lungs)
        XCTAssertEqual(Flavor.salty.into(), .kidney)
    }

    /// 五臟
    func testOrgans() {
        XCTAssertEqual(Organ.Zang.heart.element, .fire)
        XCTAssertEqual(Organ.Zang.liver.element, .tree)
        XCTAssertEqual(Organ.Zang.spleen.element, .earth)
        XCTAssertEqual(Organ.Zang.lungs.element, .metal)
        XCTAssertEqual(Organ.Zang.kidney.element, .water)

        XCTAssertEqual(Organ.Zang.liver.generate(), .heart)
        XCTAssertEqual(Organ.Zang.heart.generate(), .spleen)
        XCTAssertEqual(Organ.Zang.spleen.generate(), .lungs)
        XCTAssertEqual(Organ.Zang.lungs.generate(), .kidney)
        XCTAssertEqual(Organ.Zang.kidney.generate(), .liver)

        XCTAssertEqual(Organ.Zang.liver.restrain(), .spleen)
        XCTAssertEqual(Organ.Zang.heart.restrain(), .lungs)
        XCTAssertEqual(Organ.Zang.spleen.restrain(), .kidney)
        XCTAssertEqual(Organ.Zang.lungs.restrain(), .liver)
        XCTAssertEqual(Organ.Zang.kidney.restrain(), .heart)

        // 四季對應五臟
        XCTAssertEqual(Season.spring.zang, .liver)
        XCTAssertEqual(Season.summer.zang, .heart)
        XCTAssertEqual(Season.autumn.zang, .lungs)
        XCTAssertEqual(Season.winter.zang, .kidney)
    }

    /// 歲運
    func testElementAdequacyOfYear() {

        // 甲年土运太过
        XCTAssertEqual(Qi.yearFortune(of: .jia), .init(element: .earth, adequacy: .excess))

        // 乙年金运不及
        XCTAssertEqual(Qi.yearFortune(of: .yi), .init(element: .metal, adequacy: .deficiency))

        // 丙年水运太过
        XCTAssertEqual(Qi.yearFortune(of: .bing), .init(element: .water, adequacy: .excess))

        // 丁年木运不及
        XCTAssertEqual(Qi.yearFortune(of: .ding), .init(element: .tree, adequacy: .deficiency))

        // 戊年火运太过
        XCTAssertEqual(Qi.yearFortune(of: .wu), .init(element: .fire, adequacy: .excess))

        // 己年土运不及
        XCTAssertEqual(Qi.yearFortune(of: .ji), .init(element: .earth, adequacy: .deficiency))

        // 庚年金运太过
        XCTAssertEqual(Qi.yearFortune(of: .geng), .init(element: .metal, adequacy: .excess))

        // 辛年水运不及
        XCTAssertEqual(Qi.yearFortune(of: .xin), .init(element: .water, adequacy: .deficiency))

        // 壬年木运太过
        XCTAssertEqual(Qi.yearFortune(of: .ren), .init(element: .tree, adequacy: .excess))

        // 癸年火运不及
        XCTAssertEqual(Qi.yearFortune(of: .gui), .init(element: .fire, adequacy: .deficiency))
    }

    /// 主運
    func testHostFortunesOfYear() {
        XCTAssertEqual(Qi.yearlyHostFortunes(), [.tree, .fire, .earth, .metal, .water])
    }

    /// 客運
    func testGuestElementsOfYear() {
        XCTAssertEqual(Qi.guestFortunesOfYearStem(.jia), [
            Qi.ElementAndAdequacy(element: .earth, adequacy: .excess),
            Qi.ElementAndAdequacy(element: .metal, adequacy: .deficiency),
            Qi.ElementAndAdequacy(element: .water, adequacy: .excess),
            Qi.ElementAndAdequacy(element: .tree, adequacy: .deficiency),
            Qi.ElementAndAdequacy(element: .fire, adequacy: .excess),
        ])
    }

    /// 主氣
    func testPrimaryClimaticFactorsOfYear() {
        XCTAssertEqual(Qi.hostQiOfYear(), [
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
        ])
    }

    /// 客氣 - 司天/在泉
    func testGuestClimaticFactorsOfYear() {
        // 子午年/少阴君火/阳明燥金
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.zi),
                       .init(celestial: .mildYinFire, terrestrial: .mildYangMetal))
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.wu),
                       .init(celestial: .mildYinFire, terrestrial: .mildYangMetal))

        // 丑未年/太阴湿土/太阳寒水
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.chou),
                       .init(celestial: .dominantYinEarth, terrestrial: .dominantYangWater))
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.wei),
                       .init(celestial: .dominantYinEarth, terrestrial: .dominantYangWater))

        // 寅申年/少阳相火/厥阴风木
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.yin),
                       .init(celestial: .weakYangFire, terrestrial: .weakYinWood))
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.shen),
                       .init(celestial: .weakYangFire, terrestrial: .weakYinWood))

        // 卯酉年/阳明燥金/少阴君火
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.mao),
                       .init(celestial: .mildYangMetal, terrestrial: .mildYinFire))
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.you),
                       .init(celestial: .mildYangMetal, terrestrial: .mildYinFire))

        // 辰戌年/太阳寒水/太阴湿土
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.chen),
                       .init(celestial: .dominantYangWater, terrestrial: .dominantYinEarth))
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.xu),
                       .init(celestial: .dominantYangWater, terrestrial: .dominantYinEarth))

        // 巳亥年/厥阴风木/少阳相火
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.si),
                       .init(celestial: .weakYinWood, terrestrial: .weakYangFire))
        XCTAssertEqual(Qi.climaticEffectOfYearBranch(.hai),
                       .init(celestial: .weakYinWood, terrestrial: .weakYangFire))
    }

    func testFortuneAndQi() {
        let stemBranch = StemBranchCalendar().stemBranchDate(of: Date(year: 2023, month: 5, day: 12, hour: 12))
        let fiveSix = Qi.fortuneAndQi(of: stemBranch)
        XCTAssertEqual(fiveSix.year.yearlyFortune, .init(element: .fire, adequacy: .deficiency))
        XCTAssertEqual(fiveSix.year.fiveFortunes, [
            .init(host: .tree, guest: .init(element: .fire, adequacy: .deficiency), startDate: Date(), endDate: Date()),
            .init(host: .fire, guest: .init(element: .earth, adequacy: .excess), startDate: Date(), endDate: Date()),
            .init(host: .earth, guest: .init(element: .metal, adequacy: .deficiency), startDate: Date(), endDate: Date()),
            .init(host: .metal, guest: .init(element: .water, adequacy: .excess), startDate: Date(), endDate: Date()),
            .init(host: .water, guest: .init(element: .tree, adequacy: .deficiency), startDate: Date(), endDate: Date())
        ])
        XCTAssertEqual(fiveSix.year.climaticEffect, .init(celestial: .mildYangMetal, terrestrial: .mildYinFire))
        XCTAssertEqual(fiveSix.now.fortune.host, .fire)
        XCTAssertEqual(fiveSix.now.fortune.guest, .init(element: .earth, adequacy: .excess))
        XCTAssertEqual(fiveSix.now.qi.host, .mildYinFire)
        XCTAssertEqual(fiveSix.now.qi.guest, .weakYangFire)

        XCTAssertEqual(fiveSix.year.sixQi[0].host, .weakYinWood)
        XCTAssertEqual(fiveSix.year.sixQi[0].guest, .dominantYinEarth)
        XCTAssertEqual(fiveSix.year.sixQi[1].host, .mildYinFire)
        XCTAssertEqual(fiveSix.year.sixQi[1].guest, .weakYangFire)
        XCTAssertEqual(fiveSix.year.sixQi[2].host, .weakYangFire)
        XCTAssertEqual(fiveSix.year.sixQi[2].guest, .mildYangMetal)
        XCTAssertEqual(fiveSix.year.sixQi[3].host, .dominantYinEarth)
        XCTAssertEqual(fiveSix.year.sixQi[3].guest, .dominantYangWater)
        XCTAssertEqual(fiveSix.year.sixQi[4].host, .mildYangMetal)
        XCTAssertEqual(fiveSix.year.sixQi[4].guest, .weakYinWood)
        XCTAssertEqual(fiveSix.year.sixQi[5].host, .dominantYangWater)
        XCTAssertEqual(fiveSix.year.sixQi[5].guest, .mildYinFire)
    }

    func testStemBranch() {
        let calendar = StemBranchCalendar()

        let pastDate = Date(year: 1985, month: 11, day: 27)
        let past = calendar.stemBranchDate(of: pastDate)

        XCTAssertEqual(past.year, .yichou)
        XCTAssertEqual(past.month, .dinghai)
        XCTAssertEqual(past.day, .gengwu)

        let futureDate = Date(year: 2043, month: 9, day: 21)
        let future = StemBranchCalendar().stemBranchDate(of: futureDate)

        XCTAssertEqual(future.year, .guihai)
        XCTAssertEqual(future.month, .xinyou)
        XCTAssertEqual(future.day, .dingmao)

        let solarMonth = StemBranchCalendar(calculateMonthBasedOn: .solarTerm)
        let solarDate = solarMonth.stemBranchDate(of: Date(year: 2023, month: 5, day: 16))

        XCTAssertEqual(solarDate.year, .guimao)
        XCTAssertEqual(solarDate.month, .dingsi)
        XCTAssertEqual(solarDate.day, .jiaxu)

        let lunarMonth = StemBranchCalendar(calculateMonthBasedOn: .lunarMonth)
        let lunarDate = lunarMonth.stemBranchDate(of: Date(year: 2023, month: 5, day: 16))

        XCTAssertEqual(lunarDate.year, .guimao)
        XCTAssertEqual(lunarDate.month, .bingchen)
        XCTAssertEqual(lunarDate.day, .jiaxu)

        var currentTimeZone = StemBranchCalendar()
        guard let timeZonePlus10 = TimeZone(secondsFromGMT: 10 * 60 * 60) else {
            preconditionFailure("Cannot create timezone with 10 hours from GMT!")
        }

        currentTimeZone.timeZone = timeZonePlus10

        XCTAssertEqual(currentTimeZone.stemBranchDate(of: Date(year: 2023, month: 5, day: 6, hour: 0, timeZone: timeZonePlus10)).day, .jiazi)
        XCTAssertEqual(currentTimeZone.stemBranchDate(of: Date(year: 2023, month: 5, day: 17, hour: 23, timeZone: timeZonePlus10)).day, .yihai)
        XCTAssertEqual(currentTimeZone.stemBranchDate(of: Date(year: 2023, month: 5, day: 18, hour: 0, timeZone: timeZonePlus10)).day, .bingzi)
        XCTAssertEqual(currentTimeZone.stemBranchDate(of: Date(year: 2023, month: 5, day: 18, hour: 23, timeZone: timeZonePlus10)).day, .bingzi)
        XCTAssertEqual(currentTimeZone.stemBranchDate(of: Date(year: 2023, month: 5, day: 19, hour: 0, timeZone: timeZonePlus10)).day, .dingchou)
    }

    func testSolarTerms() {
        let dateSolarTerms: [Date: SolarTerm] = [
            Date(year: 1901, month: 1, day: 6): .slightCold,
            Date(year: 1901, month: 1, day: 21): .greatCold,
            Date(year: 1901, month: 2, day: 4): .springBegins,
            Date(year: 1901, month: 2, day: 19): .theRains,
            Date(year: 1901, month: 3, day: 6): .insectsAwaken,
            Date(year: 1901, month: 3, day: 21): .vernalEquinox,
            Date(year: 1901, month: 4, day: 5): .clearAndBright,
            Date(year: 1901, month: 4, day: 21): .grainRain,
            Date(year: 1901, month: 5, day: 6): .summerBegins,
            Date(year: 1901, month: 5, day: 22): .grainBuds,
            Date(year: 1901, month: 6, day: 6): .grainInEar,
            Date(year: 1901, month: 6, day: 22): .summerSolstice,
            Date(year: 1901, month: 7, day: 8): .slightHeat,
            Date(year: 1901, month: 7, day: 23): .greatHeat,
            Date(year: 1901, month: 8, day: 8): .autumnBegins,
            Date(year: 1901, month: 8, day: 24): .heatStops,
            Date(year: 1901, month: 9, day: 8): .whiteDews,
            Date(year: 1901, month: 9, day: 24): .autumnEquinox,
            Date(year: 1901, month: 10, day: 9): .coldDews,
            Date(year: 1901, month: 10, day: 24): .frostFalls,
            Date(year: 1901, month: 11, day: 8): .winterBegins,
            Date(year: 1901, month: 11, day: 23): .lightSnow,
            Date(year: 1901, month: 12, day: 8): .heavySnow,
            Date(year: 1901, month: 12, day: 22): .winterSolstice,
            Date(year: 2023, month: 4, day: 5): .clearAndBright,
            Date(year: 2100, month: 1, day: 5): .slightCold,
            Date(year: 2100, month: 12, day: 22): .winterSolstice,
        ]
        dateSolarTerms.forEach { date, solarTerm in
            XCTAssertEqual(SolarTerm.of(date), solarTerm)
        }

        XCTAssertEqual(SolarTerm.rangeOf(Date(year: 2023, month: 4, day: 5)), .onTheDay(.clearAndBright))
        XCTAssertEqual(SolarTerm.rangeOf(Date(year: 2023, month: 4, day: 6)), .within(.clearAndBright, .grainRain))
        XCTAssertEqual(SolarTerm.rangeOf(Date(year: 2100, month: 12, day: 23)), .within(.winterSolstice, .slightCold))
    }

    func testLunarCalendar() {
        let date = Date(year: 2023, month: 3, day: 22)
        let lunarDate = LunarCalendar().lunarDate(from: date)
        XCTAssertTrue(lunarDate.isLeapMonth)
        XCTAssertEqual(lunarDate.lastDayOfMonth, 30)
        XCTAssertEqual(lunarDate.monthAndDayText(of: .zhHant), "閏二月初一")
    }

    func testLanguages() {
        XCTAssertEqual(HeavenlyStem.jia.CNt, "甲")
        XCTAssertEqual(HeavenlyStem.yi.CNt, "乙")
        XCTAssertEqual(HeavenlyStem.bing.CNt, "丙")
        XCTAssertEqual(HeavenlyStem.ding.CNt, "丁")
        XCTAssertEqual(HeavenlyStem.wu.CNt, "戊")
        XCTAssertEqual(HeavenlyStem.ji.CNt, "己")
        XCTAssertEqual(HeavenlyStem.geng.CNt, "庚")
        XCTAssertEqual(HeavenlyStem.xin.CNt, "辛")
        XCTAssertEqual(HeavenlyStem.ren.CNt, "壬")
        XCTAssertEqual(HeavenlyStem.gui.CNt, "癸")

        XCTAssertEqual(EarthlyBranch.zi.CNt, "子")
        XCTAssertEqual(EarthlyBranch.chou.CNt, "丑")
        XCTAssertEqual(EarthlyBranch.yin.CNt, "寅")
        XCTAssertEqual(EarthlyBranch.mao.CNt, "卯")
        XCTAssertEqual(EarthlyBranch.chen.CNt, "辰")
        XCTAssertEqual(EarthlyBranch.si.CNt, "巳")
        XCTAssertEqual(EarthlyBranch.wu.CNt, "午")
        XCTAssertEqual(EarthlyBranch.wei.CNt, "未")
        XCTAssertEqual(EarthlyBranch.shen.CNt, "申")
        XCTAssertEqual(EarthlyBranch.you.CNt, "酉")
        XCTAssertEqual(EarthlyBranch.xu.CNt, "戌")
        XCTAssertEqual(EarthlyBranch.hai.CNt, "亥")

        XCTAssertEqual(EarthlyBranch.zi.zodiacAnimal.CNt, "鼠")
        XCTAssertEqual(EarthlyBranch.chou.zodiacAnimal.CNt, "牛")
        XCTAssertEqual(EarthlyBranch.yin.zodiacAnimal.CNt, "虎")
        XCTAssertEqual(EarthlyBranch.mao.zodiacAnimal.CNt, "兔")
        XCTAssertEqual(EarthlyBranch.chen.zodiacAnimal.CNt, "龍")
        XCTAssertEqual(EarthlyBranch.si.zodiacAnimal.CNt, "蛇")
        XCTAssertEqual(EarthlyBranch.wu.zodiacAnimal.CNt, "馬")
        XCTAssertEqual(EarthlyBranch.wei.zodiacAnimal.CNt, "羊")
        XCTAssertEqual(EarthlyBranch.shen.zodiacAnimal.CNt, "猴")
        XCTAssertEqual(EarthlyBranch.you.zodiacAnimal.CNt, "雞")
        XCTAssertEqual(EarthlyBranch.xu.zodiacAnimal.CNt, "狗")
        XCTAssertEqual(EarthlyBranch.hai.zodiacAnimal.CNt, "豬")

        XCTAssertEqual(StemBranch(stem: .geng, branch: .zi).CNt, "庚子")

        XCTAssertEqual(LunarDate(month: 1, day: 1).monthAndDayText(of: .zhHant), "正月初一")
        XCTAssertEqual(LunarDate(month: 1, day: 30).monthAndDayText(of: .zhHant), "正月三十")
        XCTAssertEqual(LunarDate(month: 2, day: 29).monthAndDayText(of: .zhHant), "二月廿九")
        XCTAssertEqual(LunarDate(month: 12, day: 30).monthAndDayText(of: .zhHant), "臘月三十")

        XCTAssertEqual(LunarCalendar.Holiday.springFestival.text(of: .zhHant), "春節")
        XCTAssertEqual(LunarCalendar.Holiday.lanternFestival.text(of: .zhHant), "元宵節")
        XCTAssertEqual(LunarCalendar.Holiday.dragonHeadRaisingDay.text(of: .zhHant), "龍抬頭")
        XCTAssertEqual(LunarCalendar.Holiday.doubleThirdFestival.text(of: .zhHant), "上巳節")
        XCTAssertEqual(LunarCalendar.Holiday.tombSweepingDay.text(of: .zhHant), "清明節")
        XCTAssertEqual(LunarCalendar.Holiday.dragonBoatFestival.text(of: .zhHant), "端午節")
        XCTAssertEqual(LunarCalendar.Holiday.qixi.text(of: .zhHant), "七夕節")
        XCTAssertEqual(LunarCalendar.Holiday.hungryGhostFestival.text(of: .zhHant), "中元節")
        XCTAssertEqual(LunarCalendar.Holiday.midAutumnDay.text(of: .zhHant), "中秋節")
        XCTAssertEqual(LunarCalendar.Holiday.doubleNinthFestival.text(of: .zhHant), "重陽節")
        XCTAssertEqual(LunarCalendar.Holiday.springFestivalEve.text(of: .zhHant), "除夕")
    }

    func testZodiacAnimals() {
        XCTAssertEqual(EarthlyBranch.zi.zodiacAnimal, .rat)
        XCTAssertEqual(EarthlyBranch.chou.zodiacAnimal, .ox)
        XCTAssertEqual(EarthlyBranch.yin.zodiacAnimal, .tiger)
        XCTAssertEqual(EarthlyBranch.mao.zodiacAnimal, .rabbit)
        XCTAssertEqual(EarthlyBranch.chen.zodiacAnimal, .dragon)
        XCTAssertEqual(EarthlyBranch.si.zodiacAnimal, .snake)
        XCTAssertEqual(EarthlyBranch.wu.zodiacAnimal, .horse)
        XCTAssertEqual(EarthlyBranch.wei.zodiacAnimal, .goat)
        XCTAssertEqual(EarthlyBranch.shen.zodiacAnimal, .monkey)
        XCTAssertEqual(EarthlyBranch.you.zodiacAnimal, .rooster)
        XCTAssertEqual(EarthlyBranch.xu.zodiacAnimal, .dog)
        XCTAssertEqual(EarthlyBranch.hai.zodiacAnimal, .pig)
    }

    func testLunarHolidays() {
        XCTAssertEqual(LunarDate(month: 1, day: 1).holiday, .springFestival)
        XCTAssertEqual(LunarDate(month: 1, day: 15).holiday, .lanternFestival)
        XCTAssertEqual(LunarDate(month: 2, day: 2).holiday, .dragonHeadRaisingDay)
        XCTAssertEqual(LunarDate(month: 3, day: 3).holiday, .doubleThirdFestival)
        XCTAssertEqual(LunarCalendar().lunarDate(from: Date(year: 2023, month: 4, day: 5)).holiday,
                       .tombSweepingDay)
        XCTAssertEqual(LunarDate(month: 5, day: 5).holiday, .dragonBoatFestival)
        XCTAssertEqual(LunarDate(month: 7, day: 7).holiday, .qixi)
        XCTAssertEqual(LunarDate(month: 7, day: 15).holiday, .hungryGhostFestival)
        XCTAssertEqual(LunarDate(month: 8, day: 15).holiday, .midAutumnDay)
        XCTAssertEqual(LunarDate(month: 9, day: 9).holiday, .doubleNinthFestival)

        // 十二月大
        XCTAssertEqual(Date(year: 2023, month: 1, day: 21).lunarDate().holiday, .springFestivalEve)

        // 十二月小
        XCTAssertEqual(Date(year: 2022, month: 1, day: 31).lunarDate().holiday, .springFestivalEve)
    }

    func testMeridianCycle() {
        XCTAssertEqual(EarthlyBranch.zi.meridianOnDuty, .gallbladderOfFootShaoyang)
        XCTAssertEqual(EarthlyBranch.chou.meridianOnDuty, .liverOfFootJueyin)
        XCTAssertEqual(EarthlyBranch.yin.meridianOnDuty, .lungOfHandTaiyin)
        XCTAssertEqual(EarthlyBranch.mao.meridianOnDuty, .largeIntestineOfHandYangming)
        XCTAssertEqual(EarthlyBranch.chen.meridianOnDuty, .stomachOfFootYangming)
        XCTAssertEqual(EarthlyBranch.si.meridianOnDuty, .spleenOfFootTaiyin)
        XCTAssertEqual(EarthlyBranch.wu.meridianOnDuty, .heartOfHandShaoyin)
        XCTAssertEqual(EarthlyBranch.wei.meridianOnDuty, .smallInstestineHandTaiyang)
        XCTAssertEqual(EarthlyBranch.shen.meridianOnDuty, .bladderOfFootTaiyang)
        XCTAssertEqual(EarthlyBranch.you.meridianOnDuty, .kidneyOfFootShaoyin)
        XCTAssertEqual(EarthlyBranch.xu.meridianOnDuty, .pericardiumOfHandJueyin)
        XCTAssertEqual(EarthlyBranch.hai.meridianOnDuty, .tripleEnergizerOfHandShaoyang)

        XCTAssertEqual(Meridian.gallbladderOfFootShaoyang.onDutyHourBranch, .zi)
        XCTAssertEqual(Meridian.liverOfFootJueyin.onDutyHourBranch, .chou)
        XCTAssertEqual(Meridian.lungOfHandTaiyin.onDutyHourBranch, .yin)
        XCTAssertEqual(Meridian.largeIntestineOfHandYangming.onDutyHourBranch, .mao)
        XCTAssertEqual(Meridian.stomachOfFootYangming.onDutyHourBranch, .chen)
        XCTAssertEqual(Meridian.spleenOfFootTaiyin.onDutyHourBranch, .si)
        XCTAssertEqual(Meridian.heartOfHandShaoyin.onDutyHourBranch, .wu)
        XCTAssertEqual(Meridian.smallInstestineHandTaiyang.onDutyHourBranch, .wei)
        XCTAssertEqual(Meridian.bladderOfFootTaiyang.onDutyHourBranch, .shen)
        XCTAssertEqual(Meridian.kidneyOfFootShaoyin.onDutyHourBranch, .you)
        XCTAssertEqual(Meridian.pericardiumOfHandJueyin.onDutyHourBranch, .xu)
        XCTAssertEqual(Meridian.tripleEnergizerOfHandShaoyang.onDutyHourBranch, .hai)
    }

    func testMeridianCodes() {
        XCTAssertEqual(Meridian.lungOfHandTaiyin.code, "LU")
        XCTAssertEqual(Meridian.largeIntestineOfHandYangming.code, "LI")
        XCTAssertEqual(Meridian.stomachOfFootYangming.code, "ST")
        XCTAssertEqual(Meridian.spleenOfFootTaiyin.code, "SP")
        XCTAssertEqual(Meridian.heartOfHandShaoyin.code, "HT")
        XCTAssertEqual(Meridian.smallInstestineHandTaiyang.code, "SI")
        XCTAssertEqual(Meridian.bladderOfFootTaiyang.code, "BL")
        XCTAssertEqual(Meridian.kidneyOfFootShaoyin.code, "KI")
        XCTAssertEqual(Meridian.pericardiumOfHandJueyin.code, "PC")
        XCTAssertEqual(Meridian.tripleEnergizerOfHandShaoyang.code, "TE")
        XCTAssertEqual(Meridian.gallbladderOfFootShaoyang.code, "GB")
        XCTAssertEqual(Meridian.liverOfFootJueyin.code, "LR")
        XCTAssertEqual(Meridian.governingVessel.code, "GV")
        XCTAssertEqual(Meridian.conceptionVessel.code, "CV")
        XCTAssertEqual(Meridian.thouroughfareVessel.code, "TV")
        XCTAssertEqual(Meridian.beltVessel.code, "BV")
        XCTAssertEqual(Meridian.yinLinkVessel.code, "YinLV")
        XCTAssertEqual(Meridian.yangLinkVessel.code, "YangLV")
        XCTAssertEqual(Meridian.yinHeelVessel.code, "YinHV")
        XCTAssertEqual(Meridian.yangHeelVessel.code, "YangHV")
    }
}

private extension Date {

    init(year: Int, month: Int, day: Int, hour: Int = 12, calendar: Calendar = .init(identifier: .gregorian), timeZone: TimeZone? = .init(secondsFromGMT: 8)) {
        var components = DateComponents()
        components.timeZone = timeZone
        components.year = year
        components.month = month
        components.day = day
        components.hour = hour

        guard let date = calendar.date(from: components) else {
            preconditionFailure("Cannot create date for year \(year) month \(month) day \(day) hour \(hour) with calendar \(calendar)!")
        }
        self = date
    }
}

private extension LunarCalendar.LunarDate {
    init(month: Int, day: Int) {
        self = .init(era: 1, year: 1, month: month, day: day, hour: .zi, isLeapMonth: false, solarTermDayRange: nil)
    }
}

private extension Date {
    func lunarDate() -> LunarCalendar.LunarDate {
        LunarCalendar().lunarDate(from: self)
    }
}

extension Qi.HostGuestWithDate<Element, Qi.ElementAndAdequacy>: Equatable {
    public static func == (lhs: Qi.HostGuestWithDate<Element, Qi.ElementAndAdequacy>, rhs: Qi.HostGuestWithDate<Element, Qi.ElementAndAdequacy>) -> Bool {
        lhs.host == rhs.host && lhs.guest == rhs.guest
    }
}
