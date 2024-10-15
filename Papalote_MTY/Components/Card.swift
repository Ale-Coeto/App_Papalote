//
//  Card.swift
//  Papalote_MTY
//
//  Created by Alejandra Coeto on 15/10/24.
//

import SwiftUI

struct Card: View {
    var title: String
    var content: String
    
    var body: some View {
             
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.white)
                .shadow(radius: 5)
            
            VStack {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("Text"))
                
                Text(content)
                    .foregroundStyle(Color("Text"))
                
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    Card(title: "Title", content: "Content")
}
