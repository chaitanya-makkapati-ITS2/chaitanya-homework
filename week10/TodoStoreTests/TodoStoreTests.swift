//
//  TodoStoreTests.swift
//  TodoStoreTests
//
//  Created by Chaitanya Makkapati on 3/19/25.
//

import XCTest
@testable import week10

class TodoStoreTests: XCTestCase {
    
    // MARK: - Fake Network Service
    
    class FakeNetworkService: NetworkServiceProtocol {
        var dataToReturn: Data?
        var errorToThrow: Error?
        
        func data(from url: URL) async throws -> (Data, URLResponse) {
            if let error = errorToThrow {
                throw error
            }
            if let data = dataToReturn {
                let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
                return (data, response)
            }
            throw NSError(domain: "FakeNetworkService", code: 0, userInfo: nil)
        }
    }
    
    // MARK: - Unit Tests
    
    /// Test that fetchTodos successfully decodes data and updates state.
    func testFetchTodosSuccess() async {
        // Arrange: Create fake JSON data for two todos.
        let jsonString = """
        [
            {"userId": 1, "id": 1, "title": "Test Todo", "completed": false},
            {"userId": 2, "id": 2, "title": "Another Todo", "completed": true}
        ]
        """
        let jsonData = jsonString.data(using: .utf8)!
        let fakeService = FakeNetworkService()
        fakeService.dataToReturn = jsonData
        
        let store = TodoStore(networkService: fakeService)
        
        // Act: Fetch todos.
        await store.fetchTodos()
        
        // Assert: Check state updates.
        XCTAssertEqual(store.todos.count, 2)
        XCTAssertFalse(store.isLoading)
        XCTAssertNil(store.error)
    }
    
    /// Test that fetchTodos handles errors correctly.
    func testFetchTodosFailure() async {
        // Arrange: Configure the fake service to throw an error.
        let fakeService = FakeNetworkService()
        let testError = NSError(domain: "TestError", code: 123, userInfo: nil)
        fakeService.errorToThrow = testError
        
        let store = TodoStore(networkService: fakeService)
        
        // Act: Fetch todos.
        await store.fetchTodos()
        
        // Assert: Verify that no todos are loaded and an error is set.
        XCTAssertEqual(store.todos.count, 0)
        XCTAssertFalse(store.isLoading)
        XCTAssertNotNil(store.error)
    }
    
    /// Test the decoding of the Todo model from JSON.
    func testTodoDecoding() throws {
        // Arrange: A JSON string representing a Todo.
        let jsonString = """
        {"userId": 1, "id": 1, "title": "Decoded Todo", "completed": true}
        """
        let jsonData = jsonString.data(using: .utf8)!
        
        // Act: Decode the JSON data.
        let decoder = JSONDecoder()
        let todo = try decoder.decode(Todo.self, from: jsonData)
        
        // Assert: Verify the Todo properties.
        XCTAssertEqual(todo.userId, 1)
        XCTAssertEqual(todo.id, 1)
        XCTAssertEqual(todo.title, "Decoded Todo")
        XCTAssertEqual(todo.completed, true)
    }
}

