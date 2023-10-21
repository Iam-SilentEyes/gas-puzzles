// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

//@dev creating a library for the structs saved a ton of gas

library VoteLibrary {
    struct Voter {
        uint8 vote;
        uint8 voted;
    }

    struct Proposal {
        uint8 voteCount;
        bool ended;
        bytes32 name;
    }
}

contract OptimizedVote {

    mapping(address => VoteLibrary.Voter) public voters;

    VoteLibrary.Proposal[] proposals;

    function createProposal(bytes32 _name) external {
        proposals.push(VoteLibrary.Proposal({voteCount: 0, name: _name, ended: false}));
    }

    function vote(uint8 _proposal) external {
        VoteLibrary.Voter storage _voter=  voters[msg.sender];
        require(_voter.voted == 0, 'already voted');
        _voter.vote = _proposal;

        _voter.voted =1;

        unchecked{
              proposals[_proposal].voteCount += 1;
        }
      
    }

    function getVoteCount(uint8 _proposal) external view returns (uint8) {
        return proposals[_proposal].voteCount;
    }
}




