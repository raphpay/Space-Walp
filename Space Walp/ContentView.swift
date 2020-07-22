//
//  ContentView.swift
//  Space Walp
//
//  Created by Raphaël Payet on 11/07/2020.
//  Copyright © 2020 Oriapy. All rights reserved.
//

import SwiftUI

let spacePurple = Color(red: 0.322, green: 0.212, blue: 0.443, opacity: 1.000)
let spaceBlue = Color(red: 0.388, green: 0.871, blue: 1.000, opacity: 1.000)
let spaceRed = Color(red: 0.863, green: 0.439, blue: 0.424, opacity: 1.000)
let screen = UIScreen.main.bounds

struct ContentView: View {
    
    @State var showLogin = false
    
    var body: some View {
        ZStack {
            Image("astronaut")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .offset(x : -130)
                .animation(.easeInOut)
            
            VStack {
                Spacer()
                Image("space-walp")
                    .onTapGesture {
                        self.showLogin.toggle()
                }
                HStack {
                    Text("Create an account or ")
                        .foregroundColor(spaceBlue)
                    Text("Login")
                        .foregroundColor(.white)
                }.font(.system(.subheadline))
            }
            
            LoginView(showLogin: $showLogin)
            .offset(y : showLogin ? 0 : screen.width * 2)
                .animation(.easeInOut)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ButtonContent: View {
    
    var title           : String
    var titleColor      : Color = .white
    var backgroundColor  : Color = spacePurple
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke()
            
            Text(title)
                .foregroundColor(titleColor)
                .frame(width: screen.width * 2/3, height: 50)
                .background(backgroundColor)
                .cornerRadius(20)
        }.frame(width: screen.width * 2/3, height: 50)
    }
}

struct LoginView: View {
    
    @Binding var showLogin : Bool
    
    @State var viewState : CGSize = .zero
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.white)
                .frame(width: screen.width * 2, height: screen.width * 2)
                .offset(x : 50, y : screen.width)
                .shadow(radius: 20)
            .onTapGesture {
                self.showLogin.toggle()
            }
            .gesture(
                DragGesture()
                    .onChanged({ (value) in
                    self.viewState = value.translation
                })
                    .onEnded({ (value) in
                        if value.translation.height > 50 {
                            self.showLogin = false
                        }
                        
                        self.viewState = .zero
                    })
            )
            
            VStack(spacing : 25) {
                VStack {
                    Spacer()
                    HStack {
                        Text("Welcome to\nspace walp")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }.padding()
                    
                    Text("Get Space wallpaper for your mobile and computer with one click and free download")
                        .foregroundColor(Color.black.opacity(0.7))
                        .lineLimit(2)
                }.frame(width: screen.width - 20)
                    .padding()
                
                ButtonContent(title: "Log in")
                ButtonContent(title: "Create an account", titleColor: spacePurple, backgroundColor: .white)
                
                Text("I want to go as Guest")
                    .font(.subheadline)
                    .foregroundColor(spacePurple)
            }
        }
        .offset(y : viewState.height)
        .animation(.spring())
        
        
    }
}
