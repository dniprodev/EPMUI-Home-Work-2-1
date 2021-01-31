# Installation

This simple script allows you to easily generate: 
- Mocks for Unit tests.
- Equatable for custom objects

**Note:** 
For Mockable: Do not delete **AutoMockable** protocol and **YourProtocolName: AutoMockable** conformance.
For Equatable:  Do not delete **AutoEquatable**protocol. Every custom object  should support **AutoEquatable** protocol.

1. Place methods of your protocol into the **Input** file.    
2. Open Terminal, go to the current folder, and run **sh Run.sh**.
3. Go to the **Output** file and copy generated classes. 

Congrats! You are done!
