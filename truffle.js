/*
 * NB: since truffle-hdwallet-provider 0.0.5 you must wrap HDWallet providers in a 
 * function when declaring them. Failure to do so will cause commands to hang. ex:
 * ```
 * mainnet: {
 *     provider: function() { 
 *       return new HDWalletProvider(mnemonic, 'https://mainnet.infura.io/<infura-key>') 
 *     },
 *     network_id: '1',
 *     gas: 4500000,
 *     gasPrice: 10000000000,
 *   },
 */

module.exports = {
    networks: {
        development: {
            host: /*"51.0.1.99", //*/ "localhost",
            port: 8545, //7545
            //gas: 3900000, //2,5m
            gas: 4712388,
            //from: "0x6870EA70c8582A3C3c778ae719b502e4644fD9dE",
            network_id: "*" // Match any network id
        }
    }
};
