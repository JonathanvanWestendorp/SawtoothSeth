var abi = require('ethereumjs-abi');

console.log(abi.simpleEncode("register(string,address)", "jona", "0xc96db4abde0089ad91bdf2b97c930c161722bcca").toString("hex"));
