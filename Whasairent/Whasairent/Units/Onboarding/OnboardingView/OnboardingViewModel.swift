//
//  OnboardingViewModel.swift
//  Goobeltoin
//
//  Created by Andrii Momot on 12.06.2024.
//

import Foundation

extension OnboardingView {
    final class OnboardingViewModel: ObservableObject {
        @Published var isAnimatingImageOpacity = false
        @Published var showPrivacyPolicy = false
        let privacyPolicyURL = URL(string: "https://tradifundint.info")
    }
    
    enum OnboardingItem: Int, CaseIterable {
        case first = 0
        case second
        case third
        
        var imageName: String {
            switch self {
            case .first:
                return Asset.plane1.name
            case .second:
                return Asset.plane2.name
            case .third:
                return Asset.plane3.name
            }
        }
        
        var text: String {
            switch self {
            case .first:
                return "Witamy w naszej aplikacji do zarządzania transportem lotniczym! Pomożemy Ci zmaksymalizować zysk z każdego lotu. Rozpocznij efektywne zarządzanie już dziś!"
            case .second:
                return "Twój idealny asystent wynajmu samolotów jest gotowy do pracy. Zoptymalizuj wydatki i zwiększ przychody."
            case .third:
                return "Zacznij efektywnie zarządzać swoimi samolotami z nami. Nasza aplikacja uprości wszystkie procesy leasingowe. Zapewnij sobie stały dochód z każdego lotu."
            }
        }
        
        var next: Self {
            switch self {
            case .first:
                return .second
            case .second, .third:
                return .third
            }
        }
        
        var elipsRotationDegrees: Double {
            switch self {
            case .first:
                return .zero
            case .second:
                return 120
            case .third:
                return -100
            }
        }
        
        var count: Int {
            OnboardingItem.allCases.count
        }
    }
}
