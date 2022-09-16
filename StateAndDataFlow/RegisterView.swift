//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled()
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(name.count >= 3 ? .green : .red)
            }
            Button(action: registerUser) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(name.count < 3)
        }
        .padding()
    }
    
    private func registerUser() {
        if !name.isEmpty {
            userManager.signUp(with: name)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
