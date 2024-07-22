//
//  TabBarViewModel.swift

import Foundation

extension TabBar {
    final class TabBarViewModel: ObservableObject {
        @Published var selection = TabBarSelectionView.home.rawValue
    }
}

extension TabBar {
    enum TabBarSelectionView: Int {
        case home = 0
        case editing
        case time
        case settings
    }
    
    struct Item: Identifiable {
        private(set) var id = UUID()
        var imageName: String
    }
}
