////
////  DataService1.swift
////  28Xiu
////
////  Created by S@mmy on 2025/10/9.
////
//
//import Foundation
//
//struct DataService1 {
//    
//    func getData() -> [XiuMansion] {
//        
//        return [
//            
//            // 东方青龙
//            XiuMansion(name: """
//東方青龍
//
//Azure Dragon of the East
//""",
//                        imageName: "Azure-Dragon-of-the-East",
//                        summary: """
// • 青竜（せいりゅう／しょうりゅう、pinyin: Qīnglóng）
//四神の一つ。東と春を司り、五行は木。青緑の龍として表される。
//
// • Azure Dragon (青龍; pinyin: Qīnglóng)
//One of the Four Symbols. Represents the east and the spring; in Wuxing it corresponds to Wood. Depicted as a blue-green dragon.
//
//""",
//                        
//                        xius: [
//                            XiuItem(name: "角木蛟", mansionName: "角｜Horn", imageName: "jiao-mu-jiao", modelName:"jiao-mu-jiao", description: """
//                                    春の兆し、木気の蛟が角で夜を裂き、播き時を告げる。
//                                    Wood-born jiaolong splits the night with its horn—spring’s sowing call.
//                                    """),
//                            XiuItem(name: "亢金龍", mansionName: "亢｜Neck", imageName: "kang-jin-long", modelName:"kang-jin-long", description: """
//                                    金の龍、頸を伸ばし、節度と剛気で風を鎮める。
//                                    The metal dragon lifts its neck—poise and steel calm the winds.
//                                    """),
//                            XiuItem(name: "氐土貉", mansionName: "氐｜Root", imageName: "di-tu-hao", modelName:"di-tu-hao", description: """
//                                    根を張る土の貉、始まりの骨組みを固める。
//                                    Earth’s tanuki-badger sets the frame—foundations take root.
//                                    """),
//                            XiuItem(name: "房日兎", mansionName: "房｜Room", imageName: "fang-ri-tu", modelName:"fang-ri-tu", description: """
//                                    日魂の兎が跳ね、居室に光を満たす。
//                                    The solar rabbit leaps, filling the chamber with daylight.
//                                    """),
//                            XiuItem(name: "心月狐", mansionName: "心｜Heart", imageName: "xin-yue-hu", modelName:"xin-yue-hu", description: """
//                                    月の狐、胸に灯をともして道心を導く。
//                                    The lunar fox lights a lamp in the heart—guiding resolve.
//                                    """),
//                            XiuItem(name: "尾火虎", mansionName: "尾｜Tail", imageName: "wei-huo-hu", modelName:"wei-huo-hu", description: """
//                                    火の虎、尾を振り、行軍の終列を守る。
//                                    The fire-tiger lashes its tail—guardian of the rear guard.
//                                    """),
//                            XiuItem(name: "箕水豹", mansionName: "箕｜Winnowing Basket", imageName: "ji-shui-bao", modelName:"ji-shui-bao", description: """
//                                    水の豹が穀を簸す、要らぬものを洗い流す時。
//                                    The water leopard winnows grain—what’s needless is washed away.
//                                    """)
//                        ]
//                       ),
//            
//            // 北方玄武
//            XiuMansion(name:"""
//北方玄武
//
//Black Tortoise of the North
//""",
//                        imageName: "Black-Tortoise-of-the-North",
//                        summary: """
// • 玄武（げんぶ、pinyin: Xuánwǔ）
//四神の一つ。北と冬を司り、五行は水。しばしば蛇と絡み合う亀として描かれ、「黒武（Black Warrior）」とも呼ばれる。
//
// • Black Tortoise (玄武; pinyin: Xuánwǔ)
//One of the Four Symbols. Represents the north and winter; in Wuxing it corresponds to Water. Commonly depicted as a tortoise entwined with a snake; also called the “Black Warrior.”
//
//""",
//                        
//                        xius: [
//                            XiuItem(name: "斗木獬", mansionName: "斗｜Dipper", imageName: "dou-mu-xie", modelName:"dou-mu-xie", description: """
//                                    木の獬が斗を掲げ、是非を一角で正す。
//                                    The xiezhi raises the dipper—its single horn judges right from wrong.
//                                    """),
//                            XiuItem(name: "牛金牛", mansionName: "牛｜Ox", imageName: "niu-jin-niu", modelName:"niu-jin-niu", description: """
//                                    金の牛、耐えて耕し、実りを請け負う。
//                                    The metal ox endures and tills—pledging harvests to come.
//                                    """),
//                            XiuItem(name: "女土蝠", mansionName: "女｜Girl", imageName: "nu-tu-fu", modelName:"nu-tu-fu", description: """
//                                    土の蝙蝠、静けさに耳を澄まし兆しを聴く。
//                                    The earth-bat hangs in stillness, listening for omens.
//                                    """),
//                            XiuItem(name: "虚日鼠", mansionName: "虚｜Emptiness", imageName: "xu-ri-shu", modelName:"xu-ri-shu", description: """
//                                    日の鼠、虚空の梁を走り、隠れ道を示す。
//                                    The solar mouse runs the beams of the void—revealing hidden paths.
//                                    """),
//                            XiuItem(name: "危月燕", mansionName: "危｜Rooftop", imageName: "wei-yue-yan", modelName:"wei-yue-yan", description: """
//                                    月の燕、棟木をかすめ、凶を吉に返す飛び。
//                                    The lunar swallow skims the ridge, turning ill winds to fair.
//                                    """),
//                            XiuItem(name: "室火猪", mansionName: "室｜Encampment", imageName: "shi-huo-zhu", modelName:"shi-huo-zhu", description: """
//                                    火の猪が陣を固め、炉の火を護る。
//                                    The fire-boar stakes the camp—keeper of the hearth.
//                                    """),
//                            XiuItem(name: "壁水貐", mansionName: "壁｜Wall ", imageName: "bi-shui-xu", modelName:"bi-shui-xu", description: """
//                                    水の貐が壁となり、荒波を受け止める。
//                                    The watery yayu stands as a wall—breaking the onrush of waves.
//                                    """)
//                        ]
//                       ),
//            
//            // 西方白虎
//            XiuMansion(name:"""
//西方白虎
//
//White Tiger of the West
//""",
//                        imageName: "White-Tiger-of-the-West",
//                        summary: """
//• 白虎（びゃっこ、pinyin: Báihǔ）
//四神の一つ。西と秋を司り、五行は金。白い虎として表される。
//
//• White Tiger (白虎; pinyin: Báihǔ)
//One of the Four Symbols. Represents the west and autumn; in Wuxing it corresponds to Metal. Depicted as a white tiger.
//
//""",
//                        
//                        xius: [
//                            XiuItem(name: "奎木狼", mansionName: "奎｜Legs", imageName: "kui-mu-lang", modelName:"kui-mu-lang", description: """
//                                    木の狼、長い脚で境界を跨ぐ。
//                                    The wood-wolf strides long, crossing thresholds.
//                                    """),
//                            XiuItem(name: "婁金狗", mansionName: "婁｜Bond", imageName: "lou-jin-gou", modelName:"lou-jin-gou", description: """
//                                    金の狗、契りを守り、群をまとめる。
//                                    The metal dog keeps the bond—gatherer of the pack.
//                                    """),
//                            XiuItem(name: "胃土雉", mansionName: "胃｜Stomach", imageName: "wei-tu-zhi", modelName:"wei-tu-zhi", description: """
//                                    土の雉、穀を喉に温め、家の糧を蓄える。
//                                    The earth-pheasant warms grain—storehouse of the household.
//                                    """),
//                            XiuItem(name: "昴日鶏", mansionName: "昴｜Hairy Head", imageName: "mao-ri-ji", modelName:"mao-ri-ji", description: """
//                                    日の鶏、星冠を振り、悪夢を払い夜を割る。
//                                    The solar rooster shakes its starry crest—rending the dark.
//                                    """),
//                            XiuItem(name: "畢月烏", mansionName: "畢｜Net", imageName: "bi-yue-wu", modelName:"bi-yue-wu", description: """
//                                    月の烏、網を張り、散逸の運を集める。
//                                    The lunar crow casts a net—gathering what has scattered.
//                                    """),
//                            XiuItem(name: "觜火猴", mansionName: "觜｜Beak", imageName: "zui-huo-hou", modelName:"zui-huo-hou", description: """
//                                    火の猴、甲の嘴で封印を外し、機を開く。
//                                    The fire-monkey pries with a beaked key—unlocking the moment.
//                                    """),
//                            XiuItem(name: "参水猿", mansionName: "参｜Three Stars", imageName: "shen-shui-yuan", modelName:"shen-shui-yuan", description: """
//                                    水の猿、三星の綱を渡り、知恵を手繰る。
//                                    The water-ape traverses the triple rope—drawing wisdom in.
//                                    """),
//                        ]
//                       ),
//            
//            // 南方朱雀
//            XiuMansion(name:"""
//南方朱雀
//
//Vermilion Bird of the South
//""",
//                        imageName: "Vermilion-Bird-of-the-South",
//                        summary: """
// • 朱雀（すざく、pinyin: Zhūquè）
//四神の一つ。南と夏を司り、五行は火。火色の羽を持つ鳥として描かれる（鳳凰とは別種）。
//
// • Vermilion Bird (朱雀; pinyin: Zhūquè)
//One of the Four Symbols. Represents the south and summer; in Wuxing it corresponds to Fire. Described as a red, pheasant-like bird wreathed in flames (distinct from the Fenghuang).
//
//""",
//                        
//                        xius: [
//                            XiuItem(name: "井木犴", mansionName: "井｜Well", imageName: "jing-mu-han", modelName:"jing-mu-han", description: """
//                                    木の犴、井戸口を守り、涌き出づるものを浄める。
//                                    The wood biān keeps the well—purifying what rises.
//                                    """),
//                            XiuItem(name: "鬼金羊", mansionName: "鬼｜Ghost", imageName: "gui-jin-yang", modelName:"gui-jin-yang", description: """
//                                    金の羊、冥の境を踏み、穢れを食む。
//                                    The metal sheep treads the ghostly border—cropping defilement.
//                                    """),
//                            XiuItem(name: "柳土獐", mansionName: "柳｜Willow", imageName: "liu-tu-zhang", modelName:"liu-tu-zhang", description: """
//                                    土の獐、枝のしなりに身を合わせ、災いをいなす。
//                                    The earth muntjac bends with the willow—deflecting harm.
//                                    """),
//                            XiuItem(name: "星日馬", mansionName: "星｜Star", imageName: "xing-ri-ma", modelName:"xing-ri-ma", description: """
//                                    日の馬、星の道を駆け、遠行の力を授ける。
//                                    The solar horse runs the star-road—granting the strength to journey.
//                                    """),
//                            XiuItem(name: "張月鹿", mansionName: "張｜Extended Net", imageName: "zhang-yue-lu", modelName:"zhang-yue-lu", description: """
//                                    月の鹿、張られた網をくぐり、静かに幸を招く。
//                                    The lunar deer slips the extended net—quietly beckoning fortune.
//                                    """),
//                            XiuItem(name: "翼火蛇", mansionName: "翼｜Wings", imageName: "yi-huo-she", modelName:"yi-huo-she", description: """
//                                    火の蛇、翼を借りて昇り、古殻を脱ぐ。
//                                    The fire-snake takes on wings—shedding its old skin aloft.
//                                    """),
//                            XiuItem(name: "軫水蚓", mansionName: "軫｜Chariot", imageName: "zhen-shui-yin", modelName:"zhen-shui-yin", description: """
//                                    水の蚓、車を潤し、静かな前進を絶やさない。
//                                    The water earthworm oils the chariot—quiet progress without cease.
//                                    """)
//                        ]
//                       )
//        ]
//        
//    }
//    
//}
