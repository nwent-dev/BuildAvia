import SwiftUI
import Foundation

enum Times: Int {
    case one = 60
    case two = 120
    case three = 180
}

struct TimeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var width = UIScreen.main.bounds.width
    @State private var height = UIScreen.main.bounds.height
    @State private var selectedTime: Times = .three
    var body: some View {
        NavigationView {
            ZStack {
                Image("soundBg")
                    .resizable()
                    .ignoresSafeArea()
                
                ZStack {
                    Image("timeView")
                        .resizable()
                        .scaledToFit()
                        .frame(height: height * 0.9)
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("closeBtn")
                            .resizable()
                            .scaledToFit()
                            .frame(height: height * 0.13)
                            .padding(.leading, width * 0.38)
                            .padding(.bottom, height * 0.7)
                    }
                    
                    HStack {
                        VStack {
                            Button {
                                selectedTime = .one
                            } label: {
                                Image(selectedTime == .one ? "1minActive" : "1min")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: height * 0.2)
                            }
                            
                            Button {
                                selectedTime = .two
                            } label: {
                                Image(selectedTime == .two ? "2minActive" : "2min")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: height * 0.3)
                            }
                        }
                        
                        Button {
                            selectedTime = .three
                        } label: {
                            Image(selectedTime == .three ? "3minActive" : "3min")
                                .resizable()
                                .scaledToFit()
                                .frame(height: height * 0.4)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    TimeView()
}
