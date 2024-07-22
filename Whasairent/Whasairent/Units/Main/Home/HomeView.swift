//
//  HomeView.swift

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Asset.tabBackground.swiftUIImage
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 37) {
                    HStack {
                        Text("Dodaj tablicę samolotu")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                        Spacer()
                    }
                    
                    Asset.plainsCountBG.swiftUIImage
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            VStack(spacing: 7) {
                                Text("Twój tablicę samolotu")
                                    .foregroundStyle(.white)
                                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                                
                                Text("+\(viewModel.plainList.count)")
                                    .foregroundStyle(.white)
                                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 20)
                                    .background(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(.white, lineWidth: 2)
                                    )
                            }
                        }
                    
                    HStack(spacing: 14) {
                        Text("Aby zmienić informacje o pokładzie lotu, przejdź do panelu ustawień!")
                            .foregroundStyle(Colors.blackCustom.swiftUIColor)
                            .font(Fonts.KulimPark.extraLight.swiftUIFont(fixedSize: 17))
                            .multilineTextAlignment(.trailing)
                        
                        Asset.tab2.swiftUIImage
                            .renderingMode(.template)
                            .foregroundStyle(.white)
                            .padding(10)
                            .background(Colors.blackCustom.swiftUIColor)
                            .cornerRadius(6, corners: .allCorners)
                        
                    }
                    
                    ScrollView(showsIndicators: false) {
                        
                        VStack(spacing: 23) {
                            
                            Button {
                                viewModel.showCreatePlain.toggle()
                            } label: {
                                Rectangle()
                                     .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                     .frame(height: 52)
                                     .cornerRadius(26, corners: [.bottomLeft, .bottomRight])
                                     .overlay {
                                         Image(systemName: "plus")
                                             .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                             .font(Fonts.KulimPark.bold.swiftUIFont(fixedSize: 20))
                                             .padding(3)
                                             .background(.white)
                                             .cornerRadius(8, corners: .allCorners)
                                     }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationDestination(isPresented: $viewModel.showCreatePlain) {
                CreatePlainView {
                    viewModel.getPlainList()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
