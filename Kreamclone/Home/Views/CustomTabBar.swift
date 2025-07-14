//
//  CustomTabBar.swift
//  Kreamclone
//
//  Created by JIN on 6/13/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: MainTab
    @EnvironmentObject var viewModel: AuthViewModel
    @State var showingSignUpSheet = false
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                
                VStack {
                    Image("house.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .padding(.top, 12)
                    Text("HOME")
                        .font(.caption2)
                        .offset(y: -9)
                }.padding(.leading)
                 .onTapGesture {
                        selectedTab = .home
                    }
                 
                Spacer()
                VStack {
                    Image("style.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFill()
                        .padding(.top, 12)
                    Text("STYLE")
                        .font(.caption2)
                        .offset(y: -14)
                }.onTapGesture {
                    selectedTab = .style
                }
                
                Spacer()
                
                VStack(alignment:.center) {
                    Image("shop")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .padding(.top, 12)
                    Text("SHOP")
                        .font(.caption2)
                        .offset(y: -9)
                }.onTapGesture {
                    selectedTab = .shop
                }
                
                Spacer()
                
                VStack {
                    Image("house.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .padding(.top, 12)
                    Text("SAVED")
                        .font(.caption2)
                        .offset(y: -9)
                }.onTapGesture {
                    selectedTab = .saved
                }
                
                Spacer()
                
                VStack {
                    Image("profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .scaledToFill()
                        .padding(.top, 12)
                    Text("MY")
                        .font(.caption2)
                        .offset(y: -9)
                }.padding(.trailing)
                 .onTapGesture {
                     if viewModel.usersession == nil {
                            showingSignUpSheet = true
                                   print("📢 showingSignUpSheet set to true\(showingSignUpSheet)")
                         print(showingSignUpSheet)
                     } else {
                         selectedTab = .profile
                     }
                 }.fullScreenCover(isPresented: $showingSignUpSheet) {
                     LogInView(showSignUp: $showingSignUpSheet)
                 }
               
             
            }.frame(height: 55)
             .background(Color.white)
             .background(Color.white
             .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: -2))
        }
    }
}

