// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {

    int public value;

    event ValueChanged(int newValue);

    function increment() public {
        value += 1;
        emit ValueChanged(value);
    }

    function decrement() public {
        value -= 1;
        emit ValueChanged(value);
    }

    function setValue(int _value) public {
        value = _value;
        emit ValueChanged(value);
    }

    function getValue() public view returns(int) {
        return value;
    }
}
