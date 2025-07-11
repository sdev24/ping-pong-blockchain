// Simple deployment script
const { ethers } = require("hardhat");

async function main() {
    console.log("🚀 Starting deployment...");
    
    // Check if we have a private key
    if (!process.env.PRIVATE_KEY) {
        console.log("❌ PRIVATE_KEY not found in environment variables");
        console.log("💡 Set it with: export PRIVATE_KEY='0xyour_private_key_here'");
        process.exit(1);
    }
    
    console.log("✅ Private key found");
    console.log("🌐 Connecting to Arbitrum...");
    
    try {
        // Get deployer account
        const [deployer] = await ethers.getSigners();
        console.log("📝 Deploying with account:", deployer.address);
        
        // Check balance
        const balance = await deployer.getBalance();
        console.log("💰 Account balance:", ethers.utils.formatEther(balance), "ETH");
        
        if (balance.eq(0)) {
            console.log("❌ No ETH balance! Add ETH to Arbitrum network first.");
            process.exit(1);
        }
        
        // Deploy contract
        console.log("📦 Deploying PingPongLeaderboard...");
        const PingPongLeaderboard = await ethers.getContractFactory("PingPongLeaderboard");
        const contract = await PingPongLeaderboard.deploy();
        
        console.log("⏳ Waiting for deployment...");
        await contract.deployed();
        
        console.log("🎉 Contract deployed successfully!");
        console.log("📍 Contract address:", contract.address);
        console.log("🔗 View on Arbiscan:", `https://arbiscan.io/address/${contract.address}`);
        
        // Test basic functionality
        console.log("🧪 Testing contract...");
        const winningScore = await contract.WINNING_SCORE();
        console.log("✅ Winning score:", winningScore.toString());
        
        console.log("\n📝 Next Steps:");
        console.log("1. Copy this contract address:", contract.address);
        console.log("2. Update ping-pong-v2.html:");
        console.log(`   const CONTRACT_ADDRESS = '${contract.address}';`);
        console.log("3. Upload updated file to GitHub");
        console.log("4. Test the game!");
        
    } catch (error) {
        console.log("❌ Deployment error:", error.message);
        
        if (error.message.includes("insufficient funds")) {
            console.log("💡 Solution: Add more ETH to your Arbitrum wallet");
        } else if (error.message.includes("network")) {
            console.log("💡 Solution: Check internet connection and try again");
        }
    }
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error("💥 Unexpected error:", error);
        process.exit(1);
    });