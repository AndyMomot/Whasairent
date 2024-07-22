//
//  PrivacyPolicyView.swift

import SwiftUI

struct PrivacyPolicyView: View {
    @StateObject private var viewModel = PrivacyPolicyViewModel()
    
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Asset.preloaderBackground.swiftUIImage
                .resizable()
                .ignoresSafeArea()
                .offset(y: -150)
            
            Colors.greenCustom.swiftUIColor
                .ignoresSafeArea()
                .opacity(0.7)
            
            VStack(spacing: 36) {
                Asset.onboardingLogo.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 22)
                    .padding(.horizontal, 86)
                
                Asset.privacy.swiftUIImage
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 86)
                
                Spacer()
                
                Rectangle()
                    .foregroundStyle(.white)
                    .frame(height: bounds.height * 0.4)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                    .overlay {
                        VStack {
                            Spacer()
                            NextButton(title: "Rozpocznij") {
                                rootViewModel.setFlow(.main)
                            }
                            .frame(width: bounds.width * 0.5)
                            
                            Spacer()
                            
                            Button {
                                viewModel.showPrivacyPolicy.toggle()
                            } label: {
                                VStack(spacing: 4) {
                                    Text("Klikając przycisk rozpocznij, zgadzasz się ")
                                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                    Text("z polityką prywatności.")
                                        .foregroundStyle(Colors.blueCustom.swiftUIColor)
                                }
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 18))
                                .multilineTextAlignment(.center)
                            }

                            
                            Spacer()
                        }
                    }
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .sheet(isPresented: $viewModel.showPrivacyPolicy) {
            if let url = viewModel.privacyPolicyURL {
                WebView(url: url)
            }
        }
    }
}

#Preview {
    PrivacyPolicyView()
}
