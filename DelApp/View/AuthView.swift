//
//  Auth.swift
//  DelApp
//
//  Created by Maxim Makarenkov on 07.05.2024.
//

import SwiftUI

struct AuthView: View {
    @ObservedObject var authModel = AuthModel()
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                SecureField("Пароль", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                Button {
                    authModel.signIn(email: email, password: password) { error in
                        if let error = error {
                            print("Sign in failed: \(error.localizedDescription)")
                        }
                    }
                } label: {
                    Text("Войти")
                        .bold()
                    .frame(width: 200, height: 40)
                    .background {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                    }
                    .foregroundColor(.white)
                }
                .padding()
                NavigationLink(destination: SignUpView()) {
                    Text("Создать аккаунт")
                }

            }
            .padding()
            .navigationTitle("Вход")
        }
        .onAppear {
        authModel.listenToAuthState()
        }
    }
}

#Preview {
    AuthView()
}
