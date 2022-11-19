//
//  Psixolog.swift
//  Zero
//
//  Created by Ismatilla on 18/11/22.
//

import SwiftUI

struct Psixolog: View {
    @EnvironmentObject var vm: PsixologViewModel
    
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ForEach(0..<(vm.doctors?.results.count ?? 0), id:\.self) { index in
                        HStack {
                            AsyncImage(url: URL(string: vm.doctors?.results[index].category.logo ?? "")) { image in
                                image
                                    .resizable()
                                    .frame(width: 65,height: 65)
                                    .scaledToFit()
                                    .clipShape(Circle())
                            } placeholder: {
                                Color.gray
                            }
                            .padding()
                            
                            VStack {
                                Text(vm.doctors?.results[index].category)
                            }
                            
                            Spacer()
                        }
                    }
                }
            }
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarTitle("Psixologlar")
            .onAppear {
                vm.fatchDoctors()
            }
    }
}

struct Psixolog_Previews: PreviewProvider {
    static var previews: some View {
        Psixolog()
    }
}
