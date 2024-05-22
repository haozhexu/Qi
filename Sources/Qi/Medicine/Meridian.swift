//
//  File.swift
//  
//
//  Created by Haozhe XU on 5/6/2023.
//

import Foundation

/// 經絡
public struct Meridian: Equatable {
    let name: LocalizedTextProvider
    let code: String
    let acupoints: [Acupoint]

    static let lungOfHandTaiyin = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Lung Meridian of Hand-Taiyin",
                .zhHans: "手太阴肺经",
                .zhHant: "手太陰肺經"
            ]
        ),
        code: "LU",
        acupoints: [
            .zhongfu,
            .yunmen,
            .tianfu,
            .xiabai,
            .chize,
            .kongzui,
            .lieque,
            .jingqu,
            .taiyuan,
            .yuji,
            .shaoshang
        ]
    )

    static let largeIntestineOfHandYangming = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Large Intestine Meridian of Hand-Yangming",
                .zhHans: "手阳明大肠经",
                .zhHant: "手陽明大腸經"
            ]
        ),
        code: "LI",
        acupoints: [
            .shangyang,
            .erjian,
            .sanjian,
            .hegu,
            .yangxi,
            .pianli,
            .wenliu,
            .xialian,
            .shanglian,
            .shousanli,
            .quchi,
            .zhouliao,
            .shouwuli,
            .binao,
            .jianyu,
            .jugu,
            .tianding,
            .futu,
            .heliao,
            .yingxiang
        ]
    )
    
    static let stomachOfFootYangming = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Stomach Meridian of Foot-Yangming",
                .zhHans: "足阳明胃经",
                .zhHant: "足陽明胃經"
            ]
        ),
        code: "ST",
        acupoints: [
            .chengqi,
            .sibai,
            .juliao,
            .dicang,
            .daying,
            .pinche,
            .xiaguan,
            .touwei,
            .renying,
            .shuitu,
            .qishe,
            .quepen,
            .qihu,
            .kufang,
            .wuyi,
            .yingchuang,
            .ruzhong,
            .rugen,
            .burong,
            .chengman,
            .liangmen,
            .guanmen,
            .taiyi,
            .huaroumen,
            .tianshu,
            .wailing,
            .daju,
            .shuidao,
            .guilai,
            .qichong,
            .biguan,
            .futu32,
            .yinshi,
            .liangqiu,
            .dubi,
            .zusanli,
            .shangjuxu,
            .tiaokou,
            .xiajuxu,
            .fenglong,
            .jiexi,
            .chongyang,
            .xiangu,
            .neiting,
            .lidui
        ]
    )
    
    static let spleenOfFootTaiyin = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Spleen Meridian of Foot-Taiyin",
                .zhHans: "足太阴脾经",
                .zhHant: "足太陰脾經"
            ]
        ),
        code: "SP",
        acupoints: [
            .yinbai,
            .dadu,
            .taibai,
            .gongsun,
            .shangqiu,
            .sanyinjiao,
            .lougu,
            .diji,
            .yinlingquan,
            .xuehai,
            .jimen,
            .chongmen,
            .fushe,
            .fujie,
            .daheng,
            .fuai,
            .shidou,
            .tianxi,
            .xiongxiang,
            .zhourong,
            .dabao
        ]
    )
    
    static let heartOfHandShaoyin = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Heart Meridian of Hand-Shaoyin",
                .zhHans: "手少阴心经",
                .zhHant: "手少陰心經"
            ]
        ),
        code: "HT",
        acupoints: [
            .jiquan,
            .qingling,
            .shaohai,
            .lingdao,
            .tongli,
            .yinxi,
            .shenmen,
            .shaofu,
            .shaochong
        ]
    )

    static let smallInstestineHandTaiyang = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Small Instestine Meridian of Hand-Taiyang",
                .zhHans: "手太阳小肠经",
                .zhHant: "手太陽小腸經"
            ]
        ),
        code: "SI",
        acupoints: [
            .shaoze,
            .qiangu,
            .houxi,
            .wangu,
            .yanggu,
            .yanglao,
            .zhizheng,
            .xiaohai,
            .jianzhen,
            .naoshu,
            .tianzong,
            .bingfeng,
            .quyuan,
            .jianwaishu,
            .jianzhongshu,
            .tianchuang,
            .tianrong,
            .quanliao,
            .tinggong
        ]
    )
    
    static let bladderOfFootTaiyang = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Bladder Meridian of Foot-Taiyang",
                .zhHans: "足太阳膀胱经",
                .zhHant: "足太陽膀胱經"
            ]
        ),
        code: "BL",
        acupoints: [
            .qingming,
            .cuanzhu,
            .meichong,
            .qucha,
            .wuchu,
            .chengguang,
            .tongtian,
            .luoque,
            .yuzhen,
            .tianzhu,
            .dazhu,
            .fengmen,
            .feishu,
            .jueyinshu,
            .xinshu,
            .dushu,
            .geshu,
            .ganshu,
            .danshu,
            .pishu,
            .weishu,
            .sanjiaoshu,
            .shenshu,
            .qihaishu,
            .dachangshu,
            .guanyuanshu,
            .xiaochangshu,
            .pangguangshu,
            .zhonglvshu,
            .baihuanshu,
            .shangliao,
            .ciliao,
            .zhongliao,
            .xialiao,
            .huiyang,
            .chengfu,
            .yinmen,
            .fuxi,
            .weiyang,
            .weizhong,
            .fufen,
            .pohu,
            .gaohuang,
            .shentang,
            .yixi,
            .geguan,
            .hunmen,
            .yanggang,
            .yishe,
            .weicang,
            .huangmen,
            .zhishi,
            .baohuang,
            .yibian,
            .heyang,
            .chengjin,
            .chengshan,
            .feiyang,
            .fuyang,
            .kunlun,
            .pucan,
            .shenmai,
            .jinmen,
            .jinggu,
            .shugu,
            .zutonggu,
            .zhiyin
        ]
    )
    
    static let kidneyOfFootShaoyin = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Kidney Meridian of Foot-Shaoyin",
                .zhHans: "足少阴肾经",
                .zhHant: "足少陰腎經"
            ]
        ),
        code: "KI",
        acupoints: [
            .yongquan,
            .rangu,
            .taixi,
            .dazhong,
            .shuiquan,
            .zhaohai,
            .fuliu,
            .jiaoxin,
            .zhubin,
            .yingu,
            .henggu,
            .dahe,
            .qixue,
            .siman,
            .zhongzhu,
            .huangshu,
            .shangqu,
            .shiguan,
            .yindu,
            .futonggu,
            .youmen,
            .bulang,
            .shenfeng,
            .lingxu,
            .shencang,
            .yuzhong,
            .shufu
        ]
    )
    
    static let pericardiumOfHandJueyin = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Pericardium Meridian of Hand-Jueyin",
                .zhHans: "手厥阴心包经",
                .zhHant: "手厥陰心包經"
            ]
        ),
        code: "PC",
        acupoints: [
            .tianchi,
            .tianquan,
            .quze,
            .ximen,
            .jianshi,
            .neiguan,
            .daling,
            .laogong,
            .zhongchong
        ]
    )
    
    static let tripleEnergizerOfHandShaoyang = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Triple Energizer Meridian of Hand-Shaoyang",
                .zhHans: "手少阳三焦经",
                .zhHant: "手少陽三焦經"
            ]
        ),
        code: "TE",
        acupoints: [
            .guanchong,
            .yemen,
            .zhongzhu3,
            .yangchi,
            .waiguan,
            .zhigou,
            .huizong,
            .sanyangluo,
            .sidu,
            .tianjing,
            .qinglengyuan,
            .xiaoluo,
            .naohui,
            .jianliao,
            .tianyou,
            .yifeng,
            .chimai,
            .luxi,
            .jiaosun,
            .ermen,
            .erheliao,
            .sikongzhu
        ]
    )
    
    static let gallbladderOfFootShaoyang = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Gallbladder Meridian of Foot-Shaoyang",
                .zhHans: "足少阳胆经",
                .zhHant: "足少陽膽經"
            ]
        ),
        code: "GB",
        acupoints: [
            .tongziliao,
            .tinghui,
            .shangguan,
            .hanyan,
            .xuanlu,
            .xuanli,
            .qubin,
            .shuaigu,
            .tianchong,
            .fubai,
            .touqiaoyin,
            .wangu12,
            .benshen,
            .yangbai,
            .toulinqi,
            .muchuang,
            .zhengying,
            .chengling,
            .naokong,
            .fengchi,
            .jianjing,
            .yuanye,
            .zhejin,
            .riyue,
            .jingmen,
            .daimai,
            .wushu,
            .weidao,
            .juliao29,
            .huantiao,
            .fengshi,
            .zhongdu,
            .xiyangguan,
            .yanglingquan,
            .yangjiao,
            .waiqiu,
            .guangming,
            .yangfu,
            .xuanzhong,
            .qiuxu,
            .zulinqi,
            .diwuhui,
            .xiaxi,
            .zuqiaoyin
        ]
    )
    
    static let liverOfFootJueyin = Meridian(
        name: LocalizedText(
            localizedText: [
                .en: "Liver Meridian of Foot-Jueyin",
                .zhHans: "足厥阴肝经",
                .zhHant: "足厥陰肝經"
            ]
        ),
        code: "LR",
        acupoints: [
            .dadun,
            .hangjian,
            .taichong,
            .zhongfeng,
            .ligou,
            .zhongdu6,
            .xiguan,
            .ququan,
            .yinbao,
            .zuwuli,
            .yinlian,
            .jimai,
            .zhangmen,
            .qimen
        ]
    )

    // MARK: - Equatable

    public static func == (lhs: Meridian, rhs: Meridian) -> Bool {
        lhs.code == rhs.code
    }
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
            return .gallbladderOfFootShaoyang
        case .chou:
            return .liverOfFootJueyin
        case .yin:
            return .lungOfHandTaiyin
        case .mao:
            return .largeIntestineOfHandYangming
        case .chen:
            return .stomachOfFootYangming
        case .si:
            return .spleenOfFootTaiyin
        case .wu:
            return .heartOfHandShaoyin
        case .wei:
            return .smallInstestineHandTaiyang
        case .shen:
            return .bladderOfFootTaiyang
        case .you:
            return .kidneyOfFootShaoyin
        case .xu:
            return .pericardiumOfHandJueyin
        case .hai:
            return .tripleEnergizerOfHandShaoyang
        }
    }
}

public extension Meridian {

    var onDutyHourBranch: EarthlyBranch? {
        switch self {
        case .lungOfHandTaiyin:
            return .yin
        case .heartOfHandShaoyin:
            return .wu
        case .pericardiumOfHandJueyin:
            return .xu
        case .tripleEnergizerOfHandShaoyang:
            return .hai
        case .smallInstestineHandTaiyang:
            return .wei
        case .largeIntestineOfHandYangming:
            return .mao
        case .spleenOfFootTaiyin:
            return .si
        case .kidneyOfFootShaoyin:
            return .you
        case .liverOfFootJueyin:
            return .chou
        case .gallbladderOfFootShaoyang:
            return .zi
        case .bladderOfFootTaiyang:
            return .shen
        case .stomachOfFootYangming:
            return .chen
        default:
            return nil
        }
    }
}
