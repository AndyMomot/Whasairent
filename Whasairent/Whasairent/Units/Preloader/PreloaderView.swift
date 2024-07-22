//
//  PreloaderView.swift

import SwiftUI

struct PreloaderView: View {
    @StateObject private var viewModel = PreloaderViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.preloaderBackground.swiftUIImage
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Asset.preloaderLogo.swiftUIImage
                    .padding(.horizontal, 52)
                    .frame(height: bounds.height * 0.23)
                    .offset(y: 124)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                
                Rectangle()
                    .foregroundStyle(.white)
                    .opacity(0.7)
                    .cornerRadius(60, corners: [.topLeft, .topRight])
                    .frame(height: bounds.height * 0.2)
                    .overlay {
                        VStack {
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                .frame(height: 60)
                                .offset(y: -20)
                                .overlay {
                                    VStack(spacing: 0) {
                                        HStack {
                                            Text(viewModel.progressString)
                                                .foregroundStyle(.white)
                                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                                            Spacer()
                                        }
                                        
                                        ProgressView(value: viewModel.progress)
                                            .tint(Colors.blackCustom.swiftUIColor)
                                            .background(.white)
                                            .cornerRadius(3, corners: .allCorners)
                                            .frame(height: 8)
                                            
                                    }
                                    .padding(.horizontal, 27)
                                    .padding(.bottom, 54)
                                }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 29)
                    }
            }
        }
        .onReceive(viewModel.timer) { input in
            DispatchQueue.main.async {
                withAnimation {
                    viewModel.updateProgress()
                }
            }
        }
    }
}

#Preview {
    PreloaderView()
}
