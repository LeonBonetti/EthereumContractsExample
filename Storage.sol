pragma solidity >=0.4.0 <0.7.0;
// pragma são instruções para os compiladores sobre como tratar o codigo fonte

contract SimpleStorage {
    uint storedData;
    // aqui declaramos uma variavel do tipo uint, que é um unsigned integer de 256 bits

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}