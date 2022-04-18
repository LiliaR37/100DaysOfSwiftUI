//
//  CustomViewModifiers.swift
//  ViewsAndModifiers
//
//  Created by LILIA MARIANGEL on 04/18/22.
//

import SwiftUI
//New ViewModifier
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

//EXTENSION
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

//New ViewModifier
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(.black)
        }
    }
}

//Extension
extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomViewModifiers: View {
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
      
            //.titleStyle()
    }
}

struct CustomViewModifiers_Previews: PreviewProvider {
    static var previews: some View {
        CustomViewModifiers()
    }
}
