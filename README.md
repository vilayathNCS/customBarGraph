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

## 🚀 Usage

### Basic Implementation
```swift
import SwiftUI
import CustomBarChart

struct SalesReportView: View {
 let salesData = [
     ChartDataPoint(label: "Jan", value: 7000),
     ChartDataPoint(label: "Feb", value: 9000),
     ChartDataPoint(label: "Mar", value: 4000),
     ChartDataPoint(label: "Apr", value: 8500),
     ChartDataPoint(label: "May", value: 6000)
 ]
 
 var body: some View {
     BarChartView(
         data: salesData,
         configuration: ChartConfiguration.default
     )
     .frame(height: 300)
     .padding()
 }
}
```
# Image
![image alt](https://github.com/vilayathNCS/customBarGraph/blob/ceaa8f07bc9f5e8b2196762160e2f1ce5c3bc64c/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-02-07%20at%2015.42.32.png)
![image alt](https://github.com/vilayathNCS/customBarGraph/blob/ceaa8f07bc9f5e8b2196762160e2f1ce5c3bc64c/image.png)



