// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address addOfUser = makeAddr("user");

    function setUp() public {
        counter = new Counter();
        counter.setNumber(1);
    }

    function test_setNumber() external{
        uint256 numberToSet = 21;

        vm.startPrank(addOfUser);
        counter.setNumber(numberToSet);
        vm.stopPrank();

        uint256 result = counter.getNumber();

        assertEq(result, numberToSet);
    }

    function testfails_setNumber() external {
        uint256 numberToSet = 115792089237316195423570985008687907853269984665640564039457584007913129639935;

        vm.startPrank(addOfUser);
        vm.expectRevert();
        counter.setNumber(numberToSet + 1);
        vm.stopPrank();
    }

    function test_increment() external {
        uint256 beforetest = counter.getNumber();

        vm.startPrank(addOfUser);
        counter.increment();
        vm.stopPrank();

        uint256 afterTest = counter.getNumber();

        assertEq(beforetest + 1, afterTest);
    }

    function test_decrement() external {

        uint256 beforetest = counter.getNumber();

        vm.startPrank(addOfUser);
        counter.decrement();
        vm.stopPrank();

        uint256 afterTest = counter.getNumber();

        assertEq(beforetest - 1, afterTest);
    }

    function testfails_increment() external {
        uint256 number = 115792089237316195423570985008687907853269984665640564039457584007913129639935; //maximum number uint256 can store
        counter.setNumber(number);

        vm.startPrank(addOfUser);
        vm.expectRevert();
        counter.increment();
        vm.stopPrank();
    }

     function testfails_decrement() external {
        uint256 number = 0; //minimum number uint256 can store
 
        counter.setNumber(number);


        vm.startPrank(addOfUser);
        vm.expectRevert();
        counter.decrement();
        vm.stopPrank();
    }

}
