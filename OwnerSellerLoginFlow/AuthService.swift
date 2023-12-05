//
//  AuthService.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import Foundation
@MainActor
class AuthService{
    @Published var userSession : User?
    let defaults = UserDefaults.standard
    let urlServiceForloggingOut = URLService<LogoutData>()
    static let shared = AuthService()
    init() {
        if let data = UserDefaults.standard.data(forKey: "user") {
            do {
            
                let decoder = JSONDecoder()

                
                 userSession = try decoder.decode(User.self, from: data)

            } catch {
                print("Unable to Decode  (\(error))")
            }
        }
    
    }
    func logout() {
        urlServiceForloggingOut.handleURLRequestForLoggingOut(of: Constants.logoutUserURL,user: AuthService.shared.userSession ?? User()) { logoutData, error in
            if let error = error{
                print("DEBUG: Error in logging in: \(error)")
            }
            if let data = logoutData as? LogoutData{
                if data.message == "Success"{
              
                    self.defaults.removeObject(forKey: "user")
                    AuthService.shared.userSession = nil
                }
            }
        }
    }
    
}

