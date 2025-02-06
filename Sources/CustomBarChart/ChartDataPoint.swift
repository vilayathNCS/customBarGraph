import Foundation

public struct ChartDataPoint: Identifiable {
    public let id: UUID
    public let label: String
    public let value: Double
    
    public init(label: String, value: Double) {
        self.id = UUID()
        self.label = label
        self.value = value
    }
}
