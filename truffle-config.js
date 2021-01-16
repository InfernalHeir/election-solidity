//const HDWalletProvider = require('@truffle/hdwallet-provider');


module.exports = {
 
  networks: {
  
   development: {
   host: "127.0.0.1",    
   port: 8545,            
   network_id: "*",    
   },
   
   /* rinkyby: {
    provider: () => new HDWalletProvider({
      privateKeys: [privateKey],
      providerOrUrl: infuraKey
    }),
    network_id: 4,
    confirmations: 2,
    timoutBlocks: 2,
    gasPrice: 25e9
    } */

    // Useful for private networks
    // private: {
    // provider: () => new HDWalletProvider(mnemonic, `https://network.io`),
    // network_id: 2111,   // This network is yours, in the cloud.
    // production: true    // Treats this network as if it was a public net. (default: false)
    // }
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
    useColors:true
  },

  // Configure your compilers
  compilers: {
    solc: {
      version: "0.6.12",    // Fetch exact version from solc-bin (default: truffle's version)
      settings: {          // See the solidity docs for advice about optimization and evmVersion
      optimizer: {
        enabled: false,
        runs: 200
      },
     evmVersion: "petersburg"
      }
    },
  },
};