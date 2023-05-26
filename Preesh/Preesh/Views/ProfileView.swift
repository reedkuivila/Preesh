//
//  ProfileView.swift
//  Preesh
//
//  Created by reed kuivila on 5/18/23.
//


import UIKit
import SwiftUI
import PhotosUI

struct ProfileView: View {
    @StateObject var imageData = ImageData()
    @StateObject var viewModel = ProfileModel()
    @ObservedObject var datas = ReadData()
    
    @State private var showImagePicker: Bool = false
    @State private var selectedFilter: ItemFilterViewModel = .bday
    @State private var showSettings = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    //                        // Preesh Logo
                    Image("preeshHorizontal")
                        .resizable()
                        .frame(width: 105, height: 60, alignment: .center)
                        .clipShape(Rectangle())
                        .cornerRadius(30)
                        .shadow(radius: 20)
                        .padding(.top, -300)
                    
                    // User name
                    Text("Jordan Montour")
                        .font(.custom("times", size: 30)).bold()
                        .foregroundColor(.white)
                        .shadow(radius: 10)
                        .padding(.top, -240)
                    
                    
                    // User profile photo
                    Image("MontourProfile")
                        .resizable()
                        .frame(width: 160, height: 175)
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .padding(.top, -200)
                    
                    // Edit profile image
                        .overlay(alignment: .bottomTrailing) {
                            PhotosPicker(selection: $viewModel.imageSelection,
                                         matching: .images,
                                         photoLibrary: .shared()) {
                                Button {
                                    showImagePicker.toggle()
                                } label: {
                                    Label("", systemImage: "pencil.circle.fill")
                                        .symbolRenderingMode(.multicolor)
                                        .font(.system(size: 40))
                                        .foregroundColor(.blue)
                                        .padding(.bottom, 30)
                                }
                            }
                        }
                    
                    // User info
                    HStack {
                        Image(systemName: "birthday.cake")
                        Text("November 1, 1993")
                            .font(.custom("times", size: 20)).bold()
                        
                    }
                    .padding(.top, -30)
                    .foregroundColor(.white)
                    
                    // select user list
                    
                    HStack {
                        ForEach(ItemFilterViewModel.allCases, id: \.rawValue) { item in
                            VStack {
                                Text(item.title)
                                    .font(.custom("times", size: 20))
                                    .fontWeight(selectedFilter == item ? .semibold : .regular)
                                    .opacity(selectedFilter == item ? 0.9 : 0.5)
                                
                                if selectedFilter == item {
                                    Capsule()
                                        .foregroundColor(Color(.gray).opacity(0.5))
                                        .frame(height: 3)
                                } else {
                                    Capsule()
                                        .foregroundColor(Color(.clear))
                                        .frame(height: 3)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    self.selectedFilter = item
                                }
                            }
                        }
                    }
                    .overlay(Divider().offset(x: 0, y: 16))
                    .foregroundColor(.white)
                    
                }
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(sourceType: .photoLibrary) { image in
                        imageData.addEntry(image: image)
                        
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(CustomColor.preeshBlue)
            
            // show items foor each list
            ScrollView {
                LazyVStack {
                    ForEach(datas.products) { product in
                        SearchRowView(product: product)
                    }
                }
            }
            .overlay(
                HStack {
                    Spacer()
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 24))
                            .foregroundColor(CustomColor.preeshBlue)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                    .padding(.top, -600)
                    .fullScreenCover(isPresented: $showSettings) {
                        SettingsView()
                    }
                }
            )
        }
    }
    
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ImageData())
    }
}



