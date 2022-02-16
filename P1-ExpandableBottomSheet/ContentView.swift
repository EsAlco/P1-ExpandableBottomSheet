//
//  ContentView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Alcoceba Gutiérrez de León on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                ForEach(courses){ course in
                    BasicRow(course: course)
                    
                }
            }
            .navigationBarTitle("Cursos Online")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 // Declaramos la estructura que van a tener las celdas que compongan las filas de la tabla que contenga a nuestros cursos.
struct BasicRow: View {
    var course: Course
    var body: some View{
        HStack{
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)
            Text(course.name)
                .font(.system(.subheadline, design: .rounded))
            Spacer().layoutPriority(-10)
            Text(String(course.priceLevel))
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
