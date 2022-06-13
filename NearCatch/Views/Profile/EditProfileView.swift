//
//  EditProfileView.swift
//  NearCatch
//
//  Created by HWANG-C-K on 2022/06/13.
//

import SwiftUI

struct EditProfileView: View {
    @State var nickname:String = "마이즈"
    var body: some View {
        NavigationView{
            ZStack{
                Image("img_background")
                    .edgesIgnoringSafeArea([.top])
                VStack{
                    HStack{
                        Spacer()
                            .frame(width:23)
                        NavigationLink(destination: ProfileView(), label: {SharedCustomButton(icon: "icn_chevron", circleSize:40, color:Color.white, innerOpacity:0.5)})
                        Spacer()
                    }
                    Spacer()
                        .frame(height:50)
                    ZStack{
                        SharedCustomButton(icon:"icn_img", circleSize:191, color:Color.white, innerOpacity:1)
                    }
                    Spacer()
                        .frame(height:50)
                    VStack {
                        ZStack {
                            TextField("니어캣", text: $nickname)
                                .font(.custom("온글잎 의연체", size:34))
                                .foregroundColor(Color.white)
                                .multilineTextAlignment(.center)
                                .padding(EdgeInsets(top:0, leading:50, bottom:0, trailing:50))
                            HStack{
                                Spacer()
                                    .frame(width:225)
                                if nickname != "" {
                                    Button {
                                        nickname = ""
                                    } label: {
                                        Image("icn_cancle")
                                            .resizable()
                                            .frame(width:25, height:25)
                                    }
                                    
                                }
                            }
                            
                        }
                        Rectangle()
                            .frame(width:260, height: 1)
                            .foregroundColor(.white)
                    }
                    Spacer()
                        .frame(height:240)
                    SharedRectangularButton(rectWidth:350, rectColor:.PrimaryColor, text:"수정하기", textColor:.black)
                    Spacer()
                }
            }
        }.navigationBarHidden(true)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}