//
//  FirestoreService.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import Firebase
import Foundation

// TODO: Change
enum FSError: Error {
    case invalidData
    case invalidResponse
    case decodingError(Error)
}

class FirestoreService {
    let db = Firestore.firestore()
    let userCollection: CollectionReference?

    init() {
        self.userCollection = self.db.collection("users")
    }

    func getUser(id: String) async throws -> DocumentSnapshot {
        do {
            guard let snapshot = try await self.userCollection?.document(id).getDocument() else {
                throw FSError.invalidData
            }

            return snapshot
        } catch {
            Log.error("Faild to get user document with error: \(error.localizedDescription)")
            throw error
        }
    }

    func addUser(id: String, encodedUser: [String: Any]) async throws {
        do {
            try await self.userCollection?.document(id).setData(encodedUser)
        } catch {
            Log.error("Faild to add user to firestore with error: \(error.localizedDescription)")
            throw error
        }
    }

    func deleteUser(id: String) async throws {
        do {
            try await self.userCollection?.document(id).delete()
        } catch {
            Log.error("Faild to delete user from firestore with error: \(error.localizedDescription)")
            throw error
        }
    }
}
