//
//  Home.swift
//  Login 3rd Attempt
//
//  Created by Robbie Forrey on 2/20/21.
//

import SwiftUI
import Firebase

struct Home: View{
    
    @AppStorage("log_status") var log_Status = false
    
    var body: some View{
        
        NavigationView{
            
            NavigationView{
                
                VStack(spacing: 20){
                    Text("Logged in Successfully Using Apple Login")
                    
                    Button(action: {
                        //Logging Out User...
                        DispatchQueue.global(qos:
                            .background).async{
                            
                                try? Auth.auth().signOut()
                            }
                        //Setting Back View to Login...
                        withAnimation(.easeInOut){
                            log_Status = false
                        }
                    }, label: {
                        
                        
                        Text("Log Out")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.vertical,12)
                            .frame(width: UIScreen.main.bounds.width / 2)
                            .background(Color.pink)
                            .clipShape(Capsule())
                        
                    })
                    .navigationTitle("Home")
                }
            }
        }
    }
    
    struct Home_Previews: PreviewProvider{
        static var previews: some View{
            Home()
        
    }
}
}
