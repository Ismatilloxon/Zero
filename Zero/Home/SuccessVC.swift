//
//  SuccessVC.swift
//  HealthCareApp
//
//  Created by MuhammadQodir on 18.11.2022.
//

import SwiftUI

struct SuccessVC: View {
   
    var body: some View {
        
        VStack {
            Image("imageSuccess")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Muvaffaqiyatli!")
                .padding()
            Text("Siz bizning doimiy foydalanuvchimiz bo’ldingiz! Bizning xizmatlarimizdan bemalol foydalanishingiz mumkin.")
                .multilineTextAlignment(.center)
                .padding()
            
        }
       
              

    }
}

struct SuccessVC_Previews: PreviewProvider {
    static var previews: some View {
        SuccessVC()
    }
}


