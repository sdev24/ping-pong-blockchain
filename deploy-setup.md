# Ping Pong Game v2 Deployment Guide

## Overview
This guide covers deploying the Ping Pong game v2 with blockchain score tracking on Arbitrum.

## Files Created
- `ping-pong-v2.html` - Complete game with Web3 integration
- `PingPongLeaderboard.sol` - Smart contract for score tracking
- `deploy-setup.md` - This deployment guide

## Smart Contract Deployment

### Prerequisites
1. Install Node.js and npm
2. Install Hardhat: `npm install --save-dev hardhat`
3. Get Arbitrum RPC URL (free from Alchemy/Infura)
4. Have ETH on Arbitrum for gas fees (~$5-10 worth)

### Step 1: Initialize Hardhat Project
```bash
npx hardhat init
```

### Step 2: Configure hardhat.config.js
```javascript
require('@nomiclabs/hardhat-ethers');

module.exports = {
  solidity: "0.8.19",
  networks: {
    arbitrum: {
      url: "https://arb1.arbitrum.io/rpc",
      accounts: ["YOUR_PRIVATE_KEY"] // Never commit this!
    }
  }
};
```

### Step 3: Deploy Contract
```bash
# Copy PingPongLeaderboard.sol to contracts/
npx hardhat compile
npx hardhat run scripts/deploy.js --network arbitrum
```

### Step 4: Update Contract Address
After deployment, update the CONTRACT_ADDRESS in ping-pong-v2.html:
```javascript
const CONTRACT_ADDRESS = 'YOUR_DEPLOYED_CONTRACT_ADDRESS';
```

## Game Hosting Options

### Option 1: GitHub Pages (Recommended)
1. Create GitHub repository
2. Upload `ping-pong-v2.html`
3. Enable GitHub Pages in repo settings
4. Game accessible at: `https://username.github.io/repo-name/ping-pong-v2.html`

### Option 2: Netlify
1. Create account at netlify.com
2. Drag and drop `ping-pong-v2.html` to deploy
3. Custom domain available

### Option 3: Vercel
1. Create account at vercel.com
2. Import GitHub repo or upload file
3. Automatic deployment

## Smart Contract Features

### Functions Available
- `submitScore(score, singlePlayer, name)` - Submit game score
- `getMultiplayerLeaderboard(limit)` - Get top multiplayer scores
- `getSinglePlayerLeaderboard(limit)` - Get top single-player scores
- `getPlayerStats(address)` - Get player statistics

### Gas Costs (Arbitrum)
- Submit score: ~$0.01-0.05
- Read leaderboard: Free (view function)

## Game Features

### v2 Enhancements
- ✅ Connect MetaMask wallet
- ✅ Submit scores to Arbitrum blockchain
- ✅ View global leaderboards (multiplayer/single-player)
- ✅ Player names and statistics
- ✅ Automatic network switching to Arbitrum
- ✅ Graceful fallback (works without wallet)

### Gameplay
- Same as v1: First to 15 points wins
- Faster paddle movement
- 1-player vs 2-player modes
- Ball speed controls

## Testing Checklist

### Local Testing
- [ ] Game loads without wallet
- [ ] All v1 features work
- [ ] Wallet connection works
- [ ] Score submission UI appears after winning

### After Contract Deployment
- [ ] Contract address updated in HTML
- [ ] MetaMask connects to Arbitrum
- [ ] Score submission works
- [ ] Leaderboard loads correctly
- [ ] Gas fees are reasonable

### After Hosting
- [ ] Game accessible via URL
- [ ] HTTPS enabled
- [ ] Mobile responsive
- [ ] Cross-browser compatibility

## Security Notes

- Contract is immutable after deployment
- Scores are permanent and tamper-proof
- Only winning scores (15+) can be submitted
- Player names are optional and limited to 32 characters
- No admin functions - fully decentralized

## Support

If users need help:
1. Ensure MetaMask is installed
2. Switch to Arbitrum network
3. Have small amount of ETH for gas
4. Game works offline without blockchain features

## Next Steps

1. Deploy smart contract to Arbitrum
2. Update contract address in HTML
3. Host game on chosen platform
4. Share URL with players
5. Monitor usage and gas costs