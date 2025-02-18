
import SwiftUI
import Charts

class BarChartViewModel: ObservableObject {
    // Published properties
    @Published var chartData: [ChartDataPoint]
    @Published var selectedBar: ChartDataPoint?
    @Published var animateChart = false
    @Published var configuration: ChartConfiguration
    
    // Chart styling
    let maxValue: Double = 10000
    let yAxisSteps = 5
    
    // Custom colors
    let barGradient = Gradient(colors: [
        Color.blue.opacity(0.5),
        Color.blue
    ])
    
    let selectedGradient = Gradient(colors: [
        Color.purple.opacity(0.6),
        Color.purple
    ])
    
    // MARK: - Initialization
    init(data: [ChartDataPoint], configuration: ChartConfiguration) {
        self.chartData = data
        self.configuration = configuration
    }
    
    // MARK: - User Interaction Methods
    func updateSelectedBar(at location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) {
        let xPosition = location.x - geometry.frame(in: .local).origin.x
        guard let label = proxy.value(atX: xPosition) as String? else { return }
        
        withAnimation(.easeInOut(duration: 0.2)) {
            if let newBar = chartData.first(where: { $0.label == label }),
               selectedBar?.id != newBar.id {
                selectedBar = newBar
            }
        }
    }
    
    func clearSelection() {
        withAnimation(.easeOut(duration: 0.2)) {
            selectedBar = nil
        }
    }
    
    func startChartAnimation() {
        withAnimation(.easeInOut(duration: 1.0)) {
            animateChart = true
        }
    }
    
    // MARK: - Accessibility
    func generateAccessibilityDescription() -> String {
        chartData.map { "\($0.label): $\(Int($0.value))" }.joined(separator: ", ")
    }
}
