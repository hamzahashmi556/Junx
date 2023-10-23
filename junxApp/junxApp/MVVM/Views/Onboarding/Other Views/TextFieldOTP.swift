//
//  TextFieldOTP.swift
//  junxApp
//
//  Created by Hamza Hashmi on 22/10/2023.
//

import SwiftUI

struct TextFieldOTP: View {
    
    @Binding var code: String
//    @FocusState var focusedTextField: Int?
    
    /// Text Field ID
//    @State var id: Int
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            if code.isEmpty {
                RoundedRectangle(cornerRadius: 10)
                    .stroke()
                    .foregroundStyle(Color(hexString: "0B818F"))
            }
            else {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(Color(hexString: "0B818F"))
            }
            
            Text(code)
                .multilineTextAlignment(.center)
                .frame(alignment: .center)
                .foregroundStyle(.white)
            
            /*
            TextField("", text: $code)
                .keyboardType(.numberPad)
                .textContentType(.oneTimeCode)
                .textInputAutocapitalization(.none)
                .multilineTextAlignment(.center)
                .autocorrectionDisabled(true)
                .frame(alignment: .center)
                .focused($focusedTextField, equals: id)
                .foregroundStyle(.white)
                .onChange(of: code, { oldValue, newValue in
                    // Handle auto-filling of OTP code into other fields
                    if newValue.count == 1 {
                        if id < 5 {
                            focusedTextField = id + 1
                        } else {
                            focusedTextField = nil
                        }
                    }
                })
             */
        }
        .frame(width: 60, height: 60)

    }
}

#Preview {
    TextFieldOTP(code: .constant("1"))
}
