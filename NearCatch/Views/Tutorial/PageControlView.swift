//
//  PageControlView.swift
//  NearCatch
//
//  Created by ryu hyunsun on 2022/06/09.
//

import SwiftUI

struct PageControlView: View {
    @State var currentPage = 0
    @State private var offset: CGSize = .zero
    @State var nickname: String = ""
    var body: some View {
        ZStack{
            Image("img_background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                pageControl(current: $currentPage)
                ZStack {
                    if currentPage == 0 {
                        SettingNicknameView(coreDM: CoreDataManager(), nickname: $nickname)
                    }
                    else if currentPage == 1 {
//                        Image("img_star_33px")
                    }
                    else {
//                        Image("img_shooting")
                    }
                }
            }
            .frame(
                maxHeight: .infinity,
                alignment: .topLeading
            )
            
            
        }.gesture(DragGesture()
            .onChanged{self.offset = $0.translation}
            .onEnded{
                if $0.translation.width < -100 {
                    if self.currentPage < 3 {
                        self.currentPage += 1
                    }
                    else {
                        self.offset = .zero
                    }
                }
                else if $0.translation.width > 100 {
                    if self.currentPage > 0 {
                        self.currentPage -= 1
                    }
                    else {
                        self.offset = .zero
                    }
                }
                else {
                    self.offset = .zero
                }
                
            }
        )
        
        
//
        
//        VStack {
//            TabView {
//                SettingNicknameView()
//                SettingNicknameView()
//            }
//            .tabViewStyle(.page)
//            .indexViewStyle(.page(backgroundDisplayMode: .never))
//            .background(.black)
//        }
        
    }
    
    
    
}


struct pageControl : UIViewRepresentable {
//    var current = 0
    @Binding var current: Int
    
    func makeUIView(context: UIViewRepresentableContext<pageControl>) -> UIPageControl {
        let page = UIPageControl()
        page.currentPageIndicatorTintColor = UIColor(red: 255/255, green: 236/255, blue: 108/255, alpha: 100.0)
        page.numberOfPages = 3
        page.pageIndicatorTintColor = .white
//        page.isSelected = false
        return page
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<pageControl>) {
        uiView.currentPage = self.current
    }
    
}





struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView()
    }
}
