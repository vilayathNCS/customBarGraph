import SwiftUI

public struct ChartConfiguration {
    public let maxValue: Double
    public let barGradient: Gradient
    public let selectedGradient: Gradient
    public let xAxisLabel: String
    public let yAxisLabel: String
    public let chooseCurrency: String
    public static let `default` = ChartConfiguration()
    
    public init(
        maxValue: Double = 10000,
        barGradient: Gradient = Gradient(colors: [.blue.opacity(0.5), .blue]),
        selectedGradient: Gradient = Gradient(colors: [.purple.opacity(0.6), .purple]),
        xAxisLabel: String = "Month",
        yAxisLabel: String = "Value",
        chooseCurrency: String = "USD"
    ) {
        self.maxValue = maxValue
        self.barGradient = barGradient
        self.selectedGradient = selectedGradient
        self.xAxisLabel = xAxisLabel
        self.yAxisLabel = yAxisLabel
        self.chooseCurrency = chooseCurrency
    }
}
