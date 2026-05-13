////
////  LazyVGrids_Demo.swift
////  28Xiu
////
////  Created by S@mmy on 2025/10/8.
////
//
//import SwiftUI
//
//
//struct LazyVGrid_Demo: View {
//    
//    @State var sheetVisible = false
//    @State var selectedXiu = ""
//    
//    @State var xiuMansions: [XiuMansion] = []
//    var dataService = DataServiceTest()
//    
//    
//    let columns = [
//        GridItem(spacing:10),
//        GridItem(spacing:10),
//        GridItem(spacing:10),
//        GridItem(spacing:10)
//    ]
//    
//    //    let columns = [GridItem(.adaptive(minimum: 100))]
//    
//    var body: some View {
//        
//        NavigationStack {
//            
//            GeometryReader{ proxy in
//                
//                ScrollView {
//                    
//                    LazyVGrid(columns: columns, spacing:10) {
//                        
//                        ForEach(xiuMansions) { xiuMansion in
//                            
//                            ForEach(xiuMansion.xius) { xiu in
//                                
//                                VStack{
//                                    
//                                    Image(xiu.imageName)
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .cornerRadius(20)
//                                        .overlay(){
//                                            RoundedRectangle(cornerRadius: 20)
//                                                .stroke(Color.indigo, lineWidth: 3)
//                                                .opacity(0.5)
//                                        }
//                                        .frame(maxWidth: (proxy.size.width / 4))
//                                        .onTapGesture {
//                                            sheetVisible.toggle()
//                                            selectedXiu = xiu.imageName
//                                        }
//                                    
//                                    Text(xiu.deityName)
//                                        .foregroundColor(.indigo)
//                                    
//                                }
//                            }
//                        }
//                    }
//                    .padding()
//                }
//                .navigationTitle("28Xiu")
//            }
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
//            
//            // tariling closure
//            .background {
//                Image("indigoGalaxy2")
//            }
//        }
//    }
//}
//
//
//#Preview {
//    LazyVGrid_Demo()
//}
