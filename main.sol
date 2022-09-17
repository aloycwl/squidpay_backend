pragma solidity>0.8.0;//SPDX-License-Identifier:None
contract Main{

    address private _owner;
    mapping(uint=>uint)public inventory;

    constructor(){
        /*
        Set owner
        */
        _owner=msg.sender;
    }

    function update(uint[]calldata item,uint[]calldata count)external{
        require(item.length==count.length,"Invalid count");
        require(_owner==msg.sender,"Invalid user");
        /*
        Loop through the entire array
        Only update when there is no similarity
        */
        for(uint i;i<item.length;i++)
            if(inventory[item[i]]!=count[i])
                inventory[item[i]]=count[i];
    }
}