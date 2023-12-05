//
//  ContentViewModel.swift
//  OwnerSellerLoginFlow
//
//  Created by Urvashi Gupta on 04/12/23.
//

import Foundation
import Combine

@MainActor
class ContentViewModel:ObservableObject{
    @Published var userSession : User?
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        setUpSubscriber()
    }
    
  
    private func setUpSubscriber(){
        AuthService.shared.$userSession.sink { [weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellable)
    }
    
}
