// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    //import "./TheNameofthecontract.sol"; is how we can bring over contracts in here
import "./Simple Storage.sol";

    //this is the second contract deployed as StorageFactory

contract StorageFactory {
    SimpleStorage[] public simpleStorageArray; 

        //How does storage factory know what simple storage looks like?
        //we can copy code from the simple storage right into here.^^^
        //a single solidity file can hold multiple smart contracts
    function createSimpleStorageContract() public {
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //Address
        // ABI - Application Binary Interface
        // ABI tells how it "can" interact with another contract
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return simpleStorage.retrieve();
        //shortcut, return simpleStorage[_simpleStorageIndex].retrieve(); this is a faster way to map the retrieve in cleaner code. 
    }

}
