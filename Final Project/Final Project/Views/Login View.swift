//
//  LoginView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import SwiftUI

struct LoginView: View {
    @Binding var username: String
    @Binding var password: String
    @Binding var isLoggedIn: Bool
    @State private var isNavigationActive: Bool = false
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("BG1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                VStack{
                    VStack(spacing: 10) {
                        Image("NEUlOGO") // Add your image name
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                        
                        Text("Welcome\nWe'll Help You Navigate!")
                            .font(.headline)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        TextField("Username", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        SecureField("Password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        
                        NavigationLink(
                            destination: WelcomeView(),
                            isActive: $isNavigationActive,
                            label: {
                                Text("Login")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        )
//                        .isDetailLink(false)
                        .onTapGesture {
                            // Perform login authentication here
                            if isValidLogin(username: username, password: password) {
                                isLoggedIn = true
                                isNavigationActive = true
                            } else {
                                showAlert = true
                            }
                            
                        }
                        
                    }
                    
                }
                .padding()
                
                .background(Color.white.opacity(0.8)) // Add a semi-transparent white background
                .cornerRadius(20)
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Login Failed"), message: Text("Incorrect username or password"), dismissButton: .default(Text("OK")))}
                
            }
            
            .navigationBarHidden(true)
            
        }
    }
    
    
    
    // Example login validation function
    private func isValidLogin(username: String, password: String) -> Bool {
        let validUsername = "V"
        let validPassword = "1"
        return username == validUsername && password == validPassword
        //return true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: .constant(""), password: .constant(""), isLoggedIn: .constant(false))
    }
}


