//
//  NFCUnblockView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 05/11/24.
//

import SwiftUI

struct NFCUnblockView: View {
    var body: some View {
        ZStack{
            Color.AppColors.FondoAzulClaro
                .ignoresSafeArea()
            VStack{
                Text("Desbloqueemos la aplicación")
                    .font(Font.custom("VagRoundedBold", size: 30))
                    .foregroundStyle(Color.AppColors.AzulPapalote)
                    .padding()
                    .padding(.top, 35)
                Spacer()
                if let filePath = Bundle.main.path(forResource: "LogoPapaloteVerde", ofType: "png"),
                   let uiImage = UIImage(contentsOfFile: filePath) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                }
                Spacer()
                Spacer()
            }
            
        }
    }
}

#Preview {
    NFCUnblockView()
}
