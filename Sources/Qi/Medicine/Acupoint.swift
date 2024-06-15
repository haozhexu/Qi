//
//  File.swift
//  
//
//  Created by Haozhe XU on 30/6/2023.
//

import Foundation

/// Acupuncture points are anatomically defined areas on the skin relative to certain landmarks on the body.
/// The original Chinese pictographs for acupoints indicated that there were holes in the skin through which qi energy could flow.
/// These acupoints can be reliably detected with electrodermal measurements.

public enum Acupoint: String, Decodable {

    // MARK: - 手太陰肺經

    /// 1.中府
    case zhongfu

    /// 2.雲門
    case yunmen

    /// 3.天府
    case tianfu

    /// 4.俠白
    case xiabai

    /// 5.尺澤
    case chize

    /// 6.孔最
    /// Kǒngzuì
    case kongzui

    /// 7.列缺
    case lieque

    /// 8.經渠
    case jingqu

    /// 9.太淵
    case taiyuan

    /// 10.魚際
    case yuji

    /// 11.少商
    case shaoshang

    // MARK: - 手陽明大腸經

    /// 1.商陽
    case shangyang

    /// 2.二間
    case erjian

    /// 3.三間
    case sanjian

    /// 4.合谷
    case hegu

    /// 5.陽谿
    /// Yángxī
    case yangxi

    /// 6.偏歷
    case pianli

    /// 7.溫溜
    case wenliu

    /// 8.下廉
    case xialian

    /// 9.上廉
    case shanglian

    /// 10.手三里
    case shousanli

    /// 11.曲池
    case quchi

    /// 12.肘髎
    case zhouliao

    /// 13.手五里
    case shouwuli

    /// 14.臂臑
    /// Bìnào
    case binao

    /// 15.肩髃
    /// Jiānyú
    case jianyu

    /// 16.巨骨
    case jugu

    /// 17.天鼎
    case tianding

    /// 18.扶突
    case futu

    /// 19.禾髎
    case heliao

    /// 20.迎香
    case yingxiang

    // MARK: - 足陽明胃經

    /// 1.承泣
    case chengqi

    /// 2.四白
    case sibai

    /// 3.巨髎
    case juliao

    /// 4.地倉
    case dicang

    /// 5.大迎
    case daying

    /// 6.頰車
    case pinche

    /// 7.下關
    case xiaguan

    /// 8.頭維
    case touwei

    /// 9.人迎
    case renying

    /// 10.水突
    case shuitu

    /// 11.氣舍
    case qishe

    /// 12.缺盆
    case quepen

    /// 13.氣戶
    case qihu

    /// 14.庫房
    case kufang

    /// 15.屋翳
    case wuyi

    /// 16.膺窗
    case yingchuang

    /// 17.乳中
    case ruzhong

    /// 18.乳根
    case rugen

    /// 19.不容
    case burong

    /// 20.承滿
    case chengman

    /// 21.梁門
    case liangmen

    /// 22.關門
    case guanmen

    /// 23.太乙
    case taiyi

    /// 24.滑肉門
    case huaroumen

    /// 25.天樞
    case tianshu

    /// 26.外陵
    case wailing

    /// 27.大巨
    case daju

    /// 28.水道
    case shuidao

    /// 29.歸來
    case guilai

    /// 30.氣衝
    case qichong

    /// 31.髀關
    /// Bìguān
    case biguan

    /// 32.伏兔
    case futu32

    /// 33.陰市
    case yinshi

    /// 34.梁丘
    case liangqiu

    /// 35.犢鼻
    /// Dúbí
    case dubi

    /// 36.足三里
    case zusanli

    /// 37.上巨虛
    case shangjuxu

    /// 38.條口
    case tiaokou

    /// 39.下巨虛
    case xiajuxu

    /// 40.豐隆
    case fenglong

    /// 41.解谿
    case jiexi

    /// 42.衝陽
    case chongyang

    /// 43.陷谷
    case xiangu

    /// 44.內庭
    case neiting

    /// 45.厲兌
    case lidui

    // MARK: - 足太陰脾經

    /// 1.隱白
    case yinbai

    /// 2.大都
    case dadu

    /// 3.太白
    case taibai

    /// 4.公孫
    case gongsun

    /// 5.商丘
    case shangqiu

    /// 6.三陰交
    case sanyinjiao

    /// 7.漏谷
    case lougu

    /// 8.地機
    case diji

    /// 9.陰陵泉
    case yinlingquan

    /// 10.血海
    case xuehai

    /// 11.箕門
    case jimen

    /// 12.衝門
    case chongmen

    /// 13.府舍
    case fushe

    /// 14.腹結
    case fujie

    /// 15.大橫
    case daheng

    /// 16.腹哀
    case fuai

    /// 17.食竇
    /// shí dòu
    case shidou

    /// 18.天谿
    case tianxi

    /// 19.胸鄉
    case xiongxiang

    /// 20.周榮
    case zhourong

    /// 21.大包
    case dabao

    // MARK: - 手少陰心經

    /// 1.極泉
    case jiquan

    /// 2.青靈
    case qingling

    /// 3.少海
    case shaohai

    /// 4.靈道
    case lingdao

    /// 5.通里
    case tongli

    /// 6.陰郄
    /// yīn xì
    case yinxi

    /// 7.神門
    case shenmen

    /// 8.少府
    case shaofu

    /// 9.少衝
    case shaochong

    // MARK: - 手太陽小腸經

    /// 1.少澤
    case shaoze

    /// 2.前谷
    case qiangu

    /// 3.後谿
    case houxi

    /// 4.腕骨
    case wangu

    /// 5.陽谷
    case yanggu

    /// 6.養老
    case yanglao

    /// 7.支正
    case zhizheng

    /// 8.小海
    case xiaohai

    /// 9.肩貞
    case jianzhen

    /// 10.臑俞
    case naoshu

    /// 11.天宗
    case tianzong

    /// 12.秉風
    case bingfeng

    /// 13.曲垣
    case quyuan

    /// 14.肩外俞
    case jianwaishu

    /// 15.肩中俞
    case jianzhongshu

    /// 16.天窗
    case tianchuang

    /// 17.天容
    case tianrong

    /// 18.顴髎
    case quanliao

    /// 19.聽宮
    case tinggong

    // MARK: - 足太陽膀胱經
    
    /// 1.睛明
    case qingming
    
    /// 2.攢竹
    case cuanzhu
    
    /// 3.眉衝
    case meichong
    
    /// 4.曲差
    case qucha
    
    /// 5.五處
    case wuchu
    
    /// 6.承光
    case chengguang
    
    /// 7.通天
    case tongtian
    
    /// 8.絡卻
    case luoque
    
    /// 9.玉枕
    case yuzhen
    
    /// 10.天柱
    case tianzhu
    
    /// 11.大杼
    case dazhu
    
    /// 12.風門
    case fengmen
    
    /// 13.肺俞
    case feishu
    
    /// 14.厥陰俞
    case jueyinshu
    
    /// 15.心俞
    case xinshu
    
    /// 16.督俞
    case dushu
    
    /// 17.膈俞
    case geshu
    
    /// 18.肝俞
    case ganshu
    
    /// 19.膽俞
    case danshu
    
    /// 20.脾俞
    case pishu
    
    /// 21.胃俞
    case weishu
    
    /// 22.三焦俞
    case sanjiaoshu
    
    /// 23.腎俞
    case shenshu
    
    /// 24.氣海俞
    case qihaishu
    
    /// 25.大腸俞
    case dachangshu
    
    /// 26.關元俞
    case guanyuanshu
    
    /// 27.小腸俞
    case xiaochangshu
    
    /// 28.膀胱俞
    case pangguangshu
    
    /// 29.中膂俞
    case zhonglvshu

    /// 30.白環俞
    case baihuanshu
    
    /// 31.上髎
    case shangliao
    
    /// 32.次髎
    case ciliao
    
    /// 33.中髎
    case zhongliao
    
    /// 34.下髎
    case xialiao
    
    /// 35.會陽
    case huiyang
    
    /// 36.承扶
    case chengfu
    
    /// 37.殷門
    case yinmen
    
    /// 38.浮郄
    /// fú xì
    case fuxi
    
    /// 39.委陽
    case weiyang
    
    /// 40.委中
    case weizhong
    
    /// 41.附分
    case fufen
    
    /// 42.魄戶
    case pohu
    
    /// 43.膏肓
    case gaohuang
    
    /// 44.神堂
    case shentang
    
    /// 45.譩譆
    /// yī xī
    case yixi
    
    /// 46.膈關
    case geguan
    
    /// 47.魂門
    case hunmen
    
    /// 48.陽綱
    case yanggang
    
    /// 49.意舍
    case yishe
    
    /// 50.胃倉
    case weicang
    
    /// 51.肓門
    case huangmen
    
    /// 52.志室
    case zhishi
    
    /// 53.胞肓
    case baohuang
    
    /// 54.秩邊
    case yibian
    
    /// 55.合陽
    case heyang
    
    /// 56.承筋
    case chengjin
    
    /// 57.承山
    case chengshan
    
    /// 58.飛揚
    case feiyang
    
    /// 59.跗陽
    case fuyang
    
    /// 60.崑崙
    case kunlun
    
    /// 61.僕參
    /// pú cān
    case pucan
    
    /// 62.申脈
    case shenmai
    
    /// 63.金門
    case jinmen
    
    /// 64.京骨
    case jinggu
    
    /// 65.束骨
    case shugu
    
    /// 66.足通谷
    case zutonggu
    
    /// 67.至陰
    case zhiyin
    
    // MARK: - 足少陰腎經

    /// 1.湧泉
    case yongquan
    
    /// 2.然谷
    case rangu
    
    /// 3.太谿
    case taixi
    
    /// 4.大鍾
    case dazhong
    
    /// 5.水泉
    case shuiquan
    
    /// 6.照海
    case zhaohai
    
    /// 7.復溜
    case fuliu
    
    /// 8.交信
    case jiaoxin
    
    /// 9.築賓
    /// zhù bīn
    case zhubin
    
    /// 10.陰谷
    case yingu
    
    /// 11.橫骨
    case henggu
    
    /// 12.大赫
    case dahe
    
    /// 13.氣穴
    case qixue
    
    /// 14.四滿
    case siman
    
    /// 15.中注
    case zhongzhu
    
    /// 16.肓俞
    case huangshu
    
    /// 17.商曲
    case shangqu
    
    /// 18.石關
    case shiguan
    
    /// 19.陰都
    case yindu
    
    /// 20.腹通谷
    case futonggu
    
    /// 21.幽門
    case youmen
    
    /// 22.步廊
    case bulang
    
    /// 23.神封
    case shenfeng
    
    /// 24.靈墟
    case lingxu
    
    /// 25.神藏
    case shencang
    
    /// 26.彧中
    /// yù zhōng
    case yuzhong
    
    /// 27.俞府
    case shufu

    // MARK: - 手厥陰心包經
    
    /// 1.天池
    case tianchi
    
    /// 2.天泉
    case tianquan
    
    /// 3.曲澤
    case quze
    
    /// 4.郄門
    /// xìmén
    case ximen
    
    /// 5.間使
    case jianshi
    
    /// 6.內關
    case neiguan
    
    /// 7.大陵
    case daling
    
    /// 8.勞宮
    case laogong
    
    /// 9.中衝
    case zhongchong

    // MARK: - 手少陽三焦經
    
    /// 1.關衝
    case guanchong
    
    /// 2.液門
    case yemen
    
    /// 3.中渚
    /// zhōng zhǔ
    case zhongzhu3
    
    /// 4.陽池
    case yangchi
    
    /// 5.外關
    case waiguan
    
    /// 6.支溝
    case zhigou
    
    /// 7.會宗
    case huizong
    
    /// 8.三陽絡
    case sanyangluo
    
    /// 9.四瀆
    /// sìdú
    case sidu
    
    /// 10.天井
    case tianjing
    
    /// 11.清冷淵
    case qinglengyuan
    
    /// 12.消濼
    /// xiāoluò
    case xiaoluo
    
    /// 13.臑會
    case naohui
    
    /// 14.肩髎
    case jianliao
    
    /// 15.天髎
    case tianliao
    
    /// 16.天牖
    /// tiānyǒu
    case tianyou
    
    /// 17.翳風
    /// yìfēng
    case yifeng
    
    /// 18.瘈脈
    /// chìmài
    case chimai
    
    /// 19.顱息
    case luxi
    
    /// 20.角孫
    case jiaosun
    
    /// 21.耳門
    case ermen
    
    /// 22.耳和髎
    case erheliao
    
    /// 23.絲竹空
    case sikongzhu

    // MARK: - 足少陽膽經
    
    /// 1.童子髎
    case tongziliao
    
    /// 2.聽會
    case tinghui
    
    /// 3.上關（客主人）
    case shangguan
    
    /// 4.頷厭
    /// hànyàn
    case hanyan
    
    /// 5.懸顱
    /// xuánlú
    case xuanlu
    
    /// 6.懸釐
    /// xuánlí
    case xuanli
    
    /// 7.曲鬢
    /// qūbìn
    case qubin
    
    /// 8.率谷
    /// shuài gŭ
    case shuaigu
    
    /// 9.天衝
    case tianchong
    
    /// 10.浮白
    case fubai
    
    /// 11.頭竅陰
    case touqiaoyin
    
    /// 12.完骨
    /// wángǔ
    case wangu12
    
    /// 13.本神
    case benshen
    
    /// 14.陽白
    case yangbai
    
    /// 15.頭臨泣
    case toulinqi
    
    /// 16.目窗
    case muchuang
    
    /// 17.正營
    case zhengying
    
    /// 18.承靈
    case chengling
    
    /// 19.腦空
    case naokong
    
    /// 20.風池
    case fengchi
    
    /// 21.肩井
    case jianjing
    
    /// 22.淵腋
    /// yuān yè
    case yuanye
    
    /// 23.輒筋
    /// zhé jīn
    case zhejin
    
    /// 24.日月
    case riyue
    
    /// 25.京門
    case jingmen
    
    /// 26.帶脈
    case daimai
    
    /// 27.五樞
    case wushu
    
    /// 28.維道
    case weidao
    
    /// 29.居髎
    case juliao29
    
    /// 30.環跳
    case huantiao
    
    /// 31.風市
    case fengshi
    
    /// 32.中瀆
    case zhongdu
    
    /// 33.膝陽關
    case xiyangguan
    
    /// 34.陽陵泉
    case yanglingquan
    
    /// 35.陽交
    case yangjiao
    
    /// 36.外丘
    case waiqiu
    
    /// 37.光明
    case guangming
    
    /// 38.陽輔
    case yangfu
    
    /// 39.懸鐘
    case xuanzhong
    
    /// 40.丘墟
    case qiuxu
    
    /// 41.足臨泣
    case zulinqi
    
    /// 42.地五會
    case diwuhui
    
    /// 43.俠谿
    case xiaxi
    
    /// 44.足竅陰
    case zuqiaoyin

    // MARK: - 足厥陰肝經
    
    /// 1.大敦
    case dadun
    
    /// 2.行間
    /// háng jiān
    case hangjian
    
    /// 3.太衝
    case taichong
    
    /// 4.中封
    case zhongfeng
    
    /// 5.蠡溝
    /// lí gōu
    case ligou
    
    /// 6.中都
    case zhongdu6
    
    /// 7.膝關
    case xiguan
    
    /// 8.曲泉
    case ququan
    
    /// 9.陰包
    case yinbao
    
    /// 10.足五里
    case zuwuli
    
    /// 11.陰廉
    case yinlian
    
    /// 12.急脈
    case jimai
    
    /// 13.章門
    case zhangmen
    
    /// 14.期門
    case qimen

    // MARK: - 任脈

    /// 1.会阴
    case huiyin

    /// 2.曲骨
    case qugu

    /// 3.中极
    case zhongji

    /// 4.关元
    case guanyuan

    /// 5.石门
    case shimen

    /// 6.气海
    case qihai

    /// 7.阴交
    case yinjiao

    /// 8.神阙
    case shenque

    /// 9.水分
    case shuifen

    /// 10.下脘
    case xiawan

    /// 11.建里
    case jianli

    /// 12.中脘
    case zhongwan

    /// 13.上脘
    case shangwan

    /// 14.巨阙
    case juque

    /// 15.鸠尾
    /// jiū wěi
    case jiuwei

    /// 16.中庭
    case zhongting

    /// 17.膻中
    case shanzhong

    /// 18.玉堂
    case yutang

    /// 19.紫宫
    case zigong

    /// 20.华盖
    case huagai

    /// 21.璇玑
    case xuanji

    /// 22.天突
    case tiantu

    /// 23.廉泉
    case lianquan

    /// 24.承浆
    case chengjiang

    // MARK: - 督脉

    /// 1.长强
    case changqiang

    /// 2.腰俞
    case yaoshu

    /// 3.腰阳关
    case yaoyangguan

    /// 4.命门
    case mingmen

    /// 5.悬枢 
    case xuanshu

    /// 6.脊中
    case jizhong

    /// 7.中枢
    case zhongshu

    /// 8.筋缩
    case jinsuo

    /// 9.至阳
    case zhiyang

    /// 10.灵台
    case lingtai

    /// 11.神道
    case shendao

    /// 12.身柱
    case shenzhu

    /// 13.陶道
    case taodao

    /// 14.大椎
    case dazhui

    /// 15.痖门
    /// yǎ mén
    case yamen

    /// 16.风府
    case fengfu

    /// 17.脑户
    case naohu

    /// 18.强间
    case qiangjian

    /// 19.后顶
    case houding

    /// 20.百会
    case baihui

    /// 21.前顶
    case qianding

    /// 22.顖会
    /// xìn
    case xinhui

    /// 23.上星
    case shangxing

    /// 24.神庭
    case shenting

    /// 25.素髎
    case suliao

    /// 26.水沟（人中）
    case renzhong

    /// 27.兑端
    case duiduan

    /// 28.龈交
    case yinjiao28

}

extension Acupoint: IterableLocalizedTextProvider {
    public static func textForIterables(for language: Language) -> [String] {
        switch language {
        case .zhHans:
            return [
                "中府", "云门", "天府", "侠白", "尺泽", "孔最", "列缺", "经渠", "太渊", "鱼际", "少商",
                "商阳", "二间", "三间", "合谷", "阳谿", "偏历", "温溜", "下廉", "上廉", "手三里", "曲池", "肘髎", "手五里", "臂臑", "肩髃", "巨骨", "天鼎", "扶突", "禾髎", "迎香",
                "承泣", "四白", "巨髎", "地仓", "大迎", "颊车", "下关", "头维", "人迎", "水突", "气舍", "缺盆", "气户", "库房", "屋翳", "膺窗", "乳中", "乳根", "不容", "承满", "梁门", "关门", "太乙", "滑肉门", "天枢", "外陵", "大巨", "水道", "归来", "气冲", "髀关", "伏兔", "阴市", "梁丘", "犊鼻", "足三里", "上巨虚", "条口", "下巨虚", "丰隆", "解谿", "冲阳", "陷谷", "内庭", "厉兑",
                "隐白", "大都", "太白", "公孙", "商丘", "三阴交", "漏谷", "地机", "阴陵泉", "血海", "箕门", "冲门", "府舍", "腹结", "大横", "腹哀", "食窦", "天谿", "胸乡", "周荣", "大包",
                "极泉", "青灵", "少海", "灵道", "通里", "阴郄", "神门", "少府", "少冲",
                "少泽", "前谷", "后谿", "腕骨", "阳谷", "养老", "支正", "小海", "肩贞", "臑俞", "天宗", "秉风", "曲垣", "肩外俞", "肩中俞", "天窗", "天容", "颧髎", "听宫",
                "睛明", "攒竹", "眉冲", "曲差", "五处", "承光", "通天", "络却", "玉枕", "天柱", "大杼", "风门", "肺俞", "厥阴俞", "心俞", "督俞", "膈俞", "肝俞", "胆俞", "脾俞", "胃俞", "三焦俞", "肾俞", "气海俞", "大肠俞", "关元俞", "小肠俞", "膀胱俞", "中膂俞", "白环俞", "上髎", "次髎", "中髎", "下髎", "会阳", "承扶", "殷门", "浮郄", "委阳", "委中", "附分", "魄户", "膏肓", "神堂", "譩譆", "膈关", "魂门", "阳纲", "意舍", "胃仓", "肓门", "志室", "胞肓", "秩边", "合阳", "承筋", "承山", "飞扬", "跗阳", "昆仑", "仆参", "申脉", "金门", "京骨", "束骨", "足通谷", "至阴",
                "涌泉", "然谷", "太谿", "大钟", "水泉", "照海", "复溜", "交信", "筑宾", "阴谷", "横骨", "大赫", "气穴", "四满", "中注", "肓俞", "商曲", "石关", "阴都", "腹通谷", "幽门", "步廊", "神封", "灵墟", "神藏", "彧中", "俞府",
                "天池", "天泉", "曲泽", "郄门", "间使", "内关", "大陵", "劳宫", "中冲",
                "关冲", "液门", "中渚", "阳池", "外关", "支沟", "会宗", "三阳络", "四渎", "天井", "清冷渊", "消泺", "臑会", "肩髎", "天髎", "天牖", "翳风", "瘈脉", "颅息", "角孙", "耳门", "耳和髎", "丝竹空",
                "童子髎", "听会", "上关（客主人）", "颔厌", "悬颅", "悬厘", "曲鬓", "率谷", "天冲", "浮白", "头窍阴", "完骨", "本神", "阳白", "头临泣", "目窗", "正营", "承灵", "脑空", "风池", "肩井", "渊腋", "辄筋", "日月", "京门", "带脉", "五枢", "维道", "居髎", "环跳", "风市", "中渎", "膝阳关", "阳陵泉", "阳交", "外丘", "光明", "阳辅", "悬钟", "丘墟", "足临泣", "地五会", "侠谿", "足窍阴",
                "大敦", "行间", "太冲", "中封", "蠡沟", "中都", "膝关", "曲泉", "阴包", "足五里", "阴廉", "急脉", "章门", "期门",
                "长强", "腰俞", "腰阳关", "命门", "悬枢", "脊中", "中枢", "筋缩", "至阳", "灵台", "神道", "身柱", "陶道", "大椎", "痖门", "风府", "脑户", "强间", "后顶", "百会", "前顶", "顖会", "上星", "神庭", "素髎", "水沟（人中）", "兑端", "龈交",
                "会阴", "曲骨", "中极", "关元", "石门", "气海", "阴交", "神阙", "水分", "下脘", "建里", "中脘", "上脘", "巨阙", "鸠尾", "中庭", "膻中", "玉堂", "紫宫", "华盖", "璇玑", "天突", "廉泉", "承浆"
            ]
        case .zhHant:
            return [
                "中府", "雲門", "天府", "俠白", "尺澤", "孔最", "列缺", "經渠", "太淵", "魚際", "少商",
                "商陽", "二間", "三間", "合谷", "陽谿", "偏歷", "溫溜", "下廉", "上廉", "手三里", "曲池", "肘髎", "手五里", "臂臑", "肩髃", "巨骨", "天鼎", "扶突", "禾髎", "迎香",
                "承泣", "四白", "巨髎", "地倉", "大迎", "頰車", "下關", "頭維", "人迎", "水突", "氣舍", "缺盆", "氣戶", "庫房", "屋翳", "膺窗", "乳中", "乳根", "不容", "承滿", "梁門", "關門", "太乙", "滑肉門", "天樞", "外陵", "大巨", "水道", "歸來", "氣衝", "髀關", "伏兔", "陰市", "梁丘", "犢鼻", "足三里", "上巨虛", "條口", "下巨虛", "豐隆", "解谿", "衝陽", "陷谷", "內庭", "厲兌",
                "隱白", "大都", "太白", "公孫", "商丘", "三陰交", "漏谷", "地機", "陰陵泉", "血海", "箕門", "衝門", "府舍", "腹結", "大橫", "腹哀", "食竇", "天谿", "胸鄉", "周榮", "大包",
                "極泉", "青靈", "少海", "靈道", "通里", "陰郄", "神門", "少府", "少衝",
                "少澤", "前谷", "後谿", "腕骨", "陽谷", "養老", "支正", "小海", "肩貞", "臑俞", "天宗", "秉風", "曲垣", "肩外俞", "肩中俞", "天窗", "天容", "顴髎", "聽宮",
                "睛明", "攢竹", "眉衝", "曲差", "五處", "承光", "通天", "絡卻", "玉枕", "天柱", "大杼", "風門", "肺俞", "厥陰俞", "心俞", "督俞", "膈俞", "肝俞", "膽俞", "脾俞", "胃俞", "三焦俞", "腎俞", "氣海俞", "大腸俞", "關元俞", "小腸俞", "膀胱俞", "中膂俞", "白環俞", "上髎", "次髎", "中髎", "下髎", "會陽", "承扶", "殷門", "浮郄", "委陽", "委中", "附分", "魄戶", "膏肓", "神堂", "譩譆", "膈關", "魂門", "陽綱", "意舍", "胃倉", "肓門", "志室", "胞肓", "秩邊", "合陽", "承筋", "承山", "飛揚", "跗陽", "崑崙", "僕參", "申脈", "金門", "京骨", "束骨", "足通谷", "至陰",
                "湧泉", "然谷", "太谿", "大鍾", "水泉", "照海", "復溜", "交信", "築賓", "陰谷", "橫骨", "大赫", "氣穴", "四滿", "中注", "肓俞", "商曲", "石關", "陰都", "腹通谷", "幽門", "步廊", "神封", "靈墟", "神藏", "彧中", "俞府",
                "天池", "天泉", "曲澤", "郄門", "間使", "內關", "大陵", "勞宮", "中衝",
                "關衝", "液門", "中渚", "陽池", "外關", "支溝", "會宗", "三陽絡", "四瀆", "天井", "清冷淵", "消濼", "臑會", "肩髎", "天髎", "天牖", "翳風", "瘈脈", "顱息", "角孫", "耳門", "耳和髎", "絲竹空",
                "童子髎", "聽會", "上關（客主人）", "頷厭", "懸顱", "懸釐", "曲鬢", "率谷", "天衝", "浮白", "頭竅陰", "完骨", "本神", "陽白", "頭臨泣", "目窗", "正營", "承靈", "腦空", "風池", "肩井", "淵腋", "輒筋", "日月", "京門", "帶脈", "五樞", "維道", "居髎", "環跳", "風市", "中瀆", "膝陽關", "陽陵泉", "陽交", "外丘", "光明", "陽輔", "懸鐘", "丘墟", "足臨泣", "地五會", "俠谿", "足竅陰",
                "大敦", "行間", "太衝", "中封", "蠡溝", "中都", "膝關", "曲泉", "陰包", "足五里", "陰廉", "急脈", "章門", "期門",
                "長強", "腰俞", "腰陽關", "命門", "懸樞", "脊中", "中樞", "筋縮", "至陽", "靈臺", "神道", "身柱", "陶道", "大椎", "瘂門", "風府", "腦戶", "強間", "後頂", "百會", "前頂", "顖會", "上星", "神庭", "素髎", "水溝（人中）", "兌端", "齦交",
                "會陰", "曲骨", "中極", "關元", "石門", "氣海", "陰交", "神闕", "水分", "下脘", "建里", "中脘", "上脘", "巨闕", "鳩尾", "中庭", "膻中", "玉堂", "紫宮", "華蓋", "璇璣", "天突", "廉泉", "承漿"
            ]
        case .en:
            return Acupoint.allCases.map { $0.rawValue }
        }
    }
}
