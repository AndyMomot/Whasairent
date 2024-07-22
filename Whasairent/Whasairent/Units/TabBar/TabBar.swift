//
//  TabBar.swift

import SwiftUI

struct TabBar: View {
    @StateObject private var viewModel = TabBarViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            HomeView()
            .tag(TabBarSelectionView.home.rawValue)
            
            Text("Tab 2")
                .tag(TabBarSelectionView.editing.rawValue)
            
            Text("Tab 3")
                .tag(TabBarSelectionView.time.rawValue)
            
            Text("Settings")
                .tag(TabBarSelectionView.settings.rawValue)
        }
        .edgesIgnoringSafeArea(.bottom)
        .overlay {
            VStack {
                Spacer()
                TabBarCustomView(selectedItem: $viewModel.selection)
                    .frame(height: UIScreen.main.bounds.height * 0.12)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

#Preview {
    TabBar()
}
