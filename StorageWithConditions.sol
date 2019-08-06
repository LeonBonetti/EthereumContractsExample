
pragma solidity >=0.4.22 <0.6.0;

contract StorageWithConditions {
    uint mainStorage;
    address owner;
    struct SSetter {
        uint qtdSets;
        bool able;
    }
    mapping(address => SSetter) public setters;

    address[] public permittedSetters;

    constructor(address[] memory ableSetters) public {
        owner = msg.sender;
        setters[owner].able = true;
        for(uint i = 0; i < ableSetters.length; i++){
            permittedSetters.push(ableSetters[i]);
            setters[ableSetters[i]].able = true;
            setters[ableSetters[i]].qtdSets = 5;
        }
    }
    function validSetter(address setter) public view returns (bool){
        for(uint i = 0; i < permittedSetters.length; i++){
                if(setter == permittedSetters[i]) return true;
        }
        return false;
    }
    function set(uint x) public {
        require(validSetter(msg.sender),"You are not a setter");
        require(setters[msg.sender].able, 'You are unable to vote');
        mainStorage = x;
        setters[msg.sender].qtdSets -= 1;
        if(setters[msg.sender].qtdSets == 0){
            setters[msg.sender].able = false;
        }
    }
    function get() public view returns (uint) {
        return mainStorage;
    }
}