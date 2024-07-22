//
//  CreatePlainView.swift
//  Whasairent
//
//  Created by Andrii Momot on 22.07.2024.
//

import SwiftUI

struct CreatePlainView: View {
    @StateObject private var viewModel = CreatePlainViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var onAdd: () -> Void
    
    var body: some View {
        ZStack {
            Asset.tabBackground.swiftUIImage
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 40) {
                    HStack {
                        Button {
                            dismiss.callAsFunction()
                        } label: {
                            Rectangle()
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .frame(width: 92, height: 46)
                                .cornerRadius(23, corners: [.topRight, .bottomRight])
                                .overlay {
                                    HStack {
                                        Spacer()
                                        
                                        Image(systemName: "arrow.left")
                                            .foregroundStyle(.white)
                                            .font(Fonts.KulimPark.regular.swiftUIFont(size: 25))
                                            .padding()
                                    }
                                }
                        }

                        
                        Spacer()
                    }
                    
                    Text("Dodajesz płytę powietrzną")
                        .foregroundStyle(Colors.blackCustom.swiftUIColor)
                        .font(Fonts.KulimPark.bold.swiftUIFont(size: 30))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Button {
                        viewModel.showImagePicker.toggle()
                    } label: {
                        ZStack {
                            Image(uiImage: viewModel.selectedImage)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 120)
                                .cornerRadius(13, corners: .allCorners)
                            
                            Asset.placeholder.swiftUIImage
                                .shadow(color: .white, radius: 10)
                        }
                    }
                    .padding(.horizontal)
                    
                    InputField(title: "Nazwa samolotu",
                               titleColor: Colors.blackCustom.swiftUIColor,
                               placeholder: "Wprowadź nazwę",
                               text: $viewModel.name)
                    .padding(.horizontal)
                    .onTapGesture {
                        hideKeyboard()
                    }
                    
                    InputField(title: "Budżet wynajmu",
                               titleColor: Colors.blackCustom.swiftUIColor,
                               placeholder: "Wprowadź Budżet wynajmu",
                               text: $viewModel.budget)
                    .keyboardType(.numberPad)
                    .padding(.horizontal)
                    .onTapGesture {
                        hideKeyboard()
                    }
                    
                    VStack(spacing: 38) {
                        HStack {
                            Text("Określić maksymalną liczbę dni, na jaką może być zatrudniony.")
                                .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                .font(Fonts.KulimPark.bold.swiftUIFont(size: 14))
                            
                            Spacer()
                            
                            RoundedRectangle(cornerRadius: 30)
                                .foregroundStyle(.white)
                                .frame(width: 100, height: 50)
                                .overlay {
                                    TextField(text: $viewModel.period) {
                                        Text("0")
                                            .foregroundStyle(.gray)
                                            .font(Fonts.KulimPark.extraLight.swiftUIFont(size: 14))
                                    }
                                    .foregroundStyle(Colors.blackCustom.swiftUIColor)
                                    .font(Fonts.KulimPark.bold.swiftUIFont(size: 20))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .onTapGesture {
                                        hideKeyboard()
                                    }
                                }
                        }
                        
                        Divider()
                            .background(.white)
                            .frame(height: 2)
                    
                        NextButton(title: "Dodaj") {
                            viewModel.addPlaine {
                                onAdd()
                                dismiss.callAsFunction()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(30)
                    .background(Colors.greenCustom.swiftUIColor)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
                }
            }
            .scrollIndicators(.never)
        }
        .navigationBarBackButtonHidden()
        .sheet(isPresented: $viewModel.showImagePicker) {
            ImagePicker(selectedImage: $viewModel.selectedImage)
        }
    }
}

#Preview {
    CreatePlainView {}
}
