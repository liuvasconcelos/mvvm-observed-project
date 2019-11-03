//
//  ContentView.swift
//  mvvm-observed-project
//
//  Created by Livia Vasconcelos on 03/11/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"
 
struct Course: Identifiable, Decodable {
    let id =  UUID()
    let name: String
}

class CoursesViewModel: ObservableObject {
    @Published var messages = "Messages inside observable object"
    @Published var courses: [Course] = []
    
    func fetchCourses() {
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                self.courses = try! JSONDecoder().decode([Course].self, from: data!)
            }
        }.resume()
    }
}

struct ContentView: View {
    
    @ObservedObject var coursesViewModel = CoursesViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(coursesViewModel.messages)
                
                ForEach(coursesViewModel.courses) { course in
                    Text(course.name)
                }
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: {
                    print("Fetching json")
                    
                    self.coursesViewModel.fetchCourses()
                }, label: {
                    Text("Fetch Courses")
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
