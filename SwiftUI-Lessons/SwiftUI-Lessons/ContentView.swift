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
        List { //UITableView
            ForEach(pets, id: \.self) {
                Text($0)
            }
        }
        
        ScrollView { //UIScrollView
            HStack {
                ForEach(pets, id: \.self) {
                    Text($0)
                        .bold()
                        .strikethrough()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}
