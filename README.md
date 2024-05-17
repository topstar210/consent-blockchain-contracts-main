## Consent Blockchain Contracts Readme

### Project Structure

```
hardhat-project/
├── artifacts/  # Compiled bytecode, ABI, and metadata
├── contracts/  # Solidity smart contracts
├── test/         # Unit and integration tests
├── scripts/      # Deployment and utility scripts
├── yarn.lock     # Yarn package-lock file
├── package.json  # Project dependencies
└── hardhat.config.js  # Hardhat configuration file
```

### Initialization

This project was initialized using the following commands:

1. `yarn init`: Created a basic Yarn project.
2. `yarn add hardhat --dev`: Added Hardhat as a development dependency.
3. `yarn hardhat init`: Initialized the Hardhat project and generated a default `hardhat.config.js` file.
4. **Manual folder creation**: Created three additional folders (`contracts`, `test`, and `scripts`) for improved organization.
5. `yarn add --dev @nomiclabs/hardhat-ethers ethers @nomiclabs/hardhat-waffle ethereum-waffle chai`: Installed additional development dependencies including:
    * `@nomiclabs/hardhat-ethers`: Provides access to the official ethers.js library within Hardhat.
    * `ethers`: Ethereum libraries for interacting with the blockchain.
    * `@nomiclabs/hardhat-waffle`: Simplifies testing smart contracts with Waffle.
    * `ethereum-waffle`: Common testing utilities for Waffle.
    * `chai`: Assertions library for unit tests.

### Running the Project

1. **Start the local development network:**

```
npx hardhat node
```

2. **Deploy contracts:**

```
npx hardhat run scripts/deploy.js
```

3. **Run tests:**

```
npx hardhat test
```

4. **Additional scripts:**

The `scripts` folder can contain custom scripts for various tasks like interacting with deployed contracts, generating test data, or performing advanced operations. You can run these scripts individually using the `npx hardhat run <script_name>` command.

### Further Steps

This readme provides a basic starting point for your Hardhat project. Refer to the Hardhat documentation and individual package documentation for more details on specific features and configurations.

* Hardhat Docs: [https://hardhat.org/](https://hardhat.org/): [https://hardhat.org/](https://hardhat.org/)
* Waffle Docs: [https://ethereum-waffle.readthedocs.io/](https://ethereum-waffle.readthedocs.io/): [https://ethereum-waffle.readthedocs.io/](https://ethereum-waffle.readthedocs.io/)
* Ethers.js Docs: [https://docs.ethers.org/v5/](https://docs.ethers.org/v5/): [https://docs.ethers.org/v5/](https://docs.ethers.org/v5/)

## Author
- [Mustafa-Siddique](https://github.com/Mustafa-Siddique)

Happy Hacking!
