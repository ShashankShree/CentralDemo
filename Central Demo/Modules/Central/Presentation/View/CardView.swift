//
//  CardView.swift
//  Central Demo
//
//  Created by Shashank Shree on 08/10/23.
//

import SwiftUI

struct CardView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            AsyncImage(
                url: URL(string: product.imageURL?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    Image("nopreview")
                        .resizable()
                }
            )
            VStack(alignment: .leading, spacing: 2) {
                Text(product.brandName ?? "").bold()
                    .font(.title3)
                    .padding(.leading, 8)
                Text(product.name ?? "")
                    .lineLimit(1)
                    .font(.title3)
                    .padding(.leading, 8)
                Text(product.promotion ?? " ")
                    .font(.title3)
                    .padding(.leading, 8)
                    .foregroundColor(.blue)
            }
            
            HStack(spacing: 0) {
                if (product.discountPercentage ?? 0.0) > 0.0 {
                    Text( "B" + (product.discountPrice ?? ""))
                        .font(.title3)
                    
                    Text(" B" + (product.price?.stringValue ?? ""))
                        .font(.title3)
                        .foregroundColor(.gray)
                        .strikethrough()
                } else {
                    Text( "B" + (product.price?.stringValue ?? ""))
                        .font(.title3)
                }
            }.padding(8)
            
            HStack(spacing: 0){
                if (product.colorCodes ?? []).count > 0 {
                    ForEach(Array((product.colorCodes ?? []).enumerated()), id: \.offset) { index, color in
                        if index <= 3 {
                            Circle()
                                .strokeBorder(Color(hex: "#F0F0F0"), lineWidth: 1)
                                .background(Circle().fill(color))
                                .frame(width: 16, height: 15)
                        } else if index == 4 {
                            Text( "+" + String((product.colorCodes ?? []).count - 4) + " more")
                        }
                    }
                } else {
                    Text("")
                }
            }.padding(8)
        }
    }
}
