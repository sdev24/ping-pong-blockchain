# 🏓 Ping Pong Game v2 - Blockchain Edition

A modern ping pong game with blockchain score tracking on Arbitrum. Play locally or compete globally with immutable leaderboards!

## 🎮 Play the Game

**Live Demo:** [Coming Soon - Deploy to your preferred hosting]

## ✨ Features

### v1 (Local Game)
- ✅ Single HTML file - no dependencies
- ✅ 1-player vs 2-player modes
- ✅ AI opponent with adjustable difficulty
- ✅ Ball speed controls (Normal/Fast/Very Fast)
- ✅ First to 15 points wins
- ✅ Responsive paddle controls (W/S + Arrow keys)
- ✅ Local score tracking

### v2 (Blockchain Edition)
- ✅ MetaMask wallet integration
- ✅ Submit scores to Arbitrum blockchain
- ✅ Global leaderboards (multiplayer & single-player)
- ✅ Player names and statistics
- ✅ Tamper-proof scoring system
- ✅ Low gas fees (~$0.01 per score submission)
- ✅ Works offline without wallet connection

## 🚀 Quick Start

### Play Locally (v1)
1. Download `ping-pong.html`
2. Open in any web browser
3. Press SPACE to start playing!

### Play with Blockchain (v2)
1. Install [MetaMask](https://metamask.io/)
2. Add Arbitrum network to MetaMask
3. Get some ETH on Arbitrum for gas fees
4. Open `ping-pong-v2.html` in browser
5. Connect wallet and start competing!

## 🔧 Development Setup

### Prerequisites
- Node.js 16+
- MetaMask wallet
- ETH on Arbitrum for deployment

### Install Dependencies
```bash
npm install
```

### Compile Smart Contract
```bash
npm run compile
```

### Deploy to Arbitrum
```bash
# Set your private key as environment variable
export PRIVATE_KEY="your_private_key_here"

# Deploy contract
npm run deploy
```

### Update Game
After deployment, update the CONTRACT_ADDRESS in `ping-pong-v2.html`:
```javascript
const CONTRACT_ADDRESS = 'YOUR_DEPLOYED_CONTRACT_ADDRESS';
```

## 📁 Project Structure

```
├── ping-pong.html              # v1 - Local game
├── ping-pong-v2.html           # v2 - Blockchain edition
├── contracts/
│   └── PingPongLeaderboard.sol  # Smart contract
├── deploy-contract.js           # Deployment script
├── hardhat.config.js           # Hardhat configuration
├── package.json                # Dependencies
└── README.md                   # This file
```

## 🎯 How to Play

### Controls
- **Player 1:** W (up) / S (down)
- **Player 2:** Arrow keys (up/down)
- **Start/Pause:** Spacebar
- **Reset:** Reset button

### Game Modes
- **2-Player:** Classic competitive mode
- **1-Player:** Play against AI opponent
- **Ball Speed:** Adjust difficulty (Normal/Fast/Very Fast)

### Winning
- First player to reach 15 points wins
- Winner can submit score to blockchain (v2 only)
- Scores appear on global leaderboard

## 🏆 Blockchain Features

### Smart Contract (Arbitrum)
- **Score Submission:** Only winning scores (15+) accepted
- **Leaderboards:** Separate for multiplayer and single-player
- **Player Stats:** Track personal bests and game count
- **Events:** Real-time score submission notifications

### Gas Costs
- **Submit Score:** ~$0.01-0.05 (Arbitrum L2)
- **View Leaderboard:** Free (read-only)

### Security
- Immutable once deployed
- No admin controls
- Tamper-proof scoring
- Open source and auditable

## 🌐 Hosting Options

### GitHub Pages (Free)
1. Create GitHub repository
2. Upload game files
3. Enable Pages in settings
4. Access at `username.github.io/repo-name`

### Netlify (Free)
1. Create account at netlify.com
2. Drag & drop HTML file
3. Get instant URL

### Vercel (Free)
1. Create account at vercel.com
2. Connect GitHub repo
3. Automatic deployment

## 🔍 Smart Contract Details

### Contract Address
```
Arbitrum Mainnet: [Deploy and update here]
```

### Key Functions
- `submitScore(score, singlePlayer, name)` - Submit game score
- `getMultiplayerLeaderboard(limit)` - Get top scores
- `getSinglePlayerLeaderboard(limit)` - Get single-player scores
- `getPlayerStats(address)` - Get player statistics

### Events
- `ScoreSubmitted` - Emitted when score is recorded

## 🛠 Technical Stack

- **Frontend:** Pure HTML5/CSS3/JavaScript
- **Web3:** ethers.js v5
- **Blockchain:** Arbitrum (Ethereum L2)
- **Smart Contract:** Solidity 0.8.19
- **Development:** Hardhat

## 📱 Mobile Support

Game is fully responsive and works on:
- ✅ Desktop browsers
- ✅ Mobile phones (touch controls planned)
- ✅ Tablets

## 🤝 Contributing

1. Fork the repository
2. Create feature branch
3. Test thoroughly
4. Submit pull request

## 📄 License

MIT License - see LICENSE file for details

## 🆘 Support

Having issues?
1. Ensure MetaMask is installed and connected
2. Switch to Arbitrum network
3. Check you have ETH for gas fees
4. Game works offline without blockchain features

## 🎉 Credits

Built with ❤️ for the blockchain gaming community!

---

**Ready to play?** Download the files and start competing on the blockchain! 🏓