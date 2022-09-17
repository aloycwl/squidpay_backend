pragma solidity>0.8.0;//SPDX-License-Identifier:None
contract Main{

    uint private _count;
    address private _owner;
    mapping(uint=>uint)private inventory;

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
        Set count to always be the highest item number
        */
        for(uint i;i<item.length;i++){
            if(inventory[item[i]]!=count[i])inventory[item[i]]=count[i];
            if(item[i]>=_count)_count=item[i]+1;
        }
    }

    function display()external view returns(uint[]memory count){
        /*
        Convert all items into json format
        To input pagination?
        */
        count=new uint[](_count);
        for(uint i;i<_count;i++)count[i]=inventory[i];
    }
}