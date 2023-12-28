//
//  PartialHeaderView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct PartialHeaderView: View {
    let title: String
    let subtitle: String
    let rotationAngle: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(.appHeaderBackground)
                .rotationEffect(Angle(degrees: rotationAngle))
            
            VStack {
                Text(title)
                    .font(.system(size: 52))
                    .foregroundColor(.appText)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 32))
                    .foregroundColor(.appText)
                    .bold()
            }
            .padding(.top, 250)
        }
        .frame(
            width: UIScreen.main.bounds.width * 3,
            height: 230
        )
        .offset(y: -130)
    }
}

#Preview {
    PartialHeaderView(title: "Has to happen", subtitle: "Your simple to-do list", rotationAngle: -15)
}
