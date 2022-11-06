//
//  SettingKeywordView.swift
//  NearCatch
//
//  Created by Tempnixk on 2022/06/12.
//

import SwiftUI

struct SettingKeywordView: View {
    
    @Binding var nickname: String
    @Binding var profileImage: UIImage?
    
    @StateObject var tagData = TagViewModel()
    @ObservedObject var togglecount = ToggleCount()
    @State var tag:Int? = nil
    
    @Binding var isUserReady: Bool
    @Binding var currentPage: Int
    @State var nicknameValidation: Bool = false
    
    var isDisabledButton: Bool = true
    var body: some View {
        VStack {
            Spacer()
            Text("관심사를 선택해주세요!").font(.custom("온글잎 의연체", size: 34))
            Text("최소 5개 이상 선택해야 해요!")
                .font(.custom("온글잎 의연체", size: 22))
                .foregroundColor((togglecount.keywordCounter < 5) ? Color.red : Color.white)
            Text("\(togglecount.keywordCounter) / 10")
                .font(.custom("온글잎 의연체", size: 34))
                .foregroundColor((togglecount.keywordCounter < 5 || togglecount.keywordCounter > 10) ? Color.red : Color.white)
            Spacer()
            
            ScrollView(.horizontal, showsIndicators: false) {
                VStack(alignment: .leading){
                    HStack{
                        ForEach(0..<14, id: \.self) { i in
                            //                            if self.togglecount.keywordCounter <= 10 {
                            Button(action: {
                                if tagData.Tags[i].isSelected == true {
                                    tagData.Tags[i].isSelected = false
                                    self.togglecount.keywordCounter -= 1
                                } else {
                                    tagData.Tags[i].isSelected = true
                                    self.togglecount.keywordCounter += 1
                                }
                            }){
                                ZStack{
                                    if tagData.Tags[i].isSelected == true{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.black, .PrimaryColor)
                                    }
                                    else{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.gray, .ThirdColor)
                                    }
                                }
                            }
                            
                        }
                    }
                    HStack{
                        ForEach(14..<30, id: \.self) { i in
                            Button(action: {
                                if tagData.Tags[i].isSelected == true {
                                    tagData.Tags[i].isSelected = false
                                    self.togglecount.keywordCounter -= 1
                                } else {
                                    tagData.Tags[i].isSelected = true
                                    self.togglecount.keywordCounter += 1
                                }
                            }){
                                ZStack{
                                    if tagData.Tags[i].isSelected == true{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.black, .PrimaryColor)
                                    }
                                    else{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.gray, .ThirdColor)
                                    }
                                }
                            }
                        }
                    }
                    HStack{
                        ForEach(30..<45, id: \.self) { i in
                            Button(action: {
                                
                                if tagData.Tags[i].isSelected == true {
                                    tagData.Tags[i].isSelected = false
                                    self.togglecount.keywordCounter -= 1
                                } else {
                                    tagData.Tags[i].isSelected = true
                                    self.togglecount.keywordCounter += 1
                                }
                            }){
                                ZStack{
                                    if tagData.Tags[i].isSelected == true{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.black, .PrimaryColor)
                                    }
                                    else{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.gray, .ThirdColor)
                                    }
                                }
                            }
                        }
                    }
                    HStack{
                        ForEach(45..<60, id: \.self) { i in
                            Button(action: {
                                if tagData.Tags[i].isSelected == true {
                                    tagData.Tags[i].isSelected = false
                                    self.togglecount.keywordCounter -= 1
                                } else {
                                    tagData.Tags[i].isSelected = true
                                    self.togglecount.keywordCounter += 1
                                }
                            }){
                                if tagData.Tags[i].isSelected == true{
                                    Text(LocalizedStringKey(tagData.Tags[i].name))
                                        .font(.custom("온글잎 의연체", size: 22))
                                        .tagView(.black, .PrimaryColor)
                                }
                                else{
                                    Text(LocalizedStringKey(tagData.Tags[i].name))
                                        .font(.custom("온글잎 의연체", size: 22))
                                        .tagView(.gray, .ThirdColor)
                                }
                            }
                            
                        }
                    }
                    HStack{
                        ForEach(60..<75, id: \.self) { i in
                            Button(action: {
                                
                                if tagData.Tags[i].isSelected == true {
                                    tagData.Tags[i].isSelected = false
                                    self.togglecount.keywordCounter -= 1
                                } else {
                                    tagData.Tags[i].isSelected = true
                                    self.togglecount.keywordCounter += 1
                                }
                            }){
                                ZStack{
                                    if tagData.Tags[i].isSelected == true{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.black, .PrimaryColor)
                                    }
                                    else{
                                        Text(LocalizedStringKey(tagData.Tags[i].name))
                                            .font(.custom("온글잎 의연체", size: 22))
                                            .tagView(.gray, .ThirdColor)
                                    }
                                }
                            }
                        }
                    }
                    HStack{
                        ForEach(75..<87, id: \.self) { i in
                            Button(action: {
                                
                                if tagData.Tags[i].isSelected == true {
                                    tagData.Tags[i].isSelected = false
                                    self.togglecount.keywordCounter -= 1
                                } else {
                                    tagData.Tags[i].isSelected = true
                                    self.togglecount.keywordCounter += 1
                                }
                            }){
                                if tagData.Tags[i].isSelected == true{
                                    Text(LocalizedStringKey(tagData.Tags[i].name))
                                        .font(.custom("온글잎 의연체", size: 22))
                                        .tagView(.black, .PrimaryColor)
                                }
                                else{
                                    Text(LocalizedStringKey(tagData.Tags[i].name))
                                        .font(.custom("온글잎 의연체", size: 22))
                                        .tagView(.gray, .ThirdColor)
                                }
                            }
                            
                        }
                    }
                }.padding([.leading, .trailing], 20)
            }
            Spacer()
            
            // 관심사 저장버튼
            Button{
                if nickname != "" {
                    CoreDataManager.coreDM.createProfile(nickname: nickname)
                    if let profileImage = profileImage {
                        let profileImage2 = ImageConverter.resize(image: profileImage)
                        print("하이하이")
                        print(profileImage2)
                        CoreDataManager.coreDM.createPicture(content: profileImage2)
                    } else {
                        let x = UIImage(named: "img_sunglass_68px")!
                        CoreDataManager.coreDM.createPicture(content: x)
                    }
                    var tempList : [Int] = []
                    for i in 0 ..< 87 {
                        if tagData.Tags[i].isSelected == true {
                            tempList.append(tagData.Tags[i].index)
                        }
                    }
                    CoreDataManager.coreDM.createKeyword(favorite: tempList)
                    //                    print(tempList)
                    self.isUserReady = true
                }
                else {
                    self.nicknameValidation = true
                }
                
            } label:{
                SharedRectangularButton(rectWidth:150, rectColor: (togglecount.keywordCounter < 5 || togglecount.keywordCounter > 10) ? .ThirdColor : .PrimaryColor, text:"관심사 저장", textColor:(togglecount.keywordCounter < 5 || togglecount.keywordCounter > 10) ? .white : .black)
            }.disabled(togglecount.keywordCounter < 5 || togglecount.keywordCounter > 10)
            
            Spacer()
            
        }
        .alert(isPresented: $nicknameValidation) {
            Alert(title: Text("닉네임이 입력되지 않았습니다."), message: Text("닉네임을 입력해 주세요"), dismissButton: .cancel(Text("확인"), action: {
                self.nicknameValidation = false
                withAnimation{
                    self.currentPage = 0
                }
            }))
            
        }
    }
}

extension View {
    func tagView(_ forgroundColor: Color, _ backgroundColor: Color) -> some View {
        self.modifier(TagViewModifier(forgroundColor: forgroundColor, backgroundColor: backgroundColor))
    }
}

struct TagViewModifier: ViewModifier {
    
    var forgroundColor: Color
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(forgroundColor)
            .padding(.horizontal).padding(.vertical, 10)
            .background(Capsule().fill(backgroundColor))
            .shadow(radius: 5)
    }
}

//
//struct SettingKeywordView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingKeywordView(nickname: .constant("sad"), profileImage: .constant(UIImage("")))
//    }
//}
