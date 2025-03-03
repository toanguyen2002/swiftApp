//
//  SplashScreen.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 1/3/25.
//

import SwiftUI

struct SplashScreen: View {
    @State var active = true
    @State var size = 0.85
    @State var opacity: Double = 0.1
    
    
    var body: some View {
        if active {
            Image(systemName: "hare.fill")
                .font(.system(size: 80))
                .foregroundColor(.red)
            Text("Todo App")
                .font(Font.custom("myFont", size: 26))
                .foregroundColor(.black)
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1)) {
                        self.opacity = 0.9
                        self.size = 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.active = false
                    }
                }
                .transition(.opacity)
        }  else{
            LoginView()
        }
    }
}

#Preview {
    SplashScreen()
}
