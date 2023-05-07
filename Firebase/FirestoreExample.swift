//
//  Fire.swift
//  DNC Scrubber
//
//  Created by Joshua Imholte on 8/26
//

import Foundation
import Firebase



let store = Firestore.firestore()
var currentUser: User!



func create(user: User, completion: @escaping (_ result: UserResult, _ user: User) -> Void) {
    let ref = store.collection("users").document(user.email)
    ref.setData([
        "data": user.data
    ], completion: { err in
        if err == nil {
            completion(.createSuccessful, user)
        } else {
            completion(.createUnsuccessful, user)
        }
    })
}

func authenticate(email: String, privateKey: String, completion: @escaping (_ result: UserResult, _ user: User) -> Void) {
    let ref = store.collection("users").document(email)
    ref.getDocument(completion: {(snapshot, err) in
        if err == nil {
            let serverKey = snapshot?.data()!["key"] as! String
            if (privateKey == serverKey) {
                completion(
                    .signInSuccessful,
                    User(
                        email: email,
                        key: privateKey,
                        data: snapshot?.data()!["data"] as! Data
                    )
                )
            } else {
                completion(
                    .incorrectPassword,
                    User()
                )
            }
        } else {
            completion(
                .incorrectUser,
                User()
            )
        }
    })
}

func update(user: User, type: UpdateType, completion: @escaping (_ result: UserResult, _ user: User) -> Void) {
    let ref = store.collection("users").document(user.email)
    
    switch type {
        case _:
            //CASE
    }
    
}
