//
//  ProfileInterestCard.swift
//  NearCatch
//
//  Created by HWANG-C-K on 2022/06/12.
//

import SwiftUI

struct ProfileInterestCard: View {
    var body: some View {
        ZStack{
            Image("img_hurray")
                .padding(EdgeInsets(top:0, leading:0, bottom:220, trailing:240))
            RoundedRectangle(cornerRadius:30)
                .fill(Color.ThirdColor)
                .frame(width:350, height:206)
            Text("내 관심사")
                .font(.custom("온글잎 의연체", size:34))
                .foregroundColor(Color.white)
                .padding(EdgeInsets(top:0, leading:0, bottom:120, trailing:210))
            ScrollView(.horizontal){
                Text("asdf")
                    .foregroundColor(.white)
                Text("asdf")
                    .foregroundColor(.white)
            }.padding(EdgeInsets(top:0, leading:50, bottom:0, trailing:50))
        }
    }
}

struct ProfileInterestCard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInterestCard()
    }
}
