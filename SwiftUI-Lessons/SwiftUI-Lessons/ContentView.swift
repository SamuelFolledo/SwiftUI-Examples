//
//  ContentView.swift
//  SwiftUI-Lessons
//
//  Created by Samuel Folledo on 11/30/20.
//

import SwiftUI

struct ContentView: View {
    
    let pets = ["Doggie", "Cathy", "Tweetie", "Bobina", "Feeshy"]
    
    var body: some View {
        List {
            ForEach(pets, id: \.self) {
                Text($0)
            }
            Text("Hello, world!")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
