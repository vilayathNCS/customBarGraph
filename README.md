# Custom Bar Chart

This custom bar chart library, helps our devs to design and customise bar graph with animations, it's easy to install and use. 

## Table of Contents
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)

## Features ✨
- Bar chart with customizable color animation, when user selects the bar it highlights the bar. 
- Customizable lollipop info on top displayed when user holds the bar with x-axis and y-axis doted lines 
- Supports from iOS 16 version

## Installation 🛠️
Step-by-step instructions to install:
- Open Xcode -> file -> Add package dependencies -> search with "https://github.com/vilayathNCS/customBarGraph.git"

## Example code snippet

import SwiftUI
import CustomBarChart

struct ContentView: View {
   
    var body: some View {
        VStack {
            Text("Monthly Sales")
                .font(.title)
                .padding()
            
            BarChartView(data: data, configuration: .default)
        }
        .padding()
    }
}

let data: [ChartDataPoint] = [
    ChartDataPoint(label: "Jan", value: 7000),
    ChartDataPoint(label: "Feb", value: 900),
    ChartDataPoint(label: "Mar", value: 4000),
    ChartDataPoint(label: "Apr", value: 8500),
    ChartDataPoint(label: "May", value: 600)
   ]





