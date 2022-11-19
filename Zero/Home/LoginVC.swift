//
//  RegisterVC.swift
//  HealthCareApp
//
//  Created by MuhammadQodir on 18.11.2022.
//

import SwiftUI

struct RegisterVC: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    

    var body: some View {
        
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Image("bg")
                .resizable()
                .aspectRatio( contentMode: .fill)
            
               
            VStack {
            Text("Kirish")
            CustomField_1(
                title: "Elektron pochtangizni kiriting",
                text: $email)
            Customfield_2(
                title: "Parolingizni kiriting",
                text: $password)
            ForgotPass(text: "Parolni unutdingizmi?")
            Divider()
                .padding()
            Text("Yoki")
            
            Button {
                
            } label: {
                Text("Google orqali ro’yxatdan o’tish")
            }
            .padding()
            .border(.green)
            
            Button {
                
            } label: {
                Text("Ro'yhatdan o'tish")
            }
            .padding()
            .border(.green)
            
            HStack {
                Text("Akkauntingiz yo’q bo’lsa ")
                Button {
                    RegisterVC()
                } label: {
                    Text("Ro’yxatdan o’tish")
                }
                
            }
            
        }
        }
    }
}

struct RegisterVC_Previews: PreviewProvider {
    static var previews: some View {
        RegisterVC()
    }
}



struct CustomField_1: View {
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
                .border(.green)
                .background(Color.white)
                
                
              
                
                
        }
        .padding()
        .animation(.spring(response: 0.2, dampingFraction: 0.5))
            
    }
}

struct Customfield_2: View {
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

struct ForgotPass: View {
    var text: String
    
    var body: some View {
        Button {
            
        } label: {
            Text(text)
        }
        .padding()
        .multilineTextAlignment(.trailing)

    }
}


