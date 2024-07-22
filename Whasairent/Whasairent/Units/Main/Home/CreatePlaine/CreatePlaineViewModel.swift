//
//  CreatePlainViewModel.swift
//  Whasairent
//
//  Created by Andrii Momot on 22.07.2024.
//

import Foundation
import UIKit

extension CreatePlainView {
    final class CreatePlainViewModel: ObservableObject {
        @Published var selectedImage = Asset.empty.image
        @Published var showImagePicker = false
        
        @Published var name = ""
        @Published var budget = ""
        @Published var period = ""
        
        private var isValidFields: Bool {
            let isValidImage = selectedImage != Asset.empty.image
            return isValidImage && !name.isEmpty && !budget.isEmpty && !period.isEmpty
        }
        
        func addPlaine(completion: () -> Void) {
            guard isValidFields else { return }
            let model = HomeView.Models.PlainModel(
                name: name,
                budget: Double(budget) ?? .zero,
                period: Int(period) ?? .zero
            )
            
            DefaultsService.addPlain(model)
            
            if let data = selectedImage.pngData() {
                let path = model.id
                FileManagerService().saveFile(data: data, forPath: path)
            }
            
            completion()
        }
    }
}
