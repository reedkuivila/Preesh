//
//  ProfileImage.swift
//  Preesh
//
//  Created by reed kuivila on 5/22/23.
//
//
//import SwiftUI
//import PhotosUI
//
//struct ProfileImage: View {
//    let imageState: ProfileModel.ImageState
//    
//    var body: some View {
//        switch imageState {
//        case .success(let image):
//            image.resizable()
//        case .loading:
//            ProgressView()
//        case .empty:
//            // MARK: make sure to change this to be a default!!!!!
//            Image("MontourProfile")
//                .font(.system(size: 40))
//                .foregroundColor(.white)
//        case .failure:
//            Image(systemName: "exclamationmark.triangle.fill")
//                .font(.system(size: 40))
//                .foregroundColor(.white)
//        }
//    }
//}
//
//struct CircularProfileImage: View {
//    let imageState: ProfileModel.ImageState
//    
//    var body: some View {
//        ProfileImage(imageState: imageState)
//        Image("MontourProfile")
//            .resizable()
//            .frame(width: 180, height: 195)
//            .clipShape(Circle())
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 150, height: 150)
//            .padding(.top, -190)
//    }
//}
//
//struct EditableCircularProfileImage: View {
//    @ObservedObject var viewModel: ProfileModel
//    
//    var body: some View {
//        Image("MontourProfile")
//            .resizable()
//            .frame(width: 180, height: 195)
//            .clipShape(Circle())
//            .aspectRatio(contentMode: .fit)
//            .frame(width: 150, height: 150)
//            .padding(.top, -190)
//
//            .overlay(alignment: .bottomTrailing) {
//                PhotosPicker(selection: $viewModel.imageSelection,
//                             matching: .images,
//                             photoLibrary: .shared()) {
//                    Image(systemName: "pencil.circle.fill")
//                        .symbolRenderingMode(.multicolor)
//                        .font(.system(size: 30))
//                        .foregroundColor(.accentColor)
//                }
//                .buttonStyle(.borderless)
//            }
//    }
//}
