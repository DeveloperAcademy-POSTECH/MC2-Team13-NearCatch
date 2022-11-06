//
//  SharedRectangularButton.swift
//  NearCatch
//
//  Created by HWANG-C-K on 2022/06/13.
//

import SwiftUI

struct SharedRectangularButton: View {
    var rectWidth:CGFloat
    var rectColor:Color
    var text:String
    var textColor:Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius:10)
                .fill(rectColor)
                .frame(width:rectWidth, height:50)
            Text(LocalizedStringKey(text))
                .font(.custom("온글잎 의연체", size:28))
                .foregroundColor(textColor)
        }
        
    }
}

struct SharedRectangularButton_Previews: PreviewProvider {
    static var previews: some View {
        SharedRectangularButton(rectWidth:350, rectColor:.PrimaryColor, text:"수정하기", textColor:.black)
    }
}
