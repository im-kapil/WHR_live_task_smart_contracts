// Make a sale contract for "WHR" token. user can participate in sale by usdt or ether. Where price of 
// token is 75 tokens/usdt & 750 tokens/ether. hardcap is 100000 "WHR" tokens. Make a simple frontend to 
// interact with smartcontract. Handle wallet events like account change and chain change.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./WHR.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract WHRSale{
    IERC20 public whrToken = IERC20(0xDA07165D4f7c84EEEfa7a4Ff439e039B7925d3dF);
    IERC20 public usdtToken = IERC20(0x2E9d30761DB97706C536A112B9466433032b28e3);

    uint totalTokenSold = 0; //750 //10000000

    function ParticipateUsingUSDT(uint amount) public returns(bool){
        require(totalTokenSold <= 100000, "Sale Is Over");
        usdtToken.transferFrom(msg.sender, address(this), amount);
        uint whrTOkenToTransfer = amount * 75;
        whrToken.transfer(msg.sender, whrTOkenToTransfer);
        totalTokenSold = whrTOkenToTransfer;
        return true;
    }

    
    function ParticipateUsingEth(uint amount) public payable returns(bool){
        require(totalTokenSold <= 100000, "Sale Is Over");
        payable(address(this)).transfer(amount);
        uint whrTOkenToTransfer = amount * 750;
        whrToken.transfer(msg.sender, whrTOkenToTransfer);

         totalTokenSold = whrTOkenToTransfer;
        return true;

    }
}
