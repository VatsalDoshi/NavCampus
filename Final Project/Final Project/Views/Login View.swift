//
//  LoginView.swift
//  Final Project
//
//  Created by Vatsal Kapadia on 12/15/23.
//

import SwiftUI

struct LoginView: View {
//    @Binding var username: String
//    @Binding var password: String
    @State private var username: String = ""  // Local state variable for the username
    @State private var password: String = ""
    @Binding var isLoggedIn: Bool
    @State private var showAlert: Bool = false
    @State private var shouldNavigate: Bool = false
    
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
                        
                        
                        Button(action: {
                            print( "entered username:\(username)")
                            print( "entered username:\(password)")
                            print("InLoop")
                            if isValidLogin(corUsername: username, corPassword: password) {
                                print("true")
                                isLoggedIn = true
                                shouldNavigate = true  // Set shouldNavigate to true on successful login
                            } else {
                                showAlert = true
                                isLoggedIn = false
                                shouldNavigate = false
                                print("false")
                            }
                        }) {
                            Text("Login")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(20)
                    .padding()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Login Failed"), message: Text("Incorrect username or password"), dismissButton: .default(Text("OK")))
                }
                .background(
                    NavigationLink(
                        destination: WelcomeView(),
                        isActive: $shouldNavigate,
                        label: {
                            EmptyView()  // Use EmptyView as the label for the NavigationLink
                        }
                    )
                )
            }
        }
    }
        
       
    
    
    
    private func isValidLogin(corUsername: String, corPassword: String) -> Bool {
        let validUsername = "V"
        let validPassword = "1"
        return corUsername == validUsername && corPassword == validPassword
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}

