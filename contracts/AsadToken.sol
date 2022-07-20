// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract AsadToken is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    enum Types {
        PLATINUM,
        GOLD,
        SILVER,
        BRONZE,
        IRON
    }

    mapping(uint256 => uint256) public typeToSupply;
    mapping(uint256 => uint256) public totalMint;
    mapping(uint256 => uint256) public prices;

    modifier idExists(uint256 id) {
        require(id >= 0 && id <= 4, "Id Not Exists");
        _;
    }

    constructor() ERC721("AsadToken", "ASD") {
        typeToSupply[uint256(Types.PLATINUM)] = 4;
        typeToSupply[uint256(Types.GOLD)] = 4;
        typeToSupply[uint256(Types.SILVER)] = 4;
        typeToSupply[uint256(Types.BRONZE)] = 4;
        typeToSupply[uint256(Types.IRON)] = 4;

        prices[uint256(Types.PLATINUM)] = 0.8 ether;
        prices[uint256(Types.GOLD)] = 0.5 ether;
        prices[uint256(Types.SILVER)] = 0.3 ether;
        prices[uint256(Types.BRONZE)] = 0.2 ether;
        prices[uint256(Types.IRON)] = 0.15 ether;
    }

    function safeMint(uint256 id) public payable onlyOwner idExists(id) {
        // if (id == uint256(Types.PLATINUM)) {
            require(msg.value == prices[id], "Don't have Ether");
            totalMint[id]++;
            uint256 tokenId = _tokenIdCounter.current();
            _tokenIdCounter.increment();
            require(
                totalMint[id] <=
                    typeToSupply[id],
                "Can't Mint more"
            );

            _safeMint(msg.sender, tokenId);

            
        // } else if (id == uint256(Types.GOLD)) {
        //     require(msg.value == 0.5 ether, "Don't have Ether");
        //     totalMint[uint256(uint256(Types.GOLD))]++;
        //     uint256 tokenId = _tokenIdCounter.current();
        //     _tokenIdCounter.increment();
        //     require(
        //         totalMint[uint256(uint256(Types.GOLD))] <=
        //             typeToSupply[uint256(Types.GOLD)],
        //         "Can't Mint more"
        //     );
        //     _safeMint(msg.sender, tokenId);
        // }else if (id == uint256(Types.SILVER)) {
        //     require(msg.value == 0.3 ether, "Don't have Ether");
        //     totalMint[uint256(uint256(Types.SILVER))]++;
        //     uint256 tokenId = _tokenIdCounter.current();
        //     _tokenIdCounter.increment();
        //     require(
        //         totalMint[uint256(uint256(Types.SILVER))] <=
        //             typeToSupply[uint256(Types.SILVER)],
        //         "Can't Mint more"
        //     );
        //     _safeMint(msg.sender, tokenId);
        // }else if (id == uint256(Types.BRONZE)) {
        //     require(msg.value == 0.2 ether, "Don't have Ether");
        //     totalMint[uint256(uint256(Types.BRONZE))]++;
        //     uint256 tokenId = _tokenIdCounter.current();
        //     _tokenIdCounter.increment();
        //     require(
        //         totalMint[uint256(uint256(Types.BRONZE))] <=
        //             typeToSupply[uint256(Types.BRONZE)],
        //         "Can't Mint more"
        //     );
        //     _safeMint(msg.sender, tokenId);
        // }else if (id == uint256(Types.IRON)) {
        //     require(msg.value == 0.15 ether, "Don't have Ether");
        //     totalMint[uint256(uint256(Types.IRON))]++;
        //     uint256 tokenId = _tokenIdCounter.current();
        //     _tokenIdCounter.increment();
        //     require(
        //         totalMint[uint256(uint256(Types.IRON))] <=
        //             typeToSupply[uint256(Types.IRON)],
        //         "Can't Mint more"
        //     );
        //     _safeMint(msg.sender, tokenId);
        // }
    }
}
