# Incomplete Error Handling in Asynchronous Dart Function

This example demonstrates a common issue in Dart asynchronous programming: incomplete error handling. The `fetchData` function uses a `try-catch` block, but the `catch` block only prints a generic error message.  This makes debugging and identifying the root cause of failures difficult.  The example also demonstrates how the response's status code can indicate an error, but it doesn't explicitly throw an exception in this case. 

## How to Reproduce

1. Run the `bug.dart` file.
2. Simulate a network error (e.g., by making the API endpoint unavailable).
3. Observe the generic error message.  Notice that no specific information about the error (e.g., the HTTP status code) is provided.

## Solution

The `bugSolution.dart` file provides a more robust solution.  This version explicitly throws exceptions for various error conditions (network error, JSON decoding error, HTTP error), providing more context for debugging.