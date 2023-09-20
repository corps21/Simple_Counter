// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;
    address addOfOwner = makeAddr("owner");
    address addOfUser = makeAddr("user");

    function setUp() public {
        vm.startPrank(addOfOwner);
        counter = new Counter();
        counter.setNumber(1);
        vm.stopPrank();
    }

    function test_setNumber() external{
        uint256 numberToSet = 21;

        vm.startPrank(addOfOwner);
        counter.setNumber(numberToSet);
        vm.stopPrank();

        uint256 result = counter.number();

        assertEq(result, numberToSet);
    }

    function testfails_setNumber() external {
        uint256 numberToSet = 21;

        vm.startPrank(addOfUser);
        vm.expectRevert();
        counter.setNumber(numberToSet);
        vm.stopPrank();
    }

    function test_increment() external {
        uint256 beforetest = counter.number();

        vm.startPrank(addOfUser);
        counter.increment();
        vm.stopPrank();

        uint256 afterTest = counter.number();

        assertEq(beforetest + 1, afterTest);
    }

    function test_decrement() external {

        uint256 beforetest = counter.number();

        vm.startPrank(addOfUser);
        counter.decrement();
        vm.stopPrank();

        uint256 afterTest = counter.number();

        assertEq(beforetest - 1, afterTest);
    }

    function testfails_increment() external {
        uint256 number = 115792089237316195423570985008687907853269984665640564039457584007913129639935; //maximum number uint256 can store
        vm.startPrank(addOfOwner);
        counter.setNumber(number);
        vm.stopPrank();

        vm.startPrank(addOfUser);
        vm.expectRevert();
        counter.increment();
        vm.stopPrank();
    }

     function testfails_decrement() external {
        uint256 number = 0; //minimum number uint256 can store
        vm.startPrank(addOfOwner);
        counter.setNumber(number);
        vm.stopPrank();

        vm.startPrank(addOfUser);
        vm.expectRevert();
        counter.decrement();
        vm.stopPrank();
    }

}
