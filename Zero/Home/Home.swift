//
//  ContentView.swift
//  Zero
//
//  Created by Ismatilla on 18/11/22.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject var vm: HomeViewModel
    
    @State var searchText = ""
    
    let threeColumnGrid = [GridItem(.flexible(minimum: 10)), GridItem(.flexible(minimum: 10)), GridItem(.flexible(minimum: 10))]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    pageView
                    
                    categories
                    
                    
                    Button(action: {
                        
                    }) {
                        Text("Shoshilinch yordam olish")
                            .foregroundColor(.red)
                            .frame(width: with - 48, height: 50)
                           
                    }.background(Color.red.opacity(0.3))
                        .cornerRadius(12)
                        .padding()
                    
                    Spacer()
                    
                    
                    
                }.searchable(text: $searchText)
                    .padding()
                    .navigationTitle("Salom, Mallasochxonim")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            vm.fatchCategories()
                        }
//
                        vm.fetchAdv()
                    }
                    .navigationBarBackButtonHidden()
            }.background(Color(red: 0.9, green: 0.9, blue: 0.9))
        }
    }
}



extension Home {
    var pageView: some View {
        TabView {
            ForEach(0..<(vm.adv?.images.count ?? 0) , id: \.self) { index in
                AsyncImage(url: URL(string: vm.adv?.images[index] ?? "")) { image in
                    image
                        .resizable()
                        .frame(width: with - 48,height: 160)
                        .scaledToFit()
                        .cornerRadius(12)
                } placeholder: {
                    Color.gray
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .frame(width: with - 32, height: 200)
    }
    
    var categories: some View {
        
        VStack {
            HStack {
                Text("Top yo’nalishlar")
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("More")
                }

                
            }.padding()

            LazyVGrid(columns: threeColumnGrid, alignment: .center, spacing: 16) {
                
                ForEach(0..<(vm.categories?.results.count ?? 0), id: \.self) { index in
                    VStack {
                        
                        AsyncImage(url: URL(string: vm.categories?.results[index].logo ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: 78,height: 78)
                                .scaledToFit()
                                .clipShape(Circle())
                        } placeholder: {
                            Color.gray
                        }
                        
                        Text(vm.categories?.results[index].title ?? "")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.blue)
                            .lineLimit(2)
                        
                    }.frame(width: (with - 100) / 3, height: 133)
                        .background(Color.white)
                        .cornerRadius(12)
                    
                    
                }
            }.padding(8)
        }
        
        
    }
}
