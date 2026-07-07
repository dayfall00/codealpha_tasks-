# CodeAlpha Polling System Smart Contract

A decentralized polling and voting smart contract developed using Solidity as part of the CodeAlpha Blockchain Development Internship.

## 📌 Project Overview

This project allows users to create polls, vote securely, and determine the winning option after the voting deadline.

The contract uses Solidity mappings, structs, and timestamp-based restrictions to ensure secure and fair voting.

---

## 🚀 Features

- Create custom polls
- Add multiple voting options
- Secure one-person-one-vote system
- Time-restricted voting
- Automatic winner calculation
- Store votes securely using mappings

---

## 🛠 Technologies Used

- Solidity ^0.8.20
- Remix IDE
- Ethereum Virtual Machine (EVM)

---

## ▶️ How It Works

1. A user creates a poll with:
   - Poll title
   - Voting options
   - Voting duration

2. Users can vote before the deadline.

3. Each wallet address can vote only once.

4. After the poll ends, the winning option can be retrieved.

---

## ✅ Functionalities Implemented

- Poll Creation
- Voting Mechanism
- Vote Tracking
- Deadline Validation
- Winner Declaration
- Option & Vote Count Retrieval

---

## 📚 Learning Outcomes

Through this project, I learned:

- Solidity structs and mappings
- Smart contract logic design
- Time-based conditions using `block.timestamp`
- State-changing and view functions
- Blockchain voting mechanisms
- Smart contract deployment and testing

---

## 🧪 Testing

The contract was successfully:
- Compiled
- Deployed
- Tested on Remix VM

Tested functionalities include:
- Creating polls
- Casting votes
- Restricting duplicate votes
- Checking vote counts
- Declaring winners after deadline

---

## 👨‍💻 Author

**Aditya Bhardwaj**

Blockchain Development Internship — CodeAlpha

---

## 🔗 Internship Domain

Blockchain Development Internship at CodeAlpha#