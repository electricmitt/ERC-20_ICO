pragma solidity ^0.6.3;

import "Token.sol";

/**
 * @title Standard ERC20 token
 * @dev Implementation of the basic standard token.
 * https://github.com/ethereum/EIPs/blob/master/EIPs/eip-20.md
 */
contract StandardToken is Token {
    mapping(address => uint256) internal _balances;
    mapping (address => mapping (address => uint256)) internal _allowed;
    uint256 internal _totalSupply;

    function totalSupply() external view override returns (uint256 supply) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view override returns (uint256) {
        return _balances[_owner];
    }

    function allowance(address _owner, address _spender) public view override returns (uint256) {
        return _allowed[_owner][_spender];
    }

    function transfer(address _to, uint256 _value) public override returns (bool) {
        require(_value <= _balances[msg.sender]);
        require(_to != address(0));

        /**
         * If your token leaves out `totalSupply` and can issue more tokens as time goes on,
         * you need to check your values don't wrap/overflow.
         */
         require(_balances[_to] + _value > 0);

         _balances[msg.sender] -= _value;
         _balances[_to] += _value;
         emit Transfer(msg.sender, _to, value);
         return true;
    }

    function approve(address _spender, uint256 _value) public override returns (bool) {
        require(_spender) != address(0);

        _allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferForm(address _from, address _to, uint256 _value) public override returns (bool) {
        require(_value <= _balances[_from]);
        require(_value <= _allowed[_from][msg.sender]);
        require(_to != address(0));
        require(_balances[_to] + _value > 0);

        _balances[_from] -= _value;
        _allowed[_from][msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}