//
//  RegisterView.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 28/2/25.
//

import SwiftUI

struct RegisterView: View {
    @State var mail = ""
    @State var pass = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HeaderComponent(title: "Đăng ký bì low", offset: -95, rotate: -15)
            
            Form {
                TextField("Email", text: $mail)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                SecureField("PassWord", text: $pass) 
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                            .frame(height: 50) 
                        Text("Register")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding(10)
            
            // Foot
            VStack {
                Text("Đã có tài khoản?")
                Button("Quay lại ha...") {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            Spacer()
        }
        .navigationBarBackButtonHidden(true) 
        
    }
}

#Preview {
    RegisterView()
}
