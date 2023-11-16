//
//  ContentView.swift
//  PreeshShareTest2
//
//  Created by reed kuivila on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        guard let components = URLComponents(url: deepLinkURL, resolvingAgainstBaseURL: true),
              let queryItem = components.queryItems?.first(where: { $0.name == "share_url" })?.value,
              let shareURL = URL(string: queryItem) else { return }
           
       // Handle the url
       Text(shareURL)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
