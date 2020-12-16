//
//  ScrollViews.swift
//  SwiftUI-Lessons
//
//  Created by Samuel Folledo on 12/16/20.
//

import SwiftUI

struct ScrollViews: View {
    
    struct Book: Identifiable {
      var id = UUID()
      var title: String
      var imageName: String
    }
    
    let demoBooks = [
        Book(title: "Swift UI", imageName: "SwiftUI"),
        Book(title: "RxSwift: Reactive Programming with Swift", imageName: "RxSwift"),
        Book(title: "Server Side Swift", imageName: "Vapor"),
        Book(title: "ARKit by Tutorials", imageName: "ARKit"),
        Book(title: "Metal by Tutorials", imageName: "Metal")
    ]
    
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
                            // In the demo we type:
                            // .frame(width: min(proxy.size.width + proxy.frame(in: .global).midX,
                            // However you should substitute the `min` for a `max` and the `+` for `-`
                            // Like so 😻
                            .frame(width: max(proxy.size.width - proxy.frame(in: .global).midX, proxy.size.width),
                                   height: proxy.size.height - 50)
                            
                            
                            .background(Image(book.imageName)
                                            .resizable()
                                            .scaledToFill()
                                            .overlay(Color.rayWenderlichGreen)
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
            /// On the lecture we use this modifier - it is no longer required
            //      .layoutPriority(1)
        }
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ScrollViews_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViews()
    }
}
