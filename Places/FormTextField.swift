//
//  FormTextField.swift
//  Places
//
//  Created by henry on 3/24/26.
//

import SwiftUI

struct FormTextField: View {
    @Binding var value: String
    @Binding var errorString: String?

    var labelText: String
    var hintText: String
    var body: some View {
        VStack(alignment: .leading){
            LabeledContent {
                TextField(hintText, text: $value)
                    .keyboardType(.decimalPad)
            } label: {
              Text(labelText)
            }
            if let errorString {
                Text(errorString)
            }
        }
    }
}
