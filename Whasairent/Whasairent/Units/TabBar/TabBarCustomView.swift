//
//  TabBarCustomView.swift

import SwiftUI

struct TabBarCustomView: View {
    @Binding var selectedItem: Int
    
    @State private var items: [TabBar.Item] = [
        .init(imageName: Asset.tab1.name),
        .init(imageName: Asset.tab2.name),
        .init(imageName: Asset.tab3.name),
        .init(imageName: Asset.tab4.name)
    ]
    
    private var arrange: [Int] {
        Array(0..<items.count)
    }
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        
        Rectangle()
            .foregroundStyle(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
            .overlay {
                HStack {
                    Spacer()
                    
                    ForEach(arrange, id: \.self) { index in
                        let item = items[index]
                        let isSelectedItem = index == selectedItem
                        let imageSize = bounds.width * 0.086
                        
                        Button {
                            selectedItem = index
                        } label: {
                            Image(item.imageName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .tint(
                                    isSelectedItem ? .white : .black
                                )
                                .frame(width: imageSize,
                                       height: imageSize)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 20)
                                .background(
                                    isSelectedItem ? Colors.greenCustom.swiftUIColor : .clear
                                )
                                .cornerRadius(20, corners: .allCorners)
                        }
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
    }
}

#Preview {
    ZStack {
        Colors.blackCustom.swiftUIColor
        
        TabBarCustomView(selectedItem: .constant(0))
            .frame(height: 113)
    }
}
