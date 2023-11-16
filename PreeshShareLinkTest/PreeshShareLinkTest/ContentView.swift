//
//  ContentView.swift
//  PreeshShareLinkTest
//
//  Created by reed kuivila on 11/15/23.
//

import SwiftUI
import RegularShareExtension

struct ContentView: View {
    @ObservedObject var shareData: ShareData
    @State private var newItemText: String = ""

    var body: some View {
        VStack {
            Text("Received Text: \(shareData.receivedText)")
                .padding()

            TextField("Enter URL to Save", text: $newItemText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                shareData.saveItem(url: newItemText)
                newItemText = ""
            }) {
                Text("Save")
            }

            List(shareData.savedItems) { item in
                Text(item.url)
            }
        }
        .padding()
    }
}


@main
struct ShareExtension: App {
    @StateObject private var shareData = ShareData()

    var body: some Scene {
        WindowGroup {
            ContentView(receivedText: shareData.receivedText)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(shareData: ShareData)
    }
}
