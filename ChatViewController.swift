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
    
    // meat26 madhavan
    //manas21 manas21
    let db = Firestore.firestore()
    var messages : [Message] = [] // this is an array message of type Message.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = k.appname
        tableView.dataSource = self
        navigationItem.hidesBackButton = true
        //registering our tableview
        tableView.register(UINib(nibName: k.cellNibName, bundle: nil), forCellReuseIdentifier: k.cellIdentifier)
        // we will be retriving the chat history of the user from the database and displaying it when logined
        
        loadMessages();
    }
    
    
    
    func loadMessages(){
        
        // clearing the message array
        // the below line is used to retreive the data from the database
        db.collection(k.FStore.collectionName).order(by:k.FStore.dateField).addSnapshotListener { querysnapshot, error in
            // clearing the message array
            self.messages = []
            if let e = error{
                print("there was an issue\(e)")
            }
            else{
                //querysnapshot will contain the retrived data
                if let snapshotdocuments = querysnapshot?.documents{
                    for doc in snapshotdocuments{
                        let data = doc.data()
                        if let messageSender = data[k.FStore.senderField] as? String, let messageBody =
                            data[k.FStore.bodyField]as?String{
                            let newmessage = Message(sender: messageSender , body: messageBody)
                            self.messages.append(newmessage)
                            DispatchQueue.main.async{
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
                
            }
        }
    }
    
    //k.FStore.senderField, these are basically used for our convenince of not always writing the variable name in every place. we can directly access the name from the constant file.
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messagebody = messageTextfield.text,
           let messagesender = Auth.auth().currentUser?.email{
            db.collection(k.FStore.collectionName).addDocument(data:[k.FStore.senderField: messagesender, 
                                                                     k.FStore.bodyField: messagebody,
                                                                     //sort data received from firebase
                                                                     k.FStore.dateField:Date().timeIntervalSince1970]){
                (error) in
                if let e = error{
                    print("errror")
                }
                else{
                    print("successfully saved data")
                }
                
            }
        }
    }
    
    // the below code bring's the user back to the welcomescreenwhen logout is pressed.
    
    @IBAction func LogOutPress(_ sender: UIBarButtonItem) {
        
        do{
            try Auth.auth().signOut()
            
            if let WelcomeViewController = self.navigationController?.viewControllers.first(where: { $0 is WelcomeViewController }) {
                self.navigationController?.popToViewController(WelcomeViewController, animated: true)
            }
        }catch let signOutError as NSError{
            print("Error signing out: %@", signOutError)
        }
    }
}
    
    //extension is always made outside of the class

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard indexPath.row < messages.count else {
            // Handle the case where the index is out of range
            // This could be, for example, by returning an empty cell or a default cell
            return UITableViewCell()
        }

        let message = messages[indexPath.row]

        // Your existing code for handling messages from the current user
        if message.sender == Auth.auth().currentUser?.email ?? "" {
            // Your code here
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: k.cellIdentifier, for: indexPath) as! MessageCell
        cell.label?.text =  message.body
        return cell
    }
}

    

