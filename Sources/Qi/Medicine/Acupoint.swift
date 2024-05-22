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
}
