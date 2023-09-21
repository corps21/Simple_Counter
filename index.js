import {ethers} from './ethers.min.js';

const Connectbutton = document.querySelector("#connectButton")
const GetButton = document.querySelector("#getButton")
const Setbutton = document.querySelector("#setButton")
const input = document.querySelector("#inputText")
const incrementButton = document.querySelector("#Increase");
Connectbutton.onclick = connect;
GetButton.onclick = getNumber;
Setbutton.onclick = setNumber;
incrementButton.onclick = increment;

let provider;
let signer;

const contractAddress = "0x5FbDB2315678afecb367f032d93F642f64180aa3";
const contractAbi = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "inputs": [],
    "name": "decrement",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "increment",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "number",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [],
    "name": "owner",
    "outputs": [
      {
        "internalType": "address",
        "name": "",
        "type": "address"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "newNumber",
        "type": "uint256"
      }
    ],
    "name": "setNumber",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
]

async function connect() {
    if(typeof window.ethereum !== undefined) {
        try {
            provider = new ethers.BrowserProvider(window.ethereum);
            signer = await provider.getSigner();
        } catch (error) {
            console.log(error)
        }
    }
}

async function getNumber() {
    await connect();
    const contract = new ethers.Contract(contractAddress,contractAbi,signer);
    const number = await contract.number();
    console.log(number);
}

async function setNumber() {
    await connect();
    const contract = new ethers.Contract(contractAddress,contractAbi,signer);
    await contract.setNumber(input.value);
    console.log("Setting the number");
}

async function increment() {
    await connect();
    const contract = new ethers.Contract(contractAddress,contractAbi,signer);
    await contract.increment();
    console.log("incrementting the Number");
}
