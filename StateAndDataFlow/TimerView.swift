//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    @StateObject private var timer = TimeCounter()
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.username)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(title: timer.buttonTitle, color: .red) {
                timer.startTimer()
            }
            
            Spacer()
            
            ButtonView(title: "LogOut", color: .blue) {
                userManager.logout()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

struct ButtonView: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20).stroke(.black, lineWidth: 4))
    }
}
