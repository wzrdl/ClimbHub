import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var currentUser: User?
    @Published var errorMessage: String?
    
    func signIn(email: String, password: String) {
        // TODO: Implement actual authentication logic
        // For MVP, we'll simulate a successful login
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isAuthenticated = true
            self.currentUser = User(
                id: UUID().uuidString,
                email: email,
                nickname: "Climber",
                height: 170,
                armSpan: 175,
                weight: 70,
                boulderGrade: .v4,
                sportGrade: .fiveTenA
            )
        }
    }
    
    func signUp(email: String, password: String) {
        // TODO: Implement actual registration logic
        // For MVP, we'll simulate a successful registration
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.isAuthenticated = true
            self.currentUser = User(
                id: UUID().uuidString,
                email: email,
                nickname: "New Climber",
                height: 170,
                armSpan: 175,
                weight: 70,
                boulderGrade: .v0,
                sportGrade: .fiveNine
            )
        }
    }
    
    func signOut() {
        isAuthenticated = false
        currentUser = nil
    }
} 