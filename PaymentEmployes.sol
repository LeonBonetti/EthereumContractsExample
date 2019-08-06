pragma solidity >=0.4.22 <0.6.0;

contract PaymentEmployesHask {

    uint totalAmount;

    address payable[] employes;

    constructor(address payable[] memory permittedEmployes) public {
        totalAmount = 0;

        employes.push(msg.sender);

        for(uint i = 0; i < permittedEmployes.length; i++){
            employes.push(permittedEmployes[i]);
        }
    }

    // fallback function
    function () external payable {
        totalAmount += msg.value;
        require(totalAmount % employes.length == 0, 'Invalid value to transfer');

        for(uint i = 0; i < employes.length; i++){
            employes[i].transfer(totalAmount/employes.length);
        }

    }
}