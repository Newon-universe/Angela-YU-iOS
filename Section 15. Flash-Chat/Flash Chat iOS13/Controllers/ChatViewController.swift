//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    
    var messages:[Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        let title = "⚡️FlashChat"
        navigationItem.hidesBackButton = true
        navigationItem.title = title
        
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        loadMessages()
    }
    
    func loadMessages() {
        
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            if let e = error {
                print("There was an issue retrieving data from Firestore. \(e)")
            } else {
                self.messages = []
                
                guard let snapshotDocuments = querySnapshot?.documents else { return }
                
                for doc in snapshotDocuments {
                    let data = doc.data()
                    guard let messageSender = data[K.FStore.senderField] as? String else { return }
                    guard let messageBody = data[K.FStore.bodyField] as? String else { return }
                    
                    let newMessages = Message(sender: messageSender, body: messageBody)
                    self.messages.append(newMessages)
                    
                    // closure process is on background, so make reload and showing data in main thread
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                        self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        guard let user = Auth.auth().currentUser?.email else { return }
        guard let body = messageTextfield.text else { return }
        
        let messageBody = body
        let messageSender = user
        
        db.collection(K.FStore.collectionName).addDocument(data: [
            K.FStore.senderField: messageSender,
            K.FStore.bodyField: messageBody,
            K.FStore.dateField: Date().timeIntervalSince1970
        ]) { (error) in
            if let e = error {
                print("There was an issue saving data to firestoe, \(e)")
            } else {
                DispatchQueue.main.async {
                    self.messageTextfield.text = ""
                }
                print("Successfully saved data.")
            }
        }
        
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

//MARK: - TableView DataSource
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath) as! MessageCell
        
        // This is message from the current user.
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: K.BrandColors.purple)
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: K.BrandColors.purple)
            cell.label.textColor = UIColor(named: K.BrandColors.lightPurple)
        }
        
        
        cell.label.text = message.body
        return cell
    }
}
