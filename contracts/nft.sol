//Contract based on https://docs.openzeppelin.com/contracts/3.x/erc721
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.7.3;

    import "OpenZeppelin/openzeppelin-contracts@3.1.0-solc-0.7/contracts/token/ERC721/ERC721.sol";
    import "OpenZeppelin/openzeppelin-contracts@3.1.0-solc-0.7/contracts/utils/Counters.sol";
    import "OpenZeppelin/openzeppelin-contracts@3.1.0-solc-0.7/contracts/access/Ownable.sol";


    contract RedditYearReview is ERC721, Ownable {
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;

        constructor() public ERC721("Reddit Year in Review", "RYIR") {}

        function mintNFT(address recipient, string memory tokenURI)
            public onlyOwner
            returns (uint256)
        {
            _tokenIds.increment();

            uint256 newItemId = _tokenIds.current();
            _mint(recipient, newItemId);
            _setTokenURI(newItemId, tokenURI);

            return newItemId;
        }
    }