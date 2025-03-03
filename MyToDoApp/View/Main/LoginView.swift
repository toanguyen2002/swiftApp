//
//  LoginView.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 28/2/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginModel = LoginViewModel()
    @State private var isPressed = false
    
    var body: some View {
        //Head
        HeaderComponent(title: "Đăng nhập trước nha", offset: -95, rotate: -15)
        //Body
        Form {
            TextField("Email", text: $loginModel.username)
                .textFieldStyle(DefaultTextFieldStyle())
            SecureField("Password", text: $loginModel.password)
                .textFieldStyle(DefaultTextFieldStyle())
            Button {
                isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    isPressed = false
                }
                loginModel.login()
                
            } label: {
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(isPressed ? Color.green : Color.blue)
                    Text("Login")
                        .foregroundColor(.white)
                        .bold()
                }
            }
            .buttonStyle(PlainButtonStyle())
            .animation(.easeInOut, value: isPressed)
            .padding()
        }
  
        .offset(y:-50)
        
        Spacer()
        //Foot
        VStack{
            Text("Chưa có tài khoản?")
            NavigationLink("Đăng ký khum?",destination: RegisterView())
        }
        Spacer()
    }
}

//#Preview {
//    LoginView()
//}
