# Custom Bar Chart 📊

A lightweight SwiftUI library for creating beautiful, interactive bar charts with effortless customization and smooth animations. Perfect for iOS developers who need elegant data visualization.

## Table of Contents
- [Features](#-features)
- [Requirements](#-requirements)
- [Installation](#-installation)
- [Usage](#-usage)
- [Customization](#-customization)
- [Example](#-example)

## ✨ Features
- 🎨 Fully customizable bar colors and animations
- 👆 Interactive touch handling with selection highlight
- 💬 lollipop tooltips 
- 📈 Auto-scaling axis system with dotted guides


## 📋 Requirements
- Xcode 15+
- Swift 5.9+
- iOS 16.0+

## 🛠️ Installation

### Swift Package Manager
1. In Xcode: **File → Add Package Dependencies...**
2. Paste the repository URL: https://github.com/vilayathNCS/customBarGraph.git

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





