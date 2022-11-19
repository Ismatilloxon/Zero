import SwiftUI

var totalViews = 4

struct ContentView: View {
    @AppStorage("currentView") var currentView = 1
    var body: some View {
        
       
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack{
                if currentView == 1 {
                    ImgView(img: "img1")
                    PageControleView(title: "Assalomu alaykum!",
                                     subtitle: "Telemeditsina sohasidagi Psixologlarni bir joyda jamlagan va onlayn konsutatsiya platformasiga xush kelibsiz!"                    )
                    .transition(.opacity)
                } else if currentView == 2 {
                    ImgView(img: "img2")
                    PageControleView(title: "Assalomu alaykum!",
                                     subtitle: "Telemeditsina sohasidagi Psixologlarni bir joyda jamlagan va onlayn konsutatsiya platformasiga xush kelibsiz!"                    )
                    .transition(.opacity)
                } else if currentView == 3 {
                    ImgView(img: "img3")
                    PageControleView(title: "Assalomu alaykum!",
                                     subtitle: "Telemeditsina sohasidagi Psixologlarni bir joyda jamlagan va onlayn konsutatsiya platformasiga xush kelibsiz!"                    )
                    .transition(.opacity)
                }
                
                
                if currentView == 4 {
                    ImgView(img: "img4")
                    PageControleView(title: "Assalomu alaykum!",
                                     subtitle: "Telemeditsina sohasidagi Psixologlarni bir joyda jamlagan va onlayn konsutatsiya platformasiga xush kelibsiz!"                    )
                    .transition(.opacity)
                }
                
                if currentView == 5 {
                    Login()
                }
                
            }
        }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterVC()
        }
    }





struct ImgView: View {
    
    @AppStorage("currentView") var currentView = 1
    var img: String
    var body: some View {
        ZStack{
            VStack {
            Image(img)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .cornerRadius(10)
                .border(.green)
                
                
        }
        }
    }
}

struct PageControleView: View {
    
    @AppStorage("currentView") var currentView = 1
    
    var title: String
    var subtitle: String
    var body: some View {
        ZStack {
          VStack(alignment: .center) {
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
                Text(subtitle)
                    .padding()
                    .multilineTextAlignment(.center)
                    .padding()
            }
            Spacer(minLength: 5)
                .overlay(
                    HStack{
                        
                        if currentView == 1 {
                            ContainerRelativeShape()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.black.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        if currentView == 2 {
                            ContainerRelativeShape()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.black.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        if currentView == 3 {
                            ContainerRelativeShape()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.black.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        if currentView == 4 {
                            ContainerRelativeShape()
                                .foregroundColor(.black)
                                .frame(width: 25, height: 5)
                        } else {
                            ContainerRelativeShape()
                                .foregroundColor(.black.opacity(0.5))
                                .frame(width: 25, height: 5)
                        }
                        
                        
                        Spacer()
                        
                        Button(
                            action:{
                                withAnimation(.easeOut) {
                                    if currentView <= totalViews || currentView == 2 {
                                        currentView += 1
                                    } else if currentView == 3 {
                                        currentView += 1
                                    } else if currentView == 4 {
                                        currentView += 1
                                    }  else if currentView == 5 {
                                        currentView = 1
                                    }
                                   // currentView = 1
                                }
                            },
                            label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 35.0, weight: .semibold))
                                    .frame(width: 55, height: 55)
                                    .background(Color("mainblue"))
                                    .clipShape(Circle())
                                    .padding(10)
                                    .overlay(
                                        ZStack{
                                            Circle()
                                                .stroke(Color.white.opacity(0.4), lineWidth: 2)
                                                .padding()
                                                .foregroundColor(Color.black)
                                        }
                                    )
                            }
                            
                        )
                        
                        
                    }
                        .padding(), alignment: .bottom
                )
                .padding()
            
        }
       
    }
}
