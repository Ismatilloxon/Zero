//
//  Psixolog.swift
//  Zero
//
//  Created by Ismatilla on 18/11/22.
//

import SwiftUI

struct Psixolog: View {
    @EnvironmentObject var vm: PsixologViewModel
    let threeColumnGrid = [ GridItem(.flexible(minimum: 10)), GridItem(.flexible(minimum: 10))]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(0..<(vm.doctors?.results.count ?? 0), id:\.self) { index in
                            HStack {
                                AsyncImage(url: URL(string: vm.doctors?.results[index].user.pic ?? "")) { image in
                                    image
                                        .resizable()
                                        .frame(width: 65,height: 65)
                                        .scaledToFit()
                                        .clipShape(Circle())
                                } placeholder: {
                                    Color.gray
                                }
                                .padding()
                                
                                VStack(alignment: .leading) {
                                    Text(vm.doctors?.results[index].user.full_name ?? "")
                                    
                                    Text("HealthMed Ltd").font(.caption).foregroundColor(.gray)
                                    
                                    Text("\(vm.doctors?.results[index].total_rating ?? 0)")
                                }
                                
                                Spacer()
                            }
                            
                            
                            LazyVGrid(columns: threeColumnGrid, alignment: .center, spacing: 8) {
                                
                                ForEach(0..<(vm.doctors?.results[index].specializations.count ?? 0), id: \.self) { j in
                                    VStack {
                                        Button(action: {
                                            
                                        }) {
                                            Text(vm.doctors?.results[index].specializations[j].title ?? "")
                                                .padding()
                                                
                                                
                                              
                                        }  .cornerRadius(12) /// make the background rounded
                                            .overlay( /// apply a rounded border
                                                RoundedRectangle(cornerRadius: 12)
                                                    .stroke(.blue, lineWidth: 1)
                                            )
                                    }
                                }
                            }
                            
                            
                            Button(action: {
                                
                            }) {
                                Text("Batafsil").foregroundColor(Color.blue).frame(width: UIScreen.main.bounds.width - 48, height: 50).background(Color.blue.opacity(0.1))
                                    
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
}

struct Psixolog_Previews: PreviewProvider {
    static var previews: some View {
        Psixolog()
    }
}
