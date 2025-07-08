// Hardhat deployment script for PingPongLeaderboard contract
// Usage: npx hardhat run deploy-contract.js --network arbitrum

const { ethers } = require("hardhat");

async function main() {
    console.log("Deploying PingPongLeaderboard contract to Arbitrum...");
    
    // Get the contract factory
    const PingPongLeaderboard = await ethers.getContractFactory("PingPongLeaderboard");
    
    // Deploy the contract
    console.log("Deploying contract...");
    const contract = await PingPongLeaderboard.deploy();
    
    // Wait for deployment to complete
    await contract.deployed();
    
    console.log("✅ Contract deployed successfully!");
    console.log("📍 Contract address:", contract.address);
    console.log("🔗 Arbitrum Explorer:", `https://arbiscan.io/address/${contract.address}`);
    
    // Verify basic functionality
    console.log("\n🧪 Testing contract...");
    
    try {
        const totalScores = await contract.getTotalScores();
        console.log("✅ Contract is responsive. Total scores:", totalScores.toString());
        
        const winningScore = await contract.WINNING_SCORE();
        console.log("✅ Winning score requirement:", winningScore.toString());
        
        const maxLeaderboard = await contract.MAX_LEADERBOARD_SIZE();
        console.log("✅ Max leaderboard size:", maxLeaderboard.toString());
        
    } catch (error) {
        console.log("❌ Contract test failed:", error.message);
    }
    
    console.log("\n📝 Next steps:");
    console.log("1. Update CONTRACT_ADDRESS in ping-pong-v2.html to:", contract.address);
    console.log("2. Deploy the game to your hosting platform");
    console.log("3. Test the full integration");
    
    console.log("\n💡 Remember:");
    console.log("- Users need MetaMask with Arbitrum network");
    console.log("- Small amount of ETH needed for gas fees (~$0.01 per score)");
    console.log("- Game works without wallet but no blockchain features");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error("❌ Deployment failed:", error);
        process.exit(1);
    });