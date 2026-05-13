////
////  DataServiceTest.swift
////  28Xiu
////
////  Created by S@mmy on 2025/10/1.
////
//
//import Foundation
//
//
//struct XiuItem: Identifiable {
//    
//    //creating a random ID and assigning it to the id property of xiuItem
//    var id: UUID = UUID()
//    
//    var deityName: String
//    var mansionName: String
//    var imageName: String
//    var modelName: String
//    
//}
//
//struct XiuMansion: Identifiable {
//    
//    var id: UUID = UUID()
//    
//    var xiuMansionName: String
//    var xius: [XiuItem]
//}
//
//
//struct DataServiceTest {
//    
//    func getData() -> [XiuMansion] {
//        
//        return [
//            
//            // 东方青龙
//            XiuMansion(xiuMansionName:"东方青龙 Azure Dragon of the East",
//                       xius: [
//                        XiuItem(deityName: "角木蛟", mansionName: "角", imageName: "jiao-mu-jiao", modelName:"jiao-mu-jiao"),
//                        XiuItem(deityName: "亢金龙", mansionName: "亢", imageName: "kang-jin-long", modelName:"kang-jin-long"),
//                        XiuItem(deityName: "氐土貉", mansionName: "氐", imageName: "di-tu-hao", modelName:"di-tu-hao"),
//                        XiuItem(deityName: "房日兔", mansionName: "房", imageName: "fang-ri-tu", modelName:"fang-ri-tu"),
//                        XiuItem(deityName: "心月狐", mansionName: "心", imageName: "xin-yue-hu", modelName:"xin-yue-hu"),
//                        XiuItem(deityName: "尾火虎", mansionName: "尾", imageName: "wei-huo-hu", modelName:"wei-huo-hu"),
//                        XiuItem(deityName: "箕水豹", mansionName: "箕", imageName: "ji-shui-bao", modelName:"ji-shui-bao")
//                       ]
//                      ),
//            
//            // 北方玄武
//            XiuMansion(xiuMansionName:"北方玄武 Black Tortoise of the North",
//                       xius: [
//                        XiuItem(deityName: "斗木獬", mansionName: "斗", imageName: "dou-mu-xie", modelName:"dou-mu-xie"),
//                        XiuItem(deityName: "牛金牛", mansionName: "牛", imageName: "niu-jin-niu", modelName:"niu-jin-niu"),
//                        XiuItem(deityName: "女土蝠", mansionName: "女", imageName: "nu-tu-fu", modelName:"nu-tu-fu"),
//                        XiuItem(deityName: "虚日鼠", mansionName: "虚", imageName: "xu-ri-shu", modelName:"xu-ri-shu"),
//                        XiuItem(deityName: "危月燕", mansionName: "危", imageName: "wei-yue-yan", modelName:"wei-yue-yan"),
//                        XiuItem(deityName: "室火猪", mansionName: "室", imageName: "shi-huo-zhu", modelName:"shi-huo-zhu"),
//                        XiuItem(deityName: "壁水獝", mansionName: "壁", imageName: "bi-shui-xu", modelName:"bi-shui-xu")
//                       ]
//                      ),
//            
//            // 西方白虎
//            XiuMansion(xiuMansionName:"西方白虎 White Tiger of the West",
//                       xius: [
//                        XiuItem(deityName: "奎木狼", mansionName: "奎", imageName: "kui-mu-lang", modelName:"kui-mu-lang"),
//                        XiuItem(deityName: "娄金狗", mansionName: "娄", imageName: "lou-jin-gou", modelName:"lou-jin-gou"),
//                        XiuItem(deityName: "胃土雉", mansionName: "胃", imageName: "wei-tu-zhi", modelName:"wei-tu-zhi"),
//                        XiuItem(deityName: "昴日鸡", mansionName: "昴", imageName: "mao-ri-ji", modelName:"mao-ri-ji"),
//                        XiuItem(deityName: "毕月乌", mansionName: "毕", imageName: "bi-yue-wu", modelName:"bi-yue-wu"),
//                        XiuItem(deityName: "觜火猴", mansionName: "觜", imageName: "zui-huo-hou", modelName:"zui-huo-hou"),
//                        XiuItem(deityName: "参水猿", mansionName: "参", imageName: "shen-shui-yuan", modelName:"shen-shui-yuan")
//                       ]
//                      ),
//            
//            // 南方朱雀
//            XiuMansion(xiuMansionName:"南方朱雀 Vermilion Bird of the South",
//                       xius: [
//                        XiuItem(deityName: "井木犴", mansionName: "井", imageName: "jing-mu-han", modelName:"jing-mu-han"),
//                        XiuItem(deityName: "鬼金羊", mansionName: "鬼", imageName: "gui-jin-yang", modelName:"gui-jin-yang"),
//                        XiuItem(deityName: "柳土獐", mansionName: "柳", imageName: "liu-tu-zhang", modelName:"liu-tu-zhang"),
//                        XiuItem(deityName: "星日马", mansionName: "星", imageName: "xing-ri-ma", modelName:"xing-ri-ma"),
//                        XiuItem(deityName: "张月鹿", mansionName: "张", imageName: "zhang-yue-lu", modelName:"zhang-yue-lu"),
//                        XiuItem(deityName: "翼火蛇", mansionName: "翼", imageName: "yi-huo-she", modelName:"yi-huo-she"),
//                        XiuItem(deityName: "轸水蚓", mansionName: "轸", imageName: "zhen-shui-yin", modelName:"zhen-shui-yin")
//                       ]
//                      )
//        ]
//        
//    }
//    
//}
