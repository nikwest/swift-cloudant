//
//  CouchClientTest.swift
//  SwiftCloudant
//
//  Created by Sam Smith on 19/12/2016.
//
//

import Foundation
import XCTest
@testable import SwiftCloudant

class CouchClientTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmptyVCAPServiceFailure() {
        XCTAssertThrowsError(try CouchDBClient(vcapServices: "{}", instanceName: "myInstance")) { (error) -> Void in
            XCTAssertEqual(error as? CouchDBClient.Error, CouchDBClient.Error.missingCloudantService)
        }
    }
    
    func testMissingVCAPServiceFailure() {
        XCTAssertThrowsError(try CouchDBClient(vcapServices: "", instanceName: "myInstance")) { (error) -> Void in
            XCTAssertEqual(error as? CouchDBClient.Error, CouchDBClient.Error.invalidVCAP)
        }
    }
    
    func testCreateCouchDBClientSuccess() {
        if let url = URL(string: "https://example:xxxxxxx@example.cloudant.com") {
            let client = CouchDBClient(url: url, username: url.user, password: url.password)
            XCTAssertEqual("example", client.username)
            XCTAssertEqual("xxxxxxx", client.password)
            XCTAssertEqual("https://example:xxxxxxx@example.cloudant.com", client.rootURL.absoluteString)
        } else {
            XCTFail("Unexpected error")
        }
    }

//    func testGetVCAPServiceDefaultSuccess() {
//        let vcapServices: String = "{\"cloudantNoSQLDB\":[{\"credentials\":{\"username\":\"example\",\"password\":\"xxxxxxx\",\"host\":\"example.cloudant.com\",\"port\":443,\"url\":\"https://example:xxxxxxx@example.cloudant.com\"},\"syslog_drain_url\":null,\"label\":\"cloudantNoSQLDB1\",\"provider\":null,\"plan\":\"Lite\",\"name\":\"CloudantNoSQLDB\"}]}"
//        
//        do {
//            let client = try CouchDBClient(vcapServices: vcapServices, instanceName: "CloudantNoSQLDB")
//            XCTAssertEqual("example", client.username)
//            XCTAssertEqual("xxxxxxx", client.password)
//            XCTAssertEqual("https://example:xxxxxxx@example.cloudant.com", client.rootURL.absoluteString)
//            
//        } catch {
//            XCTFail("Unexpected error")
//        }
//    }
}
