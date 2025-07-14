//
//  AuthViewModel.swift
//  Kreamclone
//
//  Created by JIN on 6/14/25.
//

import Foundation
import FirebaseAuth
import NidThirdPartyLogin

class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var usersession: FirebaseAuth.User?
    
    static let shared = AuthViewModel()

    var accessToken: AccessToken?
    
    init () {
        self.usersession = Auth.auth().currentUser
        fetchUser()
    }
    
    func naverLogin() {
        
        NidOAuth.shared.requestLogin { result in
          switch result {
          case .success(let loginResult):
            print("Access Token: ", loginResult.accessToken.tokenString)
          case .failure(let error):
            print("Error: ", error.localizedDescription)
          }
        }
    }
    

    func naverLogout() {
        NidOAuth.shared.logout()
    }
   
    func signUp(email: String, password: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                return
            }
            
            guard let user = authResult?.user else { return }
            
                let data = [
                    "email"  :email,
                    "username" : generateRandomUsername(),
                    "uid" : user.uid
                ]
                
                userRef.document(user.uid).setData(data)
            }
        }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
         if let error = error  {
                print(error.localizedDescription)
                return
         }
            
        guard let strongSelf = self else { return }
        guard let result = authResult else { return }
        strongSelf.usersession = result.user
        self?.fetchUser()
        }
     
    }
    
    func signOut() {
        do {
            self.usersession = nil
            try Auth.auth().signOut()
        } catch {
            print("Error signing out: \(error)")
        }
    }
    
    func fetchUser() {
        guard let uid = usersession?.uid else { return }
        userRef.document(uid).getDocument() { snapshot ,_ in
            guard let user = try? snapshot?.data(as: User.self) else { return }
            self.currentUser = user
        }
    }
}

