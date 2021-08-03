pragma solidity >=0.4.21 <0.6.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    address payable employee_one;
    address payable employee_two;
    address payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one; // 0x443B02B822a19BB96e64a9A673EdAA4027eD9b62
        employee_two = _two;  // 0x00786bBE030bB178693687c22ffCE593F51D904c
        employee_three = _three; // 0x631A3f43ffA216f97B346C3F2C896853290F70bc
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint amount = msg.value / 3;

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        msg.sender.transfer(msg.value - amount * 3);
    }

    function() external payable {
        deposit();
    }

}
