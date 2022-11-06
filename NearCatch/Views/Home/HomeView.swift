//
//  HomeView.swift
//  NearCatch
//
//  Created by Wonhyuk Choi on 2022/06/09.
//

import SwiftUI

struct HomeView: View {
    let localNetAuth = LocalNetworkAuthorization()
    @StateObject var niObject = NISessionManager()
    @State var isLocalNetworkPermissionDenied = false
    @Environment(\.scenePhase) var scenePhase
    
    @State var isLaunched = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView{
            ZStack {
                Image("img_background")
                    .resizable()
                    .ignoresSafeArea()
                
                LottieView(jsonName: "Background")
                    .ignoresSafeArea(.all)
                
                if isLocalNetworkPermissionDenied || niObject.isPermissionDenied {
                    PermissionCheckView()
                } else {
                    ZStack {
                        VStack{
                            switch
                            niObject.gameState{
                            case.finding:
                                Image("img_shooting")
                                    .offset(x: -80, y: -340)
                            case.found:
                                Image("img_shooting")
                                    .offset(x: -80, y: -340)
                            case.ready:
                                Text("")
                                
                            }
                        }
                        VStack{
                            switch
                            niObject.gameState{
                            case.finding:
                                VStack {
                                    Text(
                                        PartialColor.partialColorString(allString: "니어캣이", allStringColor: .white, partialString: "니어캣", partialStringColor: .PrimaryColor)
                                    )
                                    Text("인연의 별을 찾고 있어요!")
                                }
                                .font(.custom("온글잎 의연체", size: 28))
                                .multilineTextAlignment(.center)
                            case.found:
                                VStack {
                                    Text(PartialColor.partialColorString(allString: "니어캣이", allStringColor: .white, partialString: "니어캣", partialStringColor: .PrimaryColor))
                                    Text("인연의 별을 찾았어요!")
                                }
                                .font(.custom("온글잎 의연체", size: 28))
                                .multilineTextAlignment(.center)
                            case.ready:
                                Text("")
                            }
                            Spacer().frame(height:600)
                        }
                        VStack {
                            Spacer()
                                .frame(height: 120 + 54)
                            
                            switch niObject.gameState {
                            case .ready:
                                Text("니어캣을 눌러서\n새로운 인연을 찾아보세요!")
                                    .font(.custom("온글잎 의연체", size: 28))
                                    .multilineTextAlignment(.center)
                            case .finding:
                                StarBubble(count: niObject.peersCnt)
                            case .found:
                                HeartBubble()
                            }
                        }
                        VStack {
                            Spacer()
                            if niObject.gameState != .ready {
                                TipChange()
                                    .transition(.move(edge: .bottom))
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                    
                    
                    HomeMainButton(state: $niObject.gameState) {
                        withAnimation {
                            switch niObject.gameState {
                            case .ready:
                                niObject.start()
                                niObject.gameState = .finding
                                if isLaunched {
                                    localNetAuth.requestAuthorization { auth in
                                        isLocalNetworkPermissionDenied = !auth
                                    }
                                    isLaunched = false
                                }
                            case .finding:
                                niObject.stop()
                                niObject.gameState = .ready
                            case .found:
                                niObject.stop()
                                niObject.gameState = .ready
                            }
                        }
                    }
                }
            }
            .toolbar{
                ToolbarItemGroup(placement:.navigationBarTrailing) {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image("icn_person")
                            .resizable()
                            .frame(width:35*1.2, height:35*1.2)
                    }
                    .offset(
                        x : niObject.gameState == .ready ? 0 : 100,
                        y : niObject.gameState == .ready ? 0 : -100
                    )
                }
            }
        }
        .onChange(of: scenePhase) { newValue in
            if !isLaunched {
                localNetAuth.requestAuthorization { auth in
                    isLocalNetworkPermissionDenied = !auth
                }
            }
        }
        .customSheet(isPresented: $niObject.isBumped, dismiss: {
            niObject.gameState = .ready
            niObject.stop()
        }) {
            Match(imageData: niObject.bumpedImage, nickName: niObject.bumpedName, keywords: niObject.bumpedKeywords)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
            .environment(\.locale, .init(identifier: "ko"))
    }
}

