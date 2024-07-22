//
//  InputField.swift

import SwiftUI

struct InputField: View {
    var title: String
    var titleColor: Color
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundStyle(titleColor)
                .font(Fonts.KulimPark.bold.swiftUIFont(size: 14))
                .padding(.horizontal, 4)
            
            RoundedRectangle(cornerRadius: 30)
                .foregroundStyle(.white)
                .frame(height: 50)
                .overlay {
                    TextField(text: $text) {
                        Text(placeholder)
                            .foregroundStyle(.gray)
                            .font(Fonts.KulimPark.extraLight.swiftUIFont(size: 14))
                    }
                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                    .padding(.horizontal)
                }
        }
    }
}

#Preview {
    ZStack {
        Colors.greenCustom.swiftUIColor
        
        InputField(
            title: "Название проекта", 
            titleColor: Colors.blackCustom.swiftUIColor,
            placeholder: "Введите данные...",
            text: .constant("")
        )
    }
}
