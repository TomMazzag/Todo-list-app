//
//  TestView.swift
//  Todo-list-app
//
//  Created by Tom Mazzag on 12/02/2024.
//

import SwiftUI

struct TestView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var verifyPassword = ""

    var body: some View {
        VStack {
            Form {
                TextField("Enter your username", text: $username)
                TextField("Enter your email", text: $email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Enter your password", text: $password)
                SecureField("Verify Password", text: $verifyPassword)
                Button("Submit") {
                    print("Clicked")
                }
                Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                    TextField("Label", text: $email)
                })
            }
            Text("Hello, \(username)!")
        }
    }
}

#Preview {
    TestView()
}
