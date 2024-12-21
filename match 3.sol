// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MatchThreeGame {
    string public name = "MatchThreeEducationalGame";
    mapping(address => uint256) public playerTokens;
    mapping(address => uint256) public playerLevels;

    event TokensEarned(address indexed player, uint256 amount);
    event LevelCompleted(address indexed player, uint256 level);

    // Function to earn tokens when a level is completed
    function completeLevel(uint256 level) public {
        require(level > playerLevels[msg.sender], "You must complete levels in order.");
        
        playerLevels[msg.sender] = level;
        uint256 tokensEarned = level * 10; // Example: 10 tokens per level
        playerTokens[msg.sender] += tokensEarned;

        emit TokensEarned(msg.sender, tokensEarned);
        emit LevelCompleted(msg.sender, level);
    }

    // Function to get the number of tokens a player has
    
    function getTokens() public view returns (uint256) {
        return playerTokens[msg.sender];
    }

    // Function to withdraw tokens (for demonstration purposes)
    function withdrawTokens() public {
        uint256 tokens = playerTokens[msg.sender];
        require(tokens > 0, "No tokens to withdraw.");
        
        playerTokens[msg.sender] = 0; // Reset tokens
        // Logic to transfer tokens to the player (not implemented in this example)
    }
}