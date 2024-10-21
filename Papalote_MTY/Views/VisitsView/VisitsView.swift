//
//  VisitsView.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 21/10/24.
//

import SwiftUI

struct VisitsView: View {
    var body: some View {
        
        ZStack {
            Color.AppColors.FondoAzulClaro
            VStack{
                Text("Mis Visitas")
                    .font(Font.custom("VagRoundedBold", size: 32))
                    .foregroundStyle(Color.AppColors.AzulPapalote)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    VisitsView()
}
