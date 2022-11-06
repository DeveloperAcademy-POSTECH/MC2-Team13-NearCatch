//
//  Keywords.swift
//  NearCatch
//
//  Created by Wonhyuk Choi on 2022/06/16.
//  ref : https://www.youtube.com/watch?v=4UcShbcJUU0
//

import SwiftUI

struct Keywords: View {
    var tagData : TagViewModel
    var tags : [Tag]
    let keywords : [Int]
    
    init(keywords : [Int]) {
        tagData = TagViewModel()
        tags = []
        self.keywords = keywords
        for keyword in keywords {
            tags.append(tagData.Tags[keyword])
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            ForEach(getRows(), id: \.self) { rows in
                HStack(alignment: .center, spacing: 5) {
                    ForEach(rows) { row in
                        Text(LocalizedStringKey(row.name))
                            .lineLimit(1)
                            .font(.custom("온글잎 의연체", size: 22))
                            .tagView(.black, .PrimaryColor)
                            .fixedSize(horizontal: true, vertical: false)
                    }
                }
            }
        }
    }
    
    func getRows()->[[Tag]] {
        var rows: [[Tag]] = []
        var currentRow: [Tag] = []
        
        var totalWidth: CGFloat = 0
        
        let screenWidth: CGFloat = UIScreen.main.bounds.size.width - 200
        
        tags.forEach { tag in
            let font = UIFont.preferredFont(from: .custom("온글잎 의연체", size: 22))
            let attributes = [NSAttributedString.Key.font: font]
            let size = (tag.name as NSString).size(withAttributes: attributes)
            
            totalWidth += size.width
            
            if totalWidth > screenWidth {
                rows.append(currentRow)
                currentRow.removeAll()
                currentRow.append(tag)
                totalWidth = size.width
            } else {
                currentRow.append(tag)
            }
        }
        
        if !currentRow.isEmpty {
            rows.append(currentRow)
            currentRow.removeAll()
        }
        
        return rows
    }
}

// ref : https://stackoverflow.com/questions/60049927/convert-from-swiftui-font-to-uifont
extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let uiFont: UIFont
        
        switch font {
        case .largeTitle:
            uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
        case .title:
            uiFont = UIFont.preferredFont(forTextStyle: .title1)
        case .title2:
            uiFont = UIFont.preferredFont(forTextStyle: .title2)
        case .title3:
            uiFont = UIFont.preferredFont(forTextStyle: .title3)
        case .headline:
            uiFont = UIFont.preferredFont(forTextStyle: .headline)
        case .subheadline:
            uiFont = UIFont.preferredFont(forTextStyle: .subheadline)
        case .callout:
            uiFont = UIFont.preferredFont(forTextStyle: .callout)
        case .caption:
            uiFont = UIFont.preferredFont(forTextStyle: .caption1)
        case .caption2:
            uiFont = UIFont.preferredFont(forTextStyle: .caption2)
        case .footnote:
            uiFont = UIFont.preferredFont(forTextStyle: .footnote)
        case .body:
            fallthrough
        default:
            uiFont = UIFont.preferredFont(forTextStyle: .body)
        }
        
        return uiFont
    }
}

struct Keywords_Previews: PreviewProvider {
    static var previews: some View {
        Keywords(keywords: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
    }
}
