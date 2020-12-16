//
//  TableViews.swift
//  SwiftUI-Lessons
//
//  Created by Samuel Folledo on 12/16/20.
//

import SwiftUI

struct TableViews: View {
    
    @State private var selectedSnackIndex = 0
    @State private var isOn = false
    @State private var textValue = ""
    
    let treats = ["Fish Cakes", "Mice Cream", "Croissant", "Pancakes"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $selectedSnackIndex, label: Text("Snack Type"), content: {
                        ForEach (0 ..< treats.count) {
                            Text(self.treats[$0]).tag($0)
                        }
                    })
                }
                
                Section {
                    Toggle(isOn: $isOn, label: {
                        Text("Would you like extra Milk with the order?")
                    })
                    
                    if isOn {
                        Text("Milk will cost an extra $0.99")
                            .foregroundColor(.gray)
                            .font(Font.system(size: 12))
                    }
                }
                
                Section {
                    let placeHolderText = "Special Requests"
                    TextField(placeHolderText, text: $textValue)
                }
                
                Section {
                    Button(action: {
                        print("Snack type = \(treats[selectedSnackIndex])\n with instructions: \(textValue)")
                    }) {
                        HStack {
                            Image(systemName: "paperplane")
                                .foregroundColor(.blue)
                            Text("Place Order")
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Order Kitty Snacks"))
        }
    }
}

struct TableViews_Previews: PreviewProvider {
    static var previews: some View {
        TableViews()
            .previewDevice("iPhone 8")
    }
}
