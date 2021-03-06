# Dunia Wallet - Celo
DuniaPay is a mobile wallet built on celo using a set of open source smart contracts and destined to bring financial inclusion in Africa. The wallet's user keeps a Celo account secretly on his mobile device. This account is set as the owner of the Smart Contract and is guarded by default by the company (see guardian contract for reference). User's funds ERC20 tokens (in our case we will issue ERC20 tokens representing local African currencies on celo) are stored on the Smart Contract. With that model, logic can be added to the wallet to improve the user experience and the wallet security (the wallet is guarded, recoverable, lockable, protected by a daily limit and upgradable). The wallet is designed to be fast, reliable and upgradable. We've customized the logic behind those open source smartcontract to adapt to our business needs (see comments in the smart contracts)

You can find a detailed presentation of the wallet and the logic behind it here (coming soon)

## Install

Install requirements with npm:
```
npm install
```

## Compile
Compile the external contracts:
```
npm run compile:lib
```

Compile the contracts:
```
npm run compile
```

## Test

Launch ganache:
```
npm run ganache
```

Run the tests:
```
npm run test
```

## License

Released under [GPL-3.0](LICENSE)
