//
//  RepresentableTextField.swift
//  Kreamclone
//
//  Created by JIN on 7/20/25.
//

import SwiftUI

struct RepresentableTextField: UIViewRepresentable {
    @Binding var text: String
    let placeHolderString: String
    var onSubmit: (String) -> Void
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.attributedPlaceholder = NSAttributedString(string: placeHolderString, attributes: [
                  .font: UIFont.systemFont(ofSize: 14, weight: .regular),
                  .foregroundColor: UIColor(red: 189/255.0, green: 194/255.0, blue: 204/255.0, alpha: 1.0)
              ])
        
        textField.delegate = context.coordinator
        textField.addTarget(context.coordinator, action: #selector(Coordinator.textFieldDidChange(_:)), for: .editingChanged)
               return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
            uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: RepresentableTextField
        
        init(_ textField: RepresentableTextField) {
            self.parent = textField
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            parent.onSubmit(parent.text)
            parent.text = ""
            return true
        }
        
        @objc func textFieldDidChange(_ textField: UITextField) {
                  DispatchQueue.main.async {
                      self.parent.text = textField.text ?? ""
                  }
            }
        
    }
}
