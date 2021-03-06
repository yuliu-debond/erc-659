pragma solidity ^0.6.8;
import "./util/ERC20.sol";
// SPDX-License-Identifier: apache 2.0
contract TestTokena is ERC20{
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    address public bank_contract;
    address public dev_address;
    /**
     * @dev Sets the values for `name`, `symbol`, and `decimals`. All three of
     * these values are immutable: they can only be set once during
     * construction.
     */
    constructor (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
        dev_address = msg.sender;
    }

    /**
     * @dev Returns the name of the token.
     */
     
    function setContract(address contract_address) public returns (bool) {
        require(msg.sender==dev_address);
        bank_contract = contract_address;
    }
    
    function mint(address _to, uint256 _amount) public returns (bool) {
        require(msg.sender==bank_contract);
        _mint(_to, _amount);
    }
    
    function name() public view returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token, usually a shorter version of the
     * name.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     * For example, if `decimals` equals `2`, a balance of `505` tokens should
     * be displayed to a user as `5,05` (`505 / 10 ** 2`).
     *
     * Tokens usually opt for a value of 18, imitating the relationship between
     * Ether and Wei.
     *
     * NOTE: This information is only used for _display_ purposes: it in
     * no way affects any of the arithmetic of the contract, including
     * {IERC20-balanceOf} and {IERC20-transfer}.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
}