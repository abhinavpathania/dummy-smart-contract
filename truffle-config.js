module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",  // Ganache RPC server
      port: 7545,         // Ganache GUI default port
      network_id: "*",    // Any network
    },
  },
  compilers: {
    solc: {
      version: "0.8.19",
    },
  },
};
