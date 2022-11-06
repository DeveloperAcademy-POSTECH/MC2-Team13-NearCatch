//
//  SettingProfileImageView.swift
//  NearCatch
//
//  Created by ryu hyunsun on 2022/06/11.
//

import SwiftUI
import PhotosUI

struct SettingProfileImageView: View {
    // 시트 변경 관련(골랐다? -> 다음 시트)
//    @State var activeSheet: ActiveSheet?
    
    // 띄워지는 사진 <-> inputImage
    @Binding var profileImage: UIImage?
    
    // show
//    @State var showImagePicker: Bool = false
    
    // 최종 고른 사진
//    @State private var inputImage: UIImage?
//    @State var checkPermission: Bool = false
    @State private var isPresentedAllImage = false
    @State private var isPresentedImage = false
    @State private var isPresentedPermissionCheck = false
//    @State var imageWasImported = false
    
    var inlineColorText: AttributedString = PartialColor.partialColorString(allString:"재간둥이 니어캣", allStringColor:.white,partialString:"니어캣",partialStringColor:Color(red: 255/255, green: 236/255, blue: 108/255))
    let accessLevel: PHAccessLevel = .readWrite
    
    var body: some View {
        VStack{
            Text("당신의 사진을 등록해 주세요!")
                .foregroundColor(Color(red: 255/255, green: 236/255, blue: 108/255))
                .font(.custom("온글잎 의연체", size: 34))
                .padding(.top, 45)
                .padding(.bottom, 10)
            Text("프로필 사진은 선택 항목입니다.")
                .foregroundColor(.white)
                .font(.custom("온글잎 의연체", size: 24))
            Text("미입력시 기본 프로필이 제공됩니다.")
                .foregroundColor(.white)
                .font(.custom("온글잎 의연체", size: 24))
            
            // 이미지 클릭 버튼
            ImageSelectButton(image: $profileImage) {
                if self.profileImage == nil {
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.3))
                        Circle()
                            .fill(.white)
                            .frame(width: 200, height: 200)
                        VStack{
                            Image("icn_img")
                        }
                    }
                    .frame(width: 215, height: 215)
                    .padding(.top, 25)
                }
                else {
                    ZStack{
                        Circle()
                            .fill(.white.opacity(0.3))
                        Image(uiImage: self.profileImage!)
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            
                            
                    }.frame(width: 215, height: 215)
                        .padding(.top, 25)
                }
            }
            
            Image("img_sunglass_68px")
                .padding(.top, 30.0)
            Text("기본 프로필")
                .foregroundColor(.white)
                .font(.custom("온글잎 의연체", size: 22))
            Text(inlineColorText)
                .font(.custom("온글잎 의연체", size: 22))
            
            
        }
    }

}
    
struct SettingProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        SettingProfileImageView(profileImage: .constant(nil))
    }
}
