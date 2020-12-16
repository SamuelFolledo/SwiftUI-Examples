//
//  ScrollViews.swift
//  SwiftUI-Lessons
//
//  Created by Samuel Folledo on 12/16/20.
//

import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var imageName: String
    
    static let demoBooks = [
        Book(title: "Swift UI", imageName: "SwiftUI"),
        Book(title: "RxSwift: Reactive Programming with Swift", imageName: "RxSwift"),
        Book(title: "Server Side Swift", imageName: "Vapor"),
        Book(title: "ARKit by Tutorials", imageName: "ARKit"),
        Book(title: "Metal by Tutorials", imageName: "Metal")
    ]
}

struct ScrollViews: View {
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Book.demoBooks) { book in
                        GeometryReader { proxy in
                            VStack {
                                Text(book.title)
                                    .fontWeight(.bold)
                                    .font(Font.system(.headline, design: .rounded))
                                    .minimumScaleFactor(0.75)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding([.leading, .top, .trailing])
                                
                                Image(book.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .shadow(color: .gray, radius: 20)
                            }
                            .frame(width: max(proxy.size.width - proxy.frame(in: .global).midX, proxy.size.width), height: proxy.size.height - 50)
                            .background(Image(book.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .overlay(Color.green)
                                            .blendMode(.multiply)
                                            .blur(radius: 1))
                            
                            
                            .cornerRadius(10)
                            .padding()
                            .shadow(radius: 3)
                            .layoutPriority(1)
                            .rotation3DEffect(Angle(degrees: Double(proxy.frame(in: .global).midX) / 40), axis: (x: -4, y: -3, z: -3))
                            
                            
                        }
                        .frame(width: 200, height: 300)
                    }
                }
            }
            Spacer()
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ScrollViews_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViews()
            .previewDevice("iPhone 8")
    }
}
