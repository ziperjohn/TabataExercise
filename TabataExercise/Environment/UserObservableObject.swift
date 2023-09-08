//
//  UserObservableObject.swift
//  TabataExercise
//
//  Created by Jan Vaverka on 25.08.2023.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class UserObservableObject: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var currentUser: User?

    private let authService: AuthService
    private let firestoreService: FirestoreService

    init(authService: AuthService, firestoreService: FirestoreService) {
        self.authService = authService
        self.firestoreService = firestoreService

        self.userSession = Auth.auth().currentUser

        Task {
            try await self.getUserFromDB()
        }
    }

    func signUpAndCreateUser(withEmail email: String, password: String, nickname: String) async throws {
        do {
            try await signUp(withEmail: email, password: password, nickname: nickname)

            if let id = userSession?.uid {
                let user = User(id: id, nickname: nickname, email: email, workouts: [])

                try await addUserToDB(user: user)
                try await getUserFromDB()
            }
        } catch {
            throw error
        }
    }

    func signInAndGetUser(withEmail email: String, password: String) async throws {
        do {
            try await signIn(withEmail: email, password: password)
            try await getUserFromDB()
        } catch {
            throw error
        }
    }

    func signOut() throws {
        do {
            try authService.signOut()

            userSession = nil
            currentUser = nil
        } catch {
            throw error
        }
    }

    func deleteUser() async throws {
        do {
            try await deleteAuhtUser()
            try await deleteUserFromDB()

            userSession = nil
            currentUser = nil
        } catch {
            throw error
        }
    }

    func resetPassword(withEmail email: String) async throws {
        do {
            try await authService.resetPassword(withEmail: email)
        } catch {
            throw error
        }
    }

    // MARK: - Auth

    private func signIn(withEmail email: String, password: String) async throws {
        do {
            userSession = try await authService.signIn(withEmail: email, password: password)
        } catch {
            throw error
        }
    }

    private func signUp(withEmail email: String, password: String, nickname: String) async throws {
        do {
            userSession = try await authService.signUp(withEmail: email, password: password)
        } catch {
            throw error
        }
    }

    private func deleteAuhtUser() async throws {
        do {
            if let user = userSession {
                try await authService.deleteUser(user: user)
            }
        } catch {
            throw error
        }
    }

    // MARK: - Firestrore

    func getUserFromDB() async throws {
        do {
            if let id = userSession?.uid {
                let snapshot = try await firestoreService.getUser(id: id)

                currentUser = try snapshot.data(as: User.self)

                Log.info("Get user")
            }
        } catch {
            throw error
        }
    }

    func addWorkoutToDB(workout: Workout) async throws {
        do {
            let encodeWorkout = try Firestore.Encoder().encode(workout)

            if let id = userSession?.uid {
                try await firestoreService.updateWorkoutArray(id: id, encodedWorkout: encodeWorkout)
            }

        } catch {
            throw error
        }
    }

    private func addUserToDB(user: User) async throws {
        do {
            let encodedUser = try Firestore.Encoder().encode(user)

            try await firestoreService.addUser(id: user.id, encodedUser: encodedUser)
        } catch {
            throw error
        }
    }

    private func deleteUserFromDB() async throws {
        do {
            if let id = userSession?.uid {
                try await firestoreService.deleteUser(id: id)
            }
        } catch {
            throw error
        }
    }
}
