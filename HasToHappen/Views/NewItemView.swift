//
//  NewItemView.swift
//  HasToHappen
//
//  Created by Geert-Jan Knapen on 27/12/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var vm = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("Create a happening")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 50)
            
            Form {
                TextField("Happening title", text: $vm.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    .foregroundColor(.appText)
                
                DatePicker("Due date", selection: $vm.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .foregroundColor(.appText)
                
                PartialButton(color: .green, textColor: .white, text: "Save happening") {
                    if (vm.canSave) {
                        vm.save()
                        newItemPresented = false
                    } else {
                        vm.showAlert = true
                    }
                }
                .padding(10)
            }
            .alert(isPresented: $vm.showAlert) {
                Alert(title: Text("Something went wrong."),
                      message: Text("Make sure to fill all fields and select a date after today."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
