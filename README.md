[![Build Status](https://travis-ci.org/radius314/yap.svg?branch=master)](https://travis-ci.org/radius314/yap)
# yap

Recommended to use PHP 7.2 or greater.  PHP 5.6 is going to be end of life on December 31, 2018 and cannot guarantee compatibility after that.

The purposes of yap are :
* To be able to take the results of a BMLT root server and play it back through the telephone.  
* To be able to set up routing rules for zip codes and helpline numbers with optional extension dialing.

Unlike it's predecessor bmlt-vox, this doesn't require any special infrastructure other than a server capable of delivering PHP over HTTP(S).

We are taking advantage of using Twilio which essentially handles all the VOIP parts.  You provision a number, set up an application, and point it your PHP server.

# Documentation

For setup instructions and general documentation please visit [https://yap.bmlt.app](https://yap.bmlt.app/)
