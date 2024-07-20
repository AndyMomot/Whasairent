//
//  PrivacyPolicyViewModel.swift
//  Whasairent
//
//  Created by Andrii Momot on 20.07.2024.
//

import Foundation

extension PrivacyPolicyView {
    final class PrivacyPolicyViewModel: ObservableObject {
        @Published var showPrivacyPolicy = false
        let privacyPolicyURL = URL(string: "https://google.com")
    }
}
