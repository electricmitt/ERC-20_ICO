pragma solidity ^0.6.3;

/**
 * @title ERC20 Interface
 * @dev see https://gitub.com/ethereum/EIPs/issues/20
 */
 interface Token {
    /**
     * @return supply - The Total amount of tokens
     */
    function totalSupply() external view returns (uint256 supply);

    /**
     * @param_owner - The address from which the balance will be retrieved
     * @return balance - The token balance of the owner
     */
    function balanceOf(address _owner) external view returns (uint256 balance);

    /**
     * @notice - Returns the remaining number of tokens that spender will be allowed to spend on behalf of owner through transferFrom. This is zero by default.
     *           This value changes when approve or transferFrom are called.
     * @param _owner - The owner of the tokens
     * @param _spender - The authorized account to spend the balance of the owner
     * @return remaining - The remaining tokens that can be spent
     */
     function allowance(address _owner, address _spender)
        external
        view
        returns (uint256 remaining);

    /** 
     * @notice - Moves amount tokens from the caller's account to recipient
     * @param _to - The receiver of the tokens
     * @param _value - The value to be sent to the receiver
     * @return didOperationSucceed - Returns a boolean value indicating whether the operation succeeded.
     */
     function transfer(address _to, uint256 _value)
        external
        returns (bool didOperationSucceed);
    
    /**
     * @notice - Sets amount as the allowance of spender over the caller's tokens
     * @param _spender - An account that will be authorized to spend the balance on behalf of the owner
     * @param _value - The limit of authorized balance than can be spent
     * @return didOperationSucceed - Returns a boolean value indicating whether the operation succeeded.
     */
     function approve(address _spender, uint _value) external returns (bool didOperationSucceed);

    /**
     * @notice - Moves amount tokens from sender to recipient using the allowance mechanism, amount is then deducted from the caller's allowance
     * @param _from - The account source to get the tokens from
     * @param _to - The destination account which will receive the tokens
     * @param _value - The intended value of the tokens to be transferred
     * @return didOperationSucceed - Returns a boolean value indicating whether the operation succeeded.
     */
    function transferFrom(address _from, address _to, uint256 _value)
        external
        returns (bool didOperationSucceed);
    
    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
 }