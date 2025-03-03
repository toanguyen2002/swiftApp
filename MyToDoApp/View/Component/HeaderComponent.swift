//
//  HeaderComponent.swift
//  MyToDoApp
//
//  Created by Toán Nguyễn on 28/2/25.
//

import SwiftUI

struct HeaderComponent: View {
    var title:String = ""
    var offset:CGFloat = -100
    var rotate : Double = 0
    var backGround : Color = .pink
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(self.backGround)
                .rotationEffect(Angle(degrees: self.rotate))
            VStack{
                Text(title)
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .foregroundColor(.white)
                Text("Làm cho vui.. ! sân si củ lon")
                    .font(.system(size: 15, weight: .light, design: .default))
                    .foregroundColor(.white)
            }
            .padding(.top,30)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 300
        )
        .offset(y: self.offset)
    }
}

#Preview {
    HeaderComponent()
}
