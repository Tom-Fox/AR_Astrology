////
////  List.swift
////  28Xiu
////
////  Created by S@mmy on 2025/9/30.
////
//
//import SwiftUI
//
//
//struct ListTest: View {
//    
//    // @State is a property wrapper, indicates that UI depends on the state of this
//    // property. So the Swift UI system should really pay attention to the value of this
//    // property(xiuItems). As soon as anything changes in this property, it should update
//    // all the views in the UI.
//    @State var xiuMansions: [XiuMansion] = []
//    //    @State var xiuItems: [XiuItem] = [XiuItem]()
//    
//    @State private var singleSelection: UUID?
//    
//    @State var sheetVisible = false
//    @State var selectedXiu = ""
//    
//    var dataService = DataServiceTest()
//    
//    
//    var body: some View {
//        
//        NavigationStack {
//            
//            List(selection: $singleSelection) {
//                
//                ForEach(xiuMansions) { xiuMansion in
//                    
//                    Section(header: Text(xiuMansion.xiuMansionName)) {
//                        
//                        ForEach(xiuMansion.xius) { xiu in
//                            
//                            HStack {
//                                
//                                Image(xiu.imageName)
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(height: 50)
//                                    .cornerRadius(10)
////                                    .clipShape(Circle())
//                                
//                                
//                                Text(xiu.deityName)
//                                    .bold()
//                                
//                                Spacer()
//                                
//                                Text(xiu.mansionName)
//                                    .padding(.trailing)
//                                
//                            }
//                            //            .listRowSeparator(.hidden)
//                            //            .listRowBackground(
//                            //                RoundedRectangle(cornerRadius:20)
//                            //                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
//                            //            )
//                            
//                            //            .listRowBackground(
//                            //                RoundedRectangle(cornerRadius: 20)
//                            //                    .fill(.indigo)
//                            //                    .opacity(0.1)
//                            //                    .glassEffect(.regular, in: RoundedRectangle(cornerRadius: 20))
//                            //            )
//                            
//                            .listRowBackground(
//                                Color(.indigo)
//                                    .opacity(0.1)
//                            )
//                            .onTapGesture {
//                                sheetVisible.toggle()
//                                selectedXiu = xiu.imageName
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("28Xiu")            // 这些要挂在 ScrollView 上
//            .navigationBarTitleDisplayMode(.large)
//            .scrollEdgeEffectStyle(.soft, for: [.top, .bottom])
//            .onAppear {
//                // Call for the data
//                xiuMansions = dataService.getData()
//            }
//        }
//        .sheet(isPresented: $sheetVisible) {
//            ListImageView_Demo(selectedXiu: $selectedXiu,
//                               sheetVisible: $sheetVisible)
//            .presentationDetents([.medium, .large])
//            .presentationDragIndicator(.visible)
//        }
//    }
//}
//
//
//
//
//
//
////let mansions: [String] = [
////    "角木蛟","亢金龙","氐土貉","房日兔","心月狐","尾火虎","箕水豹",
////    "斗木獬","牛金牛","女土蝠","虚日鼠","危月燕","室火猪","壁水獝",
////    "奎木狼","娄金狗","胃土雉","昴日鸡","毕月乌","觜火猴","参水猿",
////    "井木犴","鬼金羊","柳土獐","星日马","张月鹿","翼火蛇","轸水蚓"
////]
////
////let mansionFourName: [String: String] = [
////    "角":"角木蛟","亢":"亢金龙","氐":"氐土貉","房":"房日兔","心":"心月狐","尾":"尾火虎","箕":"箕水豹",
////    "斗":"斗木獬","牛":"牛金牛","女":"女土蝠","虚":"虚日鼠","危":"危月燕","室":"室火猪","壁":"壁水獝",
////    "奎":"奎木狼","娄":"娄金狗","胃":"胃土雉","昴":"昴日鸡","毕":"毕月乌","觜":"觜火猴","参":"参水猿",
////    "井":"井木犴","鬼":"鬼金羊","柳":"柳土獐","星":"星日马","张":"张月鹿","翼":"翼火蛇","轸":"轸水蚓"
////]
////
////enum Mansion: String, CaseIterable {
////    // 东方青龙
////    case jiaoMuJiao = "jiao-mu-jiao"
////    case kangJinLong = "kang-jin-long"
////    case diTuHao = "di-tu-hao"
////    case fangRiTu = "fang-ri-tu"
////    case xinYueHu = "xin-yue-hu"
////    case weiHuoHu = "wei-huo-hu"
////    case jiShuiBao = "ji-shui-bao"
////
////    // 北方玄武
////    case douMuXie = "dou-mu-xie"
////    case niuJinNiu = "niu-jin-niu"
////    case nuTuFu = "nu-tu-fu"
////    case xuRiShu = "xu-ri-shu"
////    case weiYueYan = "wei-yue-yan"
////    case shiHuoZhu = "shi-huo-zhu"
////    case biShuiXu = "bi-shui-xu"
////
////    // 西方白虎
////    case kuiMuLang = "kui-mu-lang"
////    case louJinGou = "lou-jin-gou"
////    case weiTuZhi = "wei-tu-zhi"
////    case maoRiJi = "mao-ri-ji"
////    case biYueWu = "bi-yue-wu"
////    case zuiHuoHou = "zui-huo-hou"
////    case shenShuiYuan = "shen-shui-yuan"
////
////    // 南方朱雀
////    case jingMuHan = "jing-mu-han"
////    case guiJinYang = "gui-jin-yang"
////    case liuTuZhang = "liu-tu-zhang"
////    case xingRiMa = "xing-ri-ma"
////    case zhangYueLu = "zhang-yue-lu"
////    case yiHuoShe = "yi-huo-she"
////    case zhenShuiYin = "zhen-shui-yin"
////}
////
////extension Mansion {
////    
////    var image: Image {
////        Image(self.rawValue)
////    }
////
////    var displayName: String {
////        switch self {
////        case .jiaoMuJiao: return "角木蛟 (Jiao Mu Jiao)"
////        case .kangJinLong: return "亢金龙 (Kang Jin Long)"
////        case .diTuHao: return "氐土貉 (Di Tu Hao)"
////        case .fangRiTu: return "房日兔 (Fang Ri Tu)"
////        case .xinYueHu: return "心月狐 (Xin Yue Hu)"
////        case .weiHuoHu: return "尾火虎 (Wei Huo Hu)"
////        case .jiShuiBao: return "箕水豹 (Ji Shui Bao)"
////        case .douMuXie: return "斗木獬 (Dou Mu Xie)"
////        case .niuJinNiu: return "牛金牛 (Niu Jin Niu)"
////        case .nuTuFu: return "女土蝠 (Nu Tu Fu)"
////        case .xuRiShu: return "虚日鼠 (Xu Ri Shu)"
////        case .weiYueYan: return "危月燕 (Wei Yue Yan)"
////        case .shiHuoZhu: return "室火猪 (Shi Huo Zhu)"
////        case .biShuiXu: return "壁水獝 (Bi Shui Xu)"
////        case .kuiMuLang: return "奎木狼 (Kui Mu Lang)"
////        case .louJinGou: return "娄金狗 (Lou Jin Gou)"
////        case .weiTuZhi: return "胃土雉 (Wei Tu Zhi)"
////        case .maoRiJi: return "昴日鸡 (Mao Ri Ji)"
////        case .biYueWu: return "毕月乌 (Bi Yue Wu)"
////        case .zuiHuoHou: return "觜火猴 (Zui Huo Hou)"
////        case .shenShuiYuan: return "参水猿 (Shen Shui Yuan)"
////        case .jingMuHan: return "井木犴 (Jing Mu Han)"
////        case .guiJinYang: return "鬼金羊 (Gui Jin Yang)"
////        case .liuTuZhang: return "柳土獐 (Liu Tu Zhang)"
////        case .xingRiMa: return "星日马 (Xing Ri Ma)"
////        case .zhangYueLu: return "张月鹿 (Zhang Yue Lu)"
////        case .yiHuoShe: return "翼火蛇 (Yi Huo She)"
////        case .zhenShuiYin: return "轸水蚓 (Zhen Shui Yin)"
////        }
////    }
////}
//
//#Preview {
//    ListTest()
//}
