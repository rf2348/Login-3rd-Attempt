//
//  ContentView.swift
//  Login 3rd Attempt
//
//  Created by Robbie Forrey on 2/20/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @AppStorage("log_status") var log_Status = false
    var body: some View {
       
        ZStack{
            if log_Status{
                Home()
            }
            else{
                Login()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
