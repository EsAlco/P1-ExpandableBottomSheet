//
//  CourseDetailView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Alcoceba Gutiérrez de León on 15/2/22.
//

import SwiftUI

struct CourseDetailView: View {
    
    var course: Course
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                HandleBar()
                TitleBar(titleText: "Detalles del curso")
                ScrollView{
                    HeaderView(course: course)
                    DescriptionView(icon: "eurosign.circle.fill",
                                content: "\(course.priceLevel)")
                    DescriptionView(icon: nil,
                                content: course.description)
                }

            }
            .background(.white)
            .cornerRadius(25, antialiased: true) //
            // Distancia de la tarjeta al borde superior teniendo en cuenta el tamaño total de la vista, el 25% del tamaño.
            .offset(y: geometry.size.height * 0.25)
        }
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0])
            .background(Color.gray.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}

// Límite de la tarjeta
struct HandleBar: View {
    var body: some View {
        Rectangle()
            .frame(width: 80, height: 8)
            .foregroundColor(Color(.systemCyan)).cornerRadius(8)
            .padding(3)
    }
}

// Barra del título
struct TitleBar: View {
    var titleText: String
    var body: some View {
        Text(titleText)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(.primary)
    }
}

// Vista de la cabecera
struct HeaderView: View {
    var course: Course
    
    var body: some View {
        Image(course.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(course.name)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                        Text(course.type)
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .light, design: .rounded))
                            .padding(2)
                            .background(Color.cyan)
                    }
                    .padding(6)
                    Spacer()
                }
            )
            .padding(.horizontal)
    }
}

// Vista de la descripvión
struct DescriptionView: View{
    var icon: String?
    var content: String
    
    var body: some View {
        HStack{
            if icon != nil{
                Image(systemName: icon!)
                    .foregroundColor(.cyan)
                    
            }
            Text(content)
                .font(.system(size: 15, weight: .light, design: .rounded))
                
            Spacer()
        }.padding(.horizontal)
        
    }
}
