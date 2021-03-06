//
//  StarBubbleView.swift
//  NearCatch
//
//  Created by 김예훈 on 2022/06/09.
//

import SwiftUI

struct StarBubble: View {
    var count: Int
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.5)) 
            
            Circle()
                .fill(.white.opacity(0.5))
                .padding(4)
            
            
            Image("img_star_58px")
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 58)
            
            Image("img_bubble_86px")
            
            Text("\(count)")
                .font(.custom("온글잎 의연체", size: 34))
            
        }
        .frame(width: 86, height: 86)
    }
}

struct HeartBubble: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.white.opacity(0.5))
            
            Circle()
                .fill(.white.opacity(0.5))
                .padding(4)
            
            LottieView(jsonName: "Heart", loopMode: .loop)
//            Image("img_heart"))
                .frame(width: 58, height: 58)
            
            Image("img_bubble_86px")
        }
        .frame(width: 86, height: 86)
    }
}

struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            StarBubble(count: 2)
            
            HeartBubble()
        }
        .preferredColorScheme(.dark)
        .padding(20)
        .previewLayout(.sizeThatFits)
    }
}

