import Foundation

public class ReportBuilder<TResult>: BaseBuilder<TResult> {
    var reportType: ReportType
    var timeZoneConversion: TimeZoneConversion?

    public init(reportType: ReportType) {
        self.reportType = reportType
    }

    public override func execute(completion: ((TResult?) -> Void)?) {
        super.execute(completion: nil)
        let client = ServicesContainer.shared.getReportingService()
        client?.processReport(builder: self, completion: completion)
    }
}
