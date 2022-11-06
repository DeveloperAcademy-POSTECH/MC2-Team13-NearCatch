//
//  KeywordScroll.swift
//  NearCatch
//
//  Created by HWANG-C-K on 2022/06/19.
//

import SwiftUI

struct KeywordScroll: View {
    var tagData : TagViewModel
    var tags : [Tag]
    let keywords : [Int]
    var keywordCut: Int
    
    init(keywords : [Int]) {
        tagData = TagViewModel()
        tags = []
        self.keywords = keywords
        for keyword in keywords {
            tags.append(tagData.Tags[keyword])
        }
        keywordCut = (tags.count/2) + (tags.count % 2) - 1
    }
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators:false){
                VStack (alignment: .center, spacing: 10) {
                    HStack (alignment: .center, spacing: 5) {
                        ForEach(tags) { tag in
                            if tags.firstIndex(of: tag) ?? 0 <= keywordCut {
                                Text(LocalizedStringKey(tag.name))
                                    .font(.custom("온글잎 의연체", size: 22))
                                    .tagView(.black, .PrimaryColor)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                        }
                    }
                    HStack (alignment: .center, spacing: 5) {
                        ForEach(tags) { tag in
                            if tags.firstIndex(of: tag) ?? 0 > keywordCut {
                                Text(LocalizedStringKey(tag.name))
                                    .font(.custom("온글잎 의연체", size: 22))
                                    .tagView(.black, .PrimaryColor)
                                    .fixedSize(horizontal: true, vertical: false)
                            }
                        }
                    }
                }
                .padding(.vertical, 10)
            }
        }
    }
}

struct KeywordScroll_Previews: PreviewProvider {
    static var previews: some View {
        KeywordScroll(keywords: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}
