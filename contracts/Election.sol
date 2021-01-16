// SPDX-License-Identifier: MIT; 
pragma solidity ^0.6.12;

contract Election {

/**
struct for tracking polls
 */

struct Poll {
string pollId;
//get choices
// choiceId => Choices;
mapping( uint256 => string) getChoices;
//choice => voteCount
mapping (string => uint256) voteCount;
}

/**
* struct array for storage pollid => pollStruct
*/

mapping (string => Poll) public polls;

/**
* User struct for storing user related data.
 */
struct User {
string pollId;
address voter;
}

/**
* User Struct array.
 */
User[] public users;


constructor() public {}

/*
event for voting stream
*/
event votedEvent(string indexed pollId, string indexed option);


/*
vote function 
 */
function vote(string memory _pollId, string memory _option,uint256 _id) public {

for (uint u =0; u < users.length; u++) {
       if( keccak256(abi.encodePacked((users[u].pollId))) ==
        keccak256(abi.encodePacked((_pollId))) && users[u].voter == msg.sender){
            revert("ERROR: You are already voted from this pollId"); 
        }
}

    if(keccak256(abi.encodePacked((polls[_pollId].pollId))) ==
            keccak256(abi.encodePacked((_pollId))) &&
            (keccak256(abi.encodePacked(polls[_pollId].getChoices[_id])) ==
                (keccak256(abi.encodePacked(_option)))) ){
                    polls[_pollId].voteCount[_option] +=1;    
 } 
else{

  // register the user  
  users.push(User({
    pollId: _pollId,
    voter: msg.sender
  }));

  // add to the poll array successfully

  polls[_pollId].pollId = _pollId;
  polls[_pollId].getChoices[_id] = _option;
  polls[_pollId].voteCount[_option] = 1;
  emit votedEvent(_pollId, _option);   
}

}

function getVotesCount(string memory _pollId,string memory _option) public view returns(uint256){
  return polls[_pollId].voteCount[_option];
}

function getNoOfUniqueVoters() public view returns(uint256){
  return users.length;
}

}