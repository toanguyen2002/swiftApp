//
//  ContentView.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 27/2/25.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {

    init() {
        FirebaseApp.configure()
    }
    var body: some View {
        VStack {
            HomeView()
        }
//        .padding()
    }
}
//
//#Preview {
//    ContentView()
//}
