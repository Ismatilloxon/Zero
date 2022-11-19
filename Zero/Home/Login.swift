//
//  Login.swift
//  HealthCareApp
//
//  Created by MuhammadQodir on 18.11.2022.
//

import SwiftUI

struct Login: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var user: String = ""
    @State var isMain: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                if isMain {
                   
                }
                
                Color.blue
                    .ignoresSafeArea()
                    .opacity(10)
                Image("bg2")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    
                VStack {
                    Text("Ro'yhatdan o'tish")
                        
                        
                    FloatingTextField(
                        title: "Elektron pochtangizni kiriting",
                        text: $email)
                    .cornerRadius(12)
                    .padding()
                        //.padding()
                        //.border(.green)
                        //.padding(10)
                        //.frame(height: 20)
                    
                    FloatingTextField2(
                        title: "Parolingizni kiriting",
                        text: $password)
                    .cornerRadius(12)
                    .padding()
                        //.padding()
                       // .border(.green)
                        //.padding(10)
                       // .frame(height: 20)
                    FloatingTextField3(
                        title: "Foydalanuvchi nomi",
                        text: $user)
                        //.padding()
                        //.border(.green)
                        //.padding(10)
                       // .frame(height: 20)
                    .cornerRadius(12)
                    .padding()
                    NavigationLink(destination: Main(), isActive: $isMain) { Text("Sign In") }
                    
                    VStack {
                       Divider()
                            .padding()
                    }
                    Text("Yoki")
                    
                    NavigationLink(destination: Main(), isActive: $isMain) { Text("Sign In") }
                    .padding()
                    .border(.green)
                    NavigationLink(destination: Main(), isActive: $isMain) { Text("Sign In") }
                    
                    .padding()
                    .border(.green)
                }
            }
        }
       
       
    }
    
    struct Login_Previews: PreviewProvider {
        static var previews: some View {
            Login()
        }
    }
}


struct FloatingTextField: View {
    let title: String
    let text: Binding<String>

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .opacity(text.wrappedValue.isEmpty ? 0 : 50)
                .offset(y: text.wrappedValue.isEmpty ? 10 : 0)
            TextField(title, text: text)
                .padding()
                .frame(height: 100)
                .background(Color.white)
                
                
                
              
                
                
        }
        .padding()
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
            
    }
}


struct FloatingTextField2: View {
    let title: String
    let text: Binding<String>

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .opacity(text.wrappedValue.isEmpty ? 0 : 10)
                .offset(y: text.wrappedValue.isEmpty ? 10 : 0)
            TextField(title, text: text)
                 .padding()
                 .frame(height: 100)
                 .border(.green)
                 .background(Color.white)

        }
        .padding()
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
            
    }
}


struct FloatingTextField3: View {
    let title: String
    let text: Binding<String>

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .font(.caption)
                .foregroundColor(Color(.placeholderText))
                .opacity(text.wrappedValue.isEmpty ? 0 : 10)
                .offset(y: text.wrappedValue.isEmpty ? 10 : 0)
            TextField(title, text: text)
                 .padding()
                 .frame(height: 100)
                 .border(.green)
                 .background(Color.white)
        }
        .padding()
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
            
    }
}

