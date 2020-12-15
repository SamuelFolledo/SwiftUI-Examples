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
        NavigationView {
            List () { //UITableView
                ForEach(pets, id: \.self) { pet in
                    NavigationLink(destination: ContentDetailView(name: pet)) {
                        Text(pet)
                    }
                }
            }
        }
//        ScrollView { //UIScrollView
//            HStack {
//                ForEach(pets, id: \.self) {
//                    Text($0)
//                        .bold()
//                        .strikethrough()
//                }
//            }
//        }
//
//        VStack {
//            Text("Love Yourz")
//                .bold()
//            Text("It's beauty in the struggle, ugliness in the success\nHear my words or listen to my signal of distressI grew up in the city and though some times we had less\nCompared to some of my n---as down the block, man, we were blessed.")
//                //                .lineLimit(2)
//                .minimumScaleFactor(8)
//                .multilineTextAlignment(.center)
//                .truncationMode(.middle)
//                .foregroundColor(.red)
//                .padding()
//                .background(Color.gray)
//                .border(Color.black, width: 3)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 8")
                .environment(\.sizeCategory, .accessibilityExtraExtraLarge) //preview in zoomed mode
                .environment(\.colorScheme, .dark) //preview in dark mode
            ContentDetailView(name: "")
                .previewDevice("iPhone 8")
                .environment(\.sizeCategory, .accessibilityExtraExtraLarge)
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ContentDetailView : View {
    var name: String!
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Restaurant: \(name). In this restaurant, we like to serve well")
                    .font(Font.system(.title, design: .rounded))
                    .foregroundColor(.primary) //black and white when dark mode
                    .truncationMode(.middle)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(Color.gray)
                    .border(Color.black, width: 3)
            }
            .navigationBarTitle("\(name) Details")
            .navigationBarHidden(false)
        }
    }
}
