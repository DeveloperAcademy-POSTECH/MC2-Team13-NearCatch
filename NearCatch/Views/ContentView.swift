//
//  ContentView.swift
//  NearCatch
//
//  Created by Wonhyuk Choi on 2022/06/07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var isContentReady : Bool = false
    
    var body: some View {
        
        ZStack{
            
            HomeView()
            
            if !isContentReady {
                LottieView(jsonName: "lodingAnim")
                    .background(Color.white.edgesIgnoringSafeArea(.all))
                    .transition(.opacity)
            }
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {withAnimation{isContentReady.toggle()}
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
