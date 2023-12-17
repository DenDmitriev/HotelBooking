//
//  TextFieldContainer.swift
//  HotelBooking
//
//  Created by Denis Dmitriev on 16.12.2023.
//

import SwiftUI

struct TextFieldContainer: UIViewRepresentable {
    private var placeholder : String
    private var text : Binding<String>
    private var isValidate : Binding<Bool?>
    
    init(_ placeholder: String, text: Binding<String>, isValidate: Binding<Bool?>) {
        self.placeholder = placeholder
        self.text = text
        self.isValidate = isValidate
    }
    
    func makeCoordinator() -> TextFieldContainer.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<TextFieldContainer>) -> UITextField {
        
        let innertTextField = UITextField(frame: .zero)
        innertTextField.placeholder = placeholder
        innertTextField.text = text.wrappedValue
        innertTextField.delegate = context.coordinator
        innertTextField.keyboardType = .numberPad
        
        context.coordinator.setup(innertTextField)
        
        return innertTextField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<TextFieldContainer>) {
        uiView.text = self.text.wrappedValue
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldContainer
        
        init(_ textFieldContainer: TextFieldContainer) {
            self.parent = textFieldContainer
        }
        
        func setup(_ textField:UITextField) {
            textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
//            textField.addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
            self.parent.text.wrappedValue = textField.text ?? ""
            
            let newPosition = textField.endOfDocument
            textField.selectedTextRange = textField.textRange(from: newPosition, to: newPosition)
            
            if parent.isValidate.wrappedValue != nil {
                checkValidation(text: textField.text)
            }
        }
        
        @objc func textFieldDidEndEditing(_ textField: UITextField) {
            checkValidation(text: textField.text)
        }
        
        /// Очистка поля ввода если остается только код страны
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let char = string.cString(using: String.Encoding.utf8) {
                let isBackSpace = strcmp(char, "\\b")
                if (isBackSpace == -92) && textField.text == "+7" {
                    parent.text.wrappedValue = ""
                }
            }
            return true
        }
        
        private func checkValidation(text: String?) {
            guard let text else {
                parent.isValidate.wrappedValue = nil
                return
            }
            
            parent.isValidate.wrappedValue = FilterPhone.format(phone: text).isPhone
        }
    }
}
