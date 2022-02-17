//
//  ContentView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Esther Alcoceba Gutiérrez de León on 15/2/22.
//

import SwiftUI

struct ContentView: View {
    
    // Variables
    @State private var showCourseDetail = false
    
    @State var selectedCourse: Course?
    
    var body: some View {
        ZStack{
            NavigationView{
                List{
                    ForEach(courses){ course in
                        BasicRow(course: course)
                            .onTapGesture {
                                    self.showCourseDetail = true
                                    self.selectedCourse = course
                            }
                    }
                }
                .navigationBarTitle("Cursos Online")
            }
            .offset(y: self.showCourseDetail ? -100 : 0)
            .animation(.easeIn(duration: 0.25), value: self.showCourseDetail)
            
            if showCourseDetail{
                
                BlanketView(color: .cyan)
                    .opacity(0.5)
                    .onTapGesture {
                        // Si se toca el velo se oculta la vista detalle
                        self.showCourseDetail = false
                    }
                
                self.selectedCourse.map{
                    CourseDetailView(course: $0, isShown: $showCourseDetail)
                        .transition(.move(edge: .bottom))
                }
            }
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

// Creamos una capa, un velo, para no interferir con la vista de la lista cuando estamos en la vista del detalle.
struct BlanketView: View{
    var color: Color
    
    var body: some View{
        VStack{
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .edgesIgnoringSafeArea(.all)
    }
}
