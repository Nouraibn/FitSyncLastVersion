//
//  SplashScreen.swift
//  FitSync
//
//  Created by Noura on 26/03/1446 AH.
//


import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ExploreScreen()
        } else{
            VStack{
                VStack{
                    ZStack{
                        Color.fitSyncBlue2
                            .ignoresSafeArea()
                        Image(.frameLessLogo)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                    }
                }
                .opacity(opacity)
                .onAppear{
                    
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size = 9.0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
                    withAnimation{self.isActive = true}
                    
                }
            
        }
       
        }
    }
}

#Preview {
    SplashScreen()
}
