//
//  KeywordChangeView.swift
//  NearCatch
//
//  Created by HWANG-C-K on 2022/06/14.
//

import SwiftUI

struct KeywordChangeView: View {
    @StateObject var tagData = TagViewModel()
    @State var tag:Int? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Binding var keywords : [Int]
    @State var duplicatedkeywords : [Int] = []
    
    var body: some View {
        ZStack {
            //배경 이미지
            Image("img_background")
                .resizable()
                .ignoresSafeArea()
            
            //배경 별 LottieView
            LottieView(jsonName: "Background")
                .ignoresSafeArea(.all)
            
            VStack{
                //모달 닫는 버튼
                Button(
                    action: {
                        presentationMode.wrappedValue.dismiss()
                }) {
                    RoundedRectangle(cornerRadius:10)
                        .foregroundColor(.white)
                        .frame(width:50, height:5)
                }
                
                Spacer()
                    .frame(height:60)
                Text("관심사 수정".partialColor(["관심사"], .PrimaryColor))
                    .font(.custom("온글잎 의연체", size:34))
                    .foregroundColor(.PrimaryColor)
                Text("최소 5개 이상 선택해야 해요!")
                    .font(.custom("온글잎 의연체", size: 22))
                    .foregroundColor((duplicatedkeywords.count < 5) ? Color.red : Color.white)
                Text("\(duplicatedkeywords.count) / 10")
                    .font(.custom("온글잎 의연체", size: 34))
                    .foregroundColor((duplicatedkeywords.count < 5 || duplicatedkeywords.count > 10) ? Color.red : Color.white)
                
                Spacer()
                    .frame(height:80)
                
                //관심사 키워드 나열
                ScrollView(.horizontal, showsIndicators: false) {
                    VStack(alignment: .leading){
                        HStack{
                            ForEach(0..<14, id: \.self) { i in
                                    Button(action: {
                                        if tagData.Tags[i].isSelected == true {
                                            tagData.Tags[i].isSelected = false
                                            duplicatedkeywords = duplicatedkeywords.filter{ $0 !=  tagData.Tags[i].index }
                                            
                                        } else {
                                            tagData.Tags[i].isSelected = true
                                            duplicatedkeywords.append(tagData.Tags[i].index)
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
                                        duplicatedkeywords = duplicatedkeywords.filter{ $0 !=  tagData.Tags[i].index }
                                    } else {
                                        tagData.Tags[i].isSelected = true
                                        duplicatedkeywords.append(tagData.Tags[i].index)
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
                                        duplicatedkeywords = duplicatedkeywords.filter{ $0 !=  tagData.Tags[i].index }
                                    } else {
                                        tagData.Tags[i].isSelected = true
                                        duplicatedkeywords.append(tagData.Tags[i].index)
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
                                        duplicatedkeywords = duplicatedkeywords.filter{ $0 !=  tagData.Tags[i].index }
                                    } else {
                                        tagData.Tags[i].isSelected = true
                                        duplicatedkeywords.append(tagData.Tags[i].index)
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
                                        duplicatedkeywords = duplicatedkeywords.filter{ $0 !=  tagData.Tags[i].index }
                                    } else {
                                        tagData.Tags[i].isSelected = true
                                        duplicatedkeywords.append(tagData.Tags[i].index)
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
                                        duplicatedkeywords = duplicatedkeywords.filter{ $0 !=  tagData.Tags[i].index }
                                    } else {
                                        tagData.Tags[i].isSelected = true
                                        duplicatedkeywords.append(tagData.Tags[i].index)
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
                    .frame(height:140)
                
                HStack{
                    //취소 버튼
                    Button{
                        action: do {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label:{
                        SharedRectangularButton(rectWidth:150, rectColor:.ThirdColor, text:"취소", textColor:.white)
                    }
                    
                    Spacer()
                        .frame(width:20)
                    
                    //수정 완료 버튼
                    Button{
                        action: do {
                            keywords = duplicatedkeywords
                            CoreDataManager.coreDM.readKeyword()[0].favorite = keywords
                            CoreDataManager.coreDM.updateProfile()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    } label:{
                        SharedRectangularButton(rectWidth:150, rectColor: (duplicatedkeywords.count < 5 || duplicatedkeywords.count > 10) ? .ThirdColor : .PrimaryColor, text:"수정", textColor:(duplicatedkeywords.count < 5 || duplicatedkeywords.count > 10) ? .white : .black)
                    }.disabled(duplicatedkeywords.count < 5 || duplicatedkeywords.count > 10)
                }
                
                Spacer()
                    .frame(height:20)
            }
        }
        //이미 선택되어 있는 키워드 표시
        .onAppear {
            duplicatedkeywords = keywords
            for keyword in keywords {
                tagData.Tags[keyword].isSelected = true
            }
        }
    }
}

struct KeywordChangeView_Previews: PreviewProvider {
    static var previews: some View {
        KeywordChangeView(keywords: .constant([1,2,3]))
    }
}
