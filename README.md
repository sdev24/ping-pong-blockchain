# 🏓 Ping Pong Game - Complete Collection

A modern ping pong game collection with 4 different versions: Classic, Blockchain, Mobile, and Mobile Blockchain editions. Play locally or compete globally with immutable leaderboards!

## 🎮 Play the Game

**Live Demo:** [https://sdev24.github.io/ping-pong-blockchain/](https://sdev24.github.io/ping-pong-blockchain/)

### 🕹️ Game Versions
- **Classic Edition** - Pure HTML5 game, no setup required
- **Blockchain Edition** - Global leaderboards on Arbitrum blockchain
- **Mobile Edition** - Touch-friendly mobile optimized version
- **Mobile Blockchain** - Mobile gaming with blockchain features

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

### v3 (Mobile Edition)
- ✅ Touch/drag controls for paddles
- ✅ Responsive canvas that scales to screen size
- ✅ Touch-friendly UI with 44px minimum button sizes
- ✅ Visual paddle zones with active feedback
- ✅ Portrait and landscape orientation support
- ✅ Prevents page scrolling during gameplay
- ✅ Battery optimized for mobile devices

### v4 (Mobile Blockchain Edition)
- ✅ All mobile edition features
- ✅ Mobile-optimized Web3 wallet integration
- ✅ Touch-friendly blockchain score submission
- ✅ Responsive leaderboard display
- ✅ Mobile wallet deep linking support
- ✅ Optimized for mobile network conditions

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

### Play Mobile (v3)
1. Open `ping-pong-mobile.html` on any mobile device
2. Use touch controls to drag paddles
3. Tap center to start/pause game
4. Works in portrait and landscape modes

### Play Mobile Blockchain (v4)
1. Install mobile wallet (MetaMask Mobile, Trust Wallet, etc.)
2. Open `ping-pong-mobile-blockchain.html` on mobile device
3. Connect wallet and compete on global leaderboards
4. Optimized for mobile Web3 experience

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
├── index.html                   # Main page showcasing all versions
├── ping-pong.html              # v1 - Classic desktop game
├── ping-pong-v2.html           # v2 - Desktop blockchain edition
├── ping-pong-mobile.html       # v3 - Mobile touch-friendly version
├── ping-pong-mobile-blockchain.html # v4 - Mobile blockchain edition
├── contracts/
│   └── PingPongLeaderboard.sol  # Smart contract
├── deploy-contract.js           # Deployment script
├── deploy-simple.js            # Simple deployment script
├── hardhat.config.js           # Hardhat configuration
├── package.json                # Dependencies
└── README.md                   # This file
```

## 🎯 How to Play

### Controls

#### Desktop Versions (v1, v2)
- **Player 1:** W (up) / S (down)
- **Player 2:** Arrow keys (up/down)
- **Start/Pause:** Spacebar
- **Reset:** Reset button

#### Mobile Versions (v3, v4)
- **Paddle Control:** Touch and drag in paddle zones
- **Start/Pause:** Tap center of screen
- **Game Controls:** Touch-friendly buttons
- **Responsive:** Auto-scales to screen size

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
Arbitrum Mainnet: 0x1AEAFBB8175d278FA63CBa529a2CEbdC98cA3e08
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

All game versions work across devices:
- ✅ Desktop browsers (v1, v2)
- ✅ Mobile phones with touch controls (v3, v4)
- ✅ Tablets with responsive design
- ✅ Portrait and landscape orientations
- ✅ Mobile Web3 wallet integration (v4)

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

**Created by:** Sharan Konerira

Built with ❤️ for the blockchain gaming community!

---

**Ready to play?** Download the files and start competing on the blockchain! 🏓