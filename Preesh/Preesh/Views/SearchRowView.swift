//
//  SearchRowView.swift
//  Preesh
//
//  Created by reed kuivila on 5/25/23.
//


import SwiftUI

struct SearchRowView: View {
    var product: Product
    
    @State private var isCakeButtonTapped = false
    @State private var isBookmarkButtonTapped = false
    @State private var isShareButtonTapped = false
    
    @State private var birthdayList: [Product] = []
    @State private var bookmarksList: [Product] = []
    
    private let birthdayListKey = "BirthdayList"
    private let bookmarksListKey = "BookmarksList"
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 12) {
                // should be item image
                AsyncImage(url: URL(string: product.imageURL)) { image in
                    image
                        .resizable()
                        .frame(width: 75, height: 110)
                        .foregroundColor(CustomColor.preeshBlue)
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "questionmark.app")
                        .resizable()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                        .foregroundColor(CustomColor.preeshBlue)
                        .aspectRatio(contentMode: .fit)
                }
                // user name & info
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("\(product.productName)")
                            .font(.subheadline)
                            .bold()
                    }
                }
            }
            
            // user actions to bookmark items
            HStack {
                Spacer()
                Button {
                    // add item to birthday list
                    addToBirthdayList()
                } label: {
                    Image(systemName: isCakeButtonTapped ? "birthday.cake.fill" : "birthday.cake")
                }
                
                Spacer()
                Button {
                    // add item to bookmarks
                    addToBookmarkList()
                } label: {
                    Image(systemName: isBookmarkButtonTapped ? "bookmark.fill" : "bookmark")
                }
                
                Spacer()
                Button {
                    // share item
                    isShareButtonTapped.toggle()
                } label: {
                    Image(systemName: isShareButtonTapped ? "square.and.arrow.up.fill" : "square.and.arrow.up")
                }
                
                Spacer()
            }
            
            Divider()
        }
        .padding()
        .onAppear {
            loadBirthdayList()
            loadBookmarksList()
        }
    }
    
    private func addToBirthdayList() {
        isCakeButtonTapped.toggle()
        
        if isCakeButtonTapped {
            birthdayList.append(product)
        } else {
            birthdayList.removeAll { $0.id == product.id }
        }
        
        saveBirthdayList()
    }
    
    private func addToBookmarkList() {
        isBookmarkButtonTapped.toggle()
        
        if isBookmarkButtonTapped {
            bookmarksList.append(product)
        } else {
            bookmarksList.removeAll { $0.id == product.id }
        }
        
        saveBookmarksList()
    }
    
    private func saveBirthdayList() {
        let encodedData = try? JSONEncoder().encode(birthdayList)
        UserDefaults.standard.set(encodedData, forKey: birthdayListKey)
    }
    
    private func saveBookmarksList() {
        let encodedData = try? JSONEncoder().encode(bookmarksList)
        UserDefaults.standard.set(encodedData, forKey: bookmarksListKey)
    }
    
    private func loadBirthdayList() {
        if let encodedData = UserDefaults.standard.data(forKey: birthdayListKey),
           let decodedData = try? JSONDecoder().decode([Product].self, from: encodedData) {
            birthdayList = decodedData
            isCakeButtonTapped = birthdayList.contains { $0.id == product.id }
        }
    }
    
    private func loadBookmarksList() {
        if let encodedData = UserDefaults.standard.data(forKey: bookmarksListKey),
           let decodedData = try? JSONDecoder().decode([Product].self, from: encodedData) {
            bookmarksList = decodedData
            isBookmarkButtonTapped = bookmarksList.contains { $0.id == product.id }
        }
    }
}


struct SearchRowView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRowView(product: Product(id: UUID(), productName: "Example Product", imageURL: "https://example.com/image.jpg"))
    }
}

