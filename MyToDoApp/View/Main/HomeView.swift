//
//  HomeView.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 27/2/25.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView {
            ZStack{
                //MARK: background Color
                Color.background
                    .ignoresSafeArea()
                //MARK: background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                Image("House")
                    .frame(maxHeight: .infinity,alignment: .top)
                    .padding(.top,257)
                TabBar(action:{})
                
            }
        }
    }
}

//#Preview {
//    HomeView()
//        .preferredColorScheme(.dark)
//
//}
