//
//  ContentView.swift
//  mvvm-observed-project
//
//  Created by Livia Vasconcelos on 03/11/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"
 
struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                Text("Hello")
            }.navigationBarTitle("Courses")
                .navigationBarItems(trailing: Button(action: {
                    print("Fetching json")
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
