//
//  OnboardingView.swift

import SwiftUI

struct OnboardingView: View {
    var item: OnboardingView.OnboardingItem
    @Binding var currentPageIndex: Int
    
    @EnvironmentObject private var rootViewModel: RootContentView.RootContentViewModel
    @StateObject private var viewModel = OnboardingViewModel()
    
    private var bounds: CGRect {
        UIScreen.main.bounds
    }
    
    var body: some View {
        ZStack {
            Colors.greenCustom.swiftUIColor
            
            VStack(spacing: 50) {
                VStack(spacing: 40) {
                    Asset.onboardingLogo.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .padding(.top, 22)
                        .padding(.horizontal, 86)
                    
                    PlaneView(item: item)
                        .opacity(viewModel.isAnimatingImageOpacity ? 1 : 0)
                        .frame(maxWidth: viewModel.isAnimatingImageOpacity ? bounds.width * 0.6 : 100,
                               maxHeight: viewModel.isAnimatingImageOpacity ? bounds.width * 0.6 : 100)
                        .animation(.bouncy(duration: 1.5),
                                   value: viewModel.isAnimatingImageOpacity)
                    
                }
                
                Rectangle()
                    .foregroundStyle(.white)
                    .cornerRadius(40, corners: [.topLeft, .topRight])
                    .overlay {
                        VStack {
                            Spacer()
                            Text(item.text)
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .font(Fonts.KulimPark.regular.swiftUIFont(size: 18))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            Spacer()
                            
                            HStack {
                                HStack(spacing: 15) {
                                    let range = Array(0..<item.count)
                                    ForEach(range, id: \.self) { index in
                                        var isCurrent = index == currentPageIndex
                                       RoundedRectangle(cornerRadius: 4)
                                            .foregroundStyle(isCurrent ? Colors.greenCustom.swiftUIColor : Colors.grayCustom.swiftUIColor)
                                            .frame(width: 18, height: 18)
                                    }
                                }
                                .padding(.leading)
                                
                                Spacer()
                                
                                Button {
                                    withAnimation {
                                        currentPageIndex = item.next.rawValue
                                    }
                                    if item == .third {
                                        rootViewModel.setFlow(.privacyPolicy)
                                    }
                                } label: {
                                    Rectangle()
                                        .foregroundStyle(Colors.greenCustom.swiftUIColor)
                                        .frame(width: 126,
                                               height: 63)
                                        .cornerRadius(30, corners: [.topLeft, .bottomLeft])
                                        .overlay {
                                            HStack {
                                                Image(systemName: "arrow.right")
                                                    .foregroundStyle(.white)
                                                    .font(Fonts.KulimPark.regular.swiftUIFont(size: 40))
                                                    .padding()
                                                Spacer()
                                            }
                                        }
                                }

                            }
                            
                            Spacer()
                        }
                    }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            viewModel.isAnimatingImageOpacity = true
        }
    }
}

#Preview {
    OnboardingView(item: .second, currentPageIndex: .constant(1))
}
