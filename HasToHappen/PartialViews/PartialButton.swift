//
//  PartialButton.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct PartialButton: View {
    let color: Color
    let textColor: Color
    let text: String
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                
                Text(text)
                    .foregroundColor(textColor)
                    .bold()
            }
        }
    }
}

#Preview {
    PartialButton(
        color: Color.green,
        textColor: Color.white,
        text: "Value"
    ) {
        // Action
    }
}
