//
//  HomeViewModel.swift

import Foundation

extension HomeView {
    final class HomeViewModel: ObservableObject {
        @Published var plainList = DefaultsService.plainList
        @Published var showCreatePlain = false
        
        func getPlainList() {
            plainList = DefaultsService.plainList
        }
    }
}

extension HomeView {
    enum Models {}
}

extension HomeView.Models {
    struct PlainModel: Codable, Identifiable {
        private(set) var id = UUID().uuidString
        private(set) var date = Date()
        var name: String
        var budget: Double
        var period: Int
        var rentType: PlainRentType?
    }
    
    enum PlainRentType: String, Codable {
        case rented
        case unrented
    }
}
