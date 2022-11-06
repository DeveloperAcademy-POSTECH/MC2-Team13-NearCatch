//
//  SettingButton.swift
//  NearCatch
//
//  Created by HWANG-C-K on 2022/06/14.
//

import SwiftUI

struct SettingButton: View {
    var text:String
    @State var isEnd:Bool
    var body: some View {
        ZStack{
            if !isEnd {
                Rectangle()
                    .fill(Color.white)
                    .opacity(0.3)
                    .frame(width:350, height:50)
            } else {
                Rectangle()
                    .fill(Color.white)
                    .opacity(0.3)
                    .frame(width:350, height:50)
                    .cornerRadius(10, corners: [.bottomLeft, .bottomRight])
            }
            
            //버튼에 들어가는 텍스트
            HStack{
                Text(LocalizedStringKey(text))
                    .font(.custom("온글잎 의연체", size:22))
                    .foregroundColor(.white)
                Spacer()
                    .frame(width:250)
                Image(systemName:"chevron.right")
                    .foregroundColor(.white)
                    .font(.custom("온글잎 의연체", size:16))
                
            }
        }.padding([.bottom], 20)
        
    }
}

// 특정 모서리만 둥근 직사각형
// source : https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButton(text:"라이센스", isEnd:false)
    }
}
