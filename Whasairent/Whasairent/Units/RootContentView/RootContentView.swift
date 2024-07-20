//
//  RootContentView.swift
//  Whasairent
//
//  Created by Andrii Momot on 20.07.2024.
//

import SwiftUI

struct RootContentView: View {
    @StateObject private var viewModel = RootContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.showPreloader {
                Text("PreloaderView")
            } else {
                switch viewModel.viewState {
                case .onboarding:
                    Text("OnboardingViewTabView")
                        .environmentObject(viewModel)
                case .privacyPolicy:
                    Text("PrivacyPolicy")
                        .environmentObject(viewModel)
                case .main:
                    Text("TabBar")
                        .environmentObject(viewModel)
                }
            }
        }
        .onAppear {
            withAnimation {
                self.viewModel.getFlow()
            }
        }
    }
}

#Preview {
    RootContentView()
}
