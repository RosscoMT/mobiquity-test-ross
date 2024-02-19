import XCTest
@testable import Shared

final class SharedTests: XCTestCase {
    
    /// Tests for a successful search
    func testSuccessfulDataRequest() async throws {
    
        let dataService = DataService(buildType: .development)
        
        guard let url: URL = dataService.search(phrase: "Dog") else {
            XCTFail("Failed to compose request")
            return
        }
        
        let results = await dataService.dataRequest(request: url)
        
        switch results {
        case .success(let success):
            XCTAssertGreaterThan(success.count, 0)
        case .failure(let failure):
            XCTFail(failure.localizedDescription)
        }
    }
    
    /// Tests for a deliberate failure
    func testFailureDataRequest() async throws {
        
        let dataService = DataService.init(buildType: .development)
  
        let results = await dataService.dataRequest(request: URL(string: "https://api.flickr.com")!)
        
        switch results {
        case .failure(let failure):
            XCTAssertNotNil(failure)
        default:
            XCTFail()
        }
    }
}
