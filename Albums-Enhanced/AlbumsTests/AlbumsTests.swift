//
//  AlbumsTests.swift
//  AlbumsTests
//
//  Created by Ben Gohlke on 9/13/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import XCTest
@testable import Albums

class AlbumsTests: XCTestCase
{
    
    var viewController: AlbumsTableViewController!
    
    override func setUp()
    {
        super.setUp()
        viewController = AlbumsTableViewController()
    }
    
    override func tearDown()
    {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchingAlbumDataAndLoadingTable()
    {
        // given
        let mockDataProvider = MockDataProvider()
        viewController.dataProvider = mockDataProvider
        
        // when
        XCTAssertNil(mockDataProvider.tableView, "Before loading the tableview should be nil")
        
        // This will cause the datasource methods to be run since we are accessing the view
        let _ = viewController.view
        
        // then
        XCTAssertTrue(mockDataProvider.tableView != nil, "The tableview should be set")
        XCTAssert(mockDataProvider.tableView == viewController.tableView, "The tableview should be set to the tableview of the datasource")
    }
}

class MockDataProvider: NSObject, AlbumDataProviderProtocol
{
    weak var tableView: UITableView?
    var albums = [Album]()
    var api: APIController!
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return UITableViewCell()
    }
    
    func didReceiveAPIResults(_ results: [Any])
    {
        DispatchQueue.main.async {
            self.albums = Album.albumsWithJSON(results)
            self.tableView?.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
