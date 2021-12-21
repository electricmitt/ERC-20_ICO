pragma solidity ^0.6.3;

import "StandardToken.sol";

contract BlockchainDevToken is StandardToken {

    /**
     * Public variables of the token
     * NOTE: The following variables are OPTIONAL vanities. One does not have to include them.
     * They allow one to customise the token contract & in no way influences the core functionality.
     * Some wallets/interfaces might not even bother to look at this information.
     */
    string public name;                     // Token Name
    uint256 public decimals;                 // Number of decimals that our token will have. To be standard-complaint, keep it 18.
    string public symbol;                   // A short indentifier for your contract (eg. ACAD for Academy Token, EOS, etc.).
    uint256 public unitsOneEthCanBuy;       // How many units of your token can be bought by 1 ETH? (eg. 1 ETH (1000000000000000000 wei) = 10 tokens).
    uint256 public totalRaisedEthInWei;     // WEI is the smallest unit of ETH. Similar to cent in USD or Satoshi in BTC. This is the TOTAL raised eth of the ICO.
    address payable public owner;           // The raised ETH will go to this account.

    constructor() public {
        decimals = 18;                          // Number of decimals for you token.
        _totalSupply = 1000000000000000000;     // Update the total supply fo your token. (1000)
        _balances[msg.sender] = _totalSupply;   // Grant the contract creator all initial tokens. In this case, it is set to 1000.
                                                // Example: If you want your initial tokens to be 500 and your decimals is 6, set this value to: (500 * 10^6).
        name = "Blockchain Dev Token";          // Set name. For display purposes.
        symbol = "BDT";                         // Set symbol. For display purposes.
        unitsOneEthCanBuy = 10;                 // Set the price of your token for the ICO.
                                                // In this case, if users pay 1 ETH, they will receive 10 BDT.
        owner = msg.sender;                     // Owner of this contract get the total ETH raised.
    }

    /** 
     * As of Solidity 0.6.0, if you want your contract to receive Ether, you have to implement a receive Ether function
     * (using payable fallback functions for receiving Ether is not recommended, since it would not fail on interface confusions).
     */
     receive() external payable {
         totalRaisedEthInWei = totalRaisedEthInWei + msg.value;
         uint256 amount = msg.value * unitsOneEthCanBuy;
         require(_balance[Owner] >= amount);
         _balances[owner] -= amount;
         _balances[msg.sender] += amount;
         Transfer(owner, msg.sender, amount);
         owner.transfer(msg.value);
     }
}