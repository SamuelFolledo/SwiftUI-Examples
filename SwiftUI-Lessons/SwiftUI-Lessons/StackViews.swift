//
//  Stacks.swift
//  SwiftUI-Lessons
//
//  Created by Samuel Folledo on 12/15/20.
//

import SwiftUI

struct StackViews: View {
    
    var body: some View {
        
        ZStack {
            Spacer() //fills the entire page
                .layoutPriority(1) //to make sure it will take effect
            
            Circle()
                .fill(Color.purple)
                .frame(width: 170, height: 170)
                .padding()
                .shadow(radius: 10)
            
            VStack {
                Image("handsome")
                    .resizable()
                    .frame(width: 150, height: 150)
                
                Text("Regex for everyone")
                    .font(Font.system(.largeTitle, design: .rounded))
                    .fontWeight(.heavy)
                    .foregroundColor(.primary)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    .shadow(color: .gray, radius: 5, x: 5, y: 5)
            }
        }
        .background(Color.green)
        .edgesIgnoringSafeArea(.all) //ignore safe area
        
        
        VStack {
            Text("Sign Up your Cat for REgex for Cats!")
                .font(Font.system(.headline, design: .rounded))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                .padding([.top, .bottom])
            
            HStack {
                Image("hacker")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Button(action: {
                    print("Signed Up")
                }) {
                    HStack {
                        Text("Sign Up Today!")
                        Image(systemName: "checkmark.circle")
                    }
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white) //button's title color
                .shadow(radius: 5)
            }
        }
        
        VStack(alignment: .trailing, spacing: 20) {
            Text("Samuel Folledo")
            .font(Font.system(.largeTitle, design: .rounded))
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 5, x: 5, y: 5)
            .padding([.leading, .trailing])
            
            Image("SamuelFolledo-ProPic")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
                .padding()
        }
        .background(Color.purple)
    }
}

struct StackViews_Previews: PreviewProvider {
    static var previews: some View {
        StackViews()
            .previewDevice("iPhone 8")
    }
}
