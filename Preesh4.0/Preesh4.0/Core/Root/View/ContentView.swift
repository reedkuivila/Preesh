//
//  ContentView.swift
//  Preesh4.0
//
//  Created by reed kuivila on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                PreeshTabView()
            } else {
                LoginView()
            }
        }
     
    }
}

#Preview {
    ContentView()
}
