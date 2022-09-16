//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.isRegistered {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
    }
}
