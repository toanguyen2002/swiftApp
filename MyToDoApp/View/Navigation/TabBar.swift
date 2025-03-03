//
//  TabBar.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 27/2/25.
//
import SwiftUI

struct TabBar: View {
    @State private var showSheet = false
    var action: () -> Void
    
    
    var body: some View {
        ZStack {
            Arc()
                .fill(Color.tabBarBackground)
                .frame(height:80)
                .overlay{
                    Arc().stroke(Color.tabBarBorder,lineWidth: 0.5)
                }
            HStack{
                Button{
                    action()
                }label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                
//                        Button("Show Sheet") {
//                            showSheet.toggle()
//                        }
//                        .sheetPlus(isPresented: true) {
//                            Text("Hello from sheet!")
//                                .frame(maxWidth: .infinity, maxHeight: .infinity)
//                                .background(Color.white)
//                        }
                
                Spacer()
                NavigationLink{}label: {
                    Image(systemName: "list.star")
                        .frame(width: 44, height: 44)
                }
            }
            
            .font(.title2)
            .foregroundColor(.white)
            .padding(EdgeInsets(top:20,leading: 32,bottom: 24,trailing: 32))
        }
        .frame(maxHeight:.infinity,alignment: .bottom)
        .ignoresSafeArea()
    }
}

#Preview {
    TabBar(action: {})
}
