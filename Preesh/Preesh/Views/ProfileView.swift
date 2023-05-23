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
    
    @State private var showImagePicker: Bool = false


    var body: some View {
            VStack {
                HStack {
                    Spacer()
                    VStack {
                        Spacer()
                        // Preesh Logo
                        Image("preeshLogo")
                            .resizable()
                            .frame(width: 135, height: 110, alignment: .center)
                            .clipShape(Rectangle())
                            .cornerRadius(50)
                            .shadow(radius: 20)
                            .padding(.top, -350)
                        
                        // User name
                        Text("Jordan Montour")
                            .font(.custom("times", size: 30)).bold()
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            .padding(.top, -240)
                        
                        
                        // User profile photo
                        Image("MontourProfile")
                            .resizable()
                            .frame(width: 180, height: 195)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150)
                            .padding(.top, -190)

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
                                            .padding(.bottom)
                                    }
//                                    Image(systemName: "pencil.circle.fill")
//                                        .symbolRenderingMode(.multicolor)
//                                        .font(.system(size: 40))
//                                        .foregroundColor(.blue)
//                                        .padding(.bottom)
                                }
                            }

                        // User info
                        HStack {
                            Image(systemName: "birthday.cake")
                            Text("November 1, 1993")
                                .font(.custom("times", size: 20)).bold()
                            
                        }
                        .foregroundColor(.white)
                        
                        Spacer()
                        HStack(alignment: .top) {
                            Image(systemName: "birthday.cake")
                                .font(.system(size: 40))
                                .padding(.trailing, 100)

                            
                            Image(systemName: "gift")
                                .font(.system(size: 40))

                        }
                        .padding(.top, -370)


                        
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ImagePicker(sourceType: .photoLibrary) { image in
                            imageData.addEntry(image: image)
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .ignoresSafeArea()
                .background(CustomColor.preeshBlue)
            }
   
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(ImageData())
    }
}
