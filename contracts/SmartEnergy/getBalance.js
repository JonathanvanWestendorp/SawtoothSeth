var abi = require('ethereumjs-abi');
console.log(abi.simpleEncode("getUserInfo(string)","jona").toString("hex"));
