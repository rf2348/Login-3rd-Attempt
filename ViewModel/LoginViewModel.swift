//
//  LoginViewModel.swift
//  Login 3rd Attempt
//
//  Created by Robbie Forrey on 2/20/21.
//

import SwiftUI
//nedded cryptokit...
import CryptoKit
import AuthenticationServices
//firebase...
import Firebase

class LoginViewModel: ObservableObject{
    
    @Published var nonce = ""
    @AppStorage("log_status") var log_Status = false
    
    func authenticate(credential: ASAuthorizationAppleIDCredential){
        
        
        //getting Taken...
        guard let token = credential.identityToken else{
            print("error with firebase")
            
            return
        }
        //Token String...
        guard let tokenString = String(data: token, encoding: .utf8) else{
            print("error with Token")
            return
        }
        let firebaseCredential = OAuthProvider.credential(withProviderID: "https://console.firebase.google.com/u/0/project/login3rdattempt/settings/general/ios:Apple--Inc..Login-3rd-Attempt", idToken: tokenString,rawNonce: nonce)
        
        Auth.auth().signIn(with: firebaseCredential){(result, err) in
            
            if let error = err{
                print(error.localizedDescription)
                return
            }
            
            //user successfully logged in with firebase
            print("Logged In Successfully")
            //directing user to home page...
            withAnimation(.easeInOut){
                self.log_Status = true
            }
        }
    }
}

//helpers for Apple Login with Firebase...

 func sha256(_ input: String) -> String {
  let inputData = Data(input.utf8)
  let hashedData = SHA256.hash(data: inputData)
  let hashString = hashedData.compactMap {
    return String(format: "%02x", $0)
  }.joined()

  return hashString
}

 func randomNonceString(length: Int = 32) -> String {
  precondition(length > 0)
  let charset: Array<Character> =
      Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
  var result = ""
  var remainingLength = length

  while remainingLength > 0 {
    let randoms: [UInt8] = (0 ..< 16).map { _ in
      var random: UInt8 = 0
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
      if errorCode != errSecSuccess {
        fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
      }
      return random
    }

    randoms.forEach { random in
      if remainingLength == 0 {
        return
      }

      if random < charset.count {
        result.append(charset[Int(random)])
        remainingLength -= 1
      }
    }
  }

  return result
}
