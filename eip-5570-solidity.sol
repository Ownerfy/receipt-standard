pragma solidity ^0.8.0;
import "./IERC165.sol";

///
/// @dev Interface for eip-5570 Receipt Standard
/// Suggested code for https://eips.ethereum.org/EIPS/eip-5570
/// Discussion here: https://ethereum-magicians.org/t/idea-standard-digital-receipts-using-erc-721/9908
/// and here: https://github.com/ethereum/EIPs/pull/5570
///
interface IERC5570 is IERC165 {
    /// ERC165 bytes to add to interface array - set in parent contract
    /// implementing this standard
    ///
    /// Below needs to be calculated depending on final interface
    /// bytes4(keccak256("receipt(uint256,uint256)")) == 0xUNSET
    /// bytes4 private constant _INTERFACE_ID_ERC5570 = 0xUNSET;
    /// _registerInterface(_INTERFACE_ID_ERC5570);

    function paid(
        uint256 _tokenId,
    ) external view returns (
        uint256 goodsAndServices,
        uint256 fees,
        uint256 tax,
        bytes8 symbol
    );
    
    function buyer(
        uint256 _tokenId,
    ) external view returns (
        address buyerAddress
    );
    
    function seller(
        uint256 _tokenId,
    ) external view returns (
        address seller
    );
    
    // Optional - Used for the sale of things represented by NFTs
    // Returns all the tokenIds that were sold, their contracts, and prices 
    // The price should be in the symbol designated above.
    // It might be useful to have an NFT reference the receipt it was sold in 
    // and the reference receipt NFT would have to conform to this standard
    function purchasedItems(
        uint256 _tokenId,
    ) external view returns (
        uint256[] tokenId,
        address[] contract,
        uint256[] price
    );
}

interface IERC165 {
    /// @notice Query if a contract implements an interface
    /// @param interfaceID The interface identifier, as specified in ERC-165
    /// @dev Interface identification is specified in ERC-165. This function
    ///  uses less than 30,000 gas.
    /// @return `true` if the contract implements `interfaceID` and
    ///  `interfaceID` is not 0xffffffff, `false` otherwise
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}
