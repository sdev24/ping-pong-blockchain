// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PingPongLeaderboard {
    struct GameScore {
        address player;
        uint256 score;
        uint256 timestamp;
        bool singlePlayer;
        string playerName;
    }
    
    // Events
    event ScoreSubmitted(address indexed player, uint256 score, bool singlePlayer, uint256 timestamp);
    
    // Storage
    mapping(address => uint256) public highScores;
    mapping(address => uint256) public singlePlayerHighScores;
    mapping(address => string) public playerNames;
    GameScore[] public allScores;
    
    // Constants
    uint256 public constant MAX_LEADERBOARD_SIZE = 100;
    uint256 public constant WINNING_SCORE = 15;
    
    // Modifiers
    modifier validScore(uint256 score) {
        require(score >= WINNING_SCORE, "Score must be at least 15 to win");
        _;
    }
    
    modifier validName(string memory name) {
        require(bytes(name).length > 0 && bytes(name).length <= 32, "Invalid name length");
        _;
    }
    
    /**
     * @dev Submit a game score to the leaderboard
     * @param score The final score achieved
     * @param singlePlayer Whether this was a single-player game
     * @param name Optional player name (empty string to keep existing)
     */
    function submitScore(
        uint256 score, 
        bool singlePlayer, 
        string memory name
    ) external validScore(score) {
        address player = msg.sender;
        
        // Update player name if provided
        if (bytes(name).length > 0 && bytes(name).length <= 32) {
            playerNames[player] = name;
        }
        
        // Update high scores
        if (singlePlayer) {
            if (score > singlePlayerHighScores[player]) {
                singlePlayerHighScores[player] = score;
            }
        } else {
            if (score > highScores[player]) {
                highScores[player] = score;
            }
        }
        
        // Add to all scores history
        allScores.push(GameScore({
            player: player,
            score: score,
            timestamp: block.timestamp,
            singlePlayer: singlePlayer,
            playerName: bytes(playerNames[player]).length > 0 ? playerNames[player] : ""
        }));
        
        // Keep leaderboard size manageable
        if (allScores.length > MAX_LEADERBOARD_SIZE) {
            // Remove oldest score
            for (uint256 i = 0; i < allScores.length - 1; i++) {
                allScores[i] = allScores[i + 1];
            }
            allScores.pop();
        }
        
        emit ScoreSubmitted(player, score, singlePlayer, block.timestamp);
    }
    
    /**
     * @dev Get leaderboard for multiplayer games
     * @param limit Maximum number of entries to return
     */
    function getMultiplayerLeaderboard(uint256 limit) external view returns (GameScore[] memory) {
        require(limit > 0 && limit <= MAX_LEADERBOARD_SIZE, "Invalid limit");
        
        uint256 count = 0;
        GameScore[] memory temp = new GameScore[](allScores.length);
        
        // Filter multiplayer scores
        for (uint256 i = 0; i < allScores.length; i++) {
            if (!allScores[i].singlePlayer) {
                temp[count] = allScores[i];
                count++;
            }
        }
        
        // Sort by score (descending) and return top 'limit' entries
        GameScore[] memory result = new GameScore[](count > limit ? limit : count);
        
        // Simple bubble sort for small datasets
        for (uint256 i = 0; i < count - 1; i++) {
            for (uint256 j = 0; j < count - i - 1; j++) {
                if (temp[j].score < temp[j + 1].score) {
                    GameScore memory tempScore = temp[j];
                    temp[j] = temp[j + 1];
                    temp[j + 1] = tempScore;
                }
            }
        }
        
        uint256 resultSize = count > limit ? limit : count;
        for (uint256 i = 0; i < resultSize; i++) {
            result[i] = temp[i];
        }
        
        return result;
    }
    
    /**
     * @dev Get leaderboard for single-player games
     * @param limit Maximum number of entries to return
     */
    function getSinglePlayerLeaderboard(uint256 limit) external view returns (GameScore[] memory) {
        require(limit > 0 && limit <= MAX_LEADERBOARD_SIZE, "Invalid limit");
        
        uint256 count = 0;
        GameScore[] memory temp = new GameScore[](allScores.length);
        
        // Filter single-player scores
        for (uint256 i = 0; i < allScores.length; i++) {
            if (allScores[i].singlePlayer) {
                temp[count] = allScores[i];
                count++;
            }
        }
        
        // Sort by score (descending) and return top 'limit' entries
        GameScore[] memory result = new GameScore[](count > limit ? limit : count);
        
        // Simple bubble sort for small datasets
        for (uint256 i = 0; i < count - 1; i++) {
            for (uint256 j = 0; j < count - i - 1; j++) {
                if (temp[j].score < temp[j + 1].score) {
                    GameScore memory tempScore = temp[j];
                    temp[j] = temp[j + 1];
                    temp[j + 1] = tempScore;
                }
            }
        }
        
        uint256 resultSize = count > limit ? limit : count;
        for (uint256 i = 0; i < resultSize; i++) {
            result[i] = temp[i];
        }
        
        return result;
    }
    
    /**
     * @dev Get a player's statistics
     * @param player Address of the player
     */
    function getPlayerStats(address player) external view returns (
        uint256 multiplayerHigh,
        uint256 singlePlayerHigh,
        string memory name,
        uint256 totalGames
    ) {
        multiplayerHigh = highScores[player];
        singlePlayerHigh = singlePlayerHighScores[player];
        name = playerNames[player];
        
        // Count total games
        uint256 gameCount = 0;
        for (uint256 i = 0; i < allScores.length; i++) {
            if (allScores[i].player == player) {
                gameCount++;
            }
        }
        totalGames = gameCount;
    }
    
    /**
     * @dev Get total number of scores recorded
     */
    function getTotalScores() external view returns (uint256) {
        return allScores.length;
    }
    
    /**
     * @dev Get recent scores
     * @param limit Maximum number of recent scores to return
     */
    function getRecentScores(uint256 limit) external view returns (GameScore[] memory) {
        require(limit > 0 && limit <= MAX_LEADERBOARD_SIZE, "Invalid limit");
        
        uint256 startIndex = allScores.length > limit ? allScores.length - limit : 0;
        uint256 resultSize = allScores.length - startIndex;
        
        GameScore[] memory result = new GameScore[](resultSize);
        
        for (uint256 i = 0; i < resultSize; i++) {
            result[i] = allScores[startIndex + i];
        }
        
        return result;
    }
}