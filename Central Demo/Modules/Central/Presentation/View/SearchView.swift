//
//  SearchView.swift
//  Central Demo
//
//  Created by Shashank Shree on 08/10/23.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    @State private var isEditing = false
    @State private var imageName = "search"
    
    var body: some View {
        HStack {
            TextField("Search", text: $text).padding(5)
                .frame(height: 29)
                .foregroundColor(.black)
                .background(Color(.white))
                .cornerRadius(5)
                .overlay(
                    HStack {
                        Image(imageName)
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 8)
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .padding(10)
                .onTapGesture {
                    self.imageName = ""
                    self.isEditing = true
                }
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.text = ""
                    self.imageName = "search"
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 49)
        .background(Color(red: 239/255, green: 245/255, blue: 249/255))
    }
}
