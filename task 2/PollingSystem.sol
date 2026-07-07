// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract PollingSystem {

    struct Poll {
        string title;
        string[] options;
        uint[] voteCounts;
        uint endTime;
        bool exists;
    }

    uint public pollCount;

    mapping(uint => Poll) public polls;
    mapping(uint => mapping(address => bool)) public hasVoted;

    // Create a new poll
    function createPoll(
        string memory _title,
        string[] memory _options,
        uint _durationInMinutes
    ) public {

        require(_options.length > 1, "At least 2 options required");

        Poll storage newPoll = polls[pollCount];

        newPoll.title = _title;
        newPoll.endTime = block.timestamp + (_durationInMinutes * 1 minutes);
        newPoll.exists = true;

        for(uint i = 0; i < _options.length; i++) {
            newPoll.options.push(_options[i]);
            newPoll.voteCounts.push(0);
        }

        pollCount++;
    }

    // Vote in a poll
    function vote(uint _pollId, uint _optionIndex) public {

        Poll storage poll = polls[_pollId];

        require(poll.exists, "Poll does not exist");
        require(block.timestamp < poll.endTime, "Voting has ended");
        require(!hasVoted[_pollId][msg.sender], "Already voted");
        require(_optionIndex < poll.options.length, "Invalid option");

        poll.voteCounts[_optionIndex]++;
        hasVoted[_pollId][msg.sender] = true;
    }

    // Get winner
    function getWinner(uint _pollId) public view returns(string memory) {

        Poll storage poll = polls[_pollId];

        require(block.timestamp >= poll.endTime, "Poll still active");

        uint winningVoteCount = 0;
        uint winningIndex = 0;

        for(uint i = 0; i < poll.voteCounts.length; i++) {

            if(poll.voteCounts[i] > winningVoteCount) {
                winningVoteCount = poll.voteCounts[i];
                winningIndex = i;
            }
        }

        return poll.options[winningIndex];
    }

    // Get poll options
    function getOptions(uint _pollId) public view returns(string[] memory) {
        return polls[_pollId].options;
    }

    // Get vote counts
    function getVoteCounts(uint _pollId) public view returns(uint[] memory) {
        return polls[_pollId].voteCounts;
    }
}