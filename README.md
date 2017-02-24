# Supermarket_Register_ObjC
This project takes a set of Product codes from the user and calculates the total with a 8.75% tax

## Table of Contents
1. [Implementation](#implementation)
1. [Build](#build)
1. [Demo](#demo)

## Implementation

### Dependencies
* TravisCI  
    + language: objective-c  
    + osx_image: xcode8.2  
    + xcode_project: Supermarket_Register_ObjC/Supermarket_Register_ObjC.xcodeproj  
    + xcode_scheme: Supermarket_Register_ObjC  
    + xcode_sdk: iphonesimulator8.3  

### Installation
* TravisCI 
    + https://www.raywenderlich.com/109418/travis-ci-tutorial
* supermarket_register_gannett_ObjC
    + Launch to device using xcode

### Usage  
User provides a set of product codes into the input text field. Upon clicking submit, the application verifies that the product codes submitted are formatted correct, returning an error message upon failure, and processes the request if it passes verification. The output is displayed in the UI as "Tax" and "Total" values. 

**[Back to top](#table-of-contents)**

## Build
![build passing](https://travis-ci.org/travis-ci/travis-web.svg?branch=master) To build this project and run the test cases use the following build script::

    xcodebuild clean build test -sdk iphonesimulator -project Supermarket_Register_ObjC/Supermarket_Register_ObjC.xcodeproj -scheme Supermarket_Register_ObjC CODE_SIGNING_REQUIRED=NO -destination 'platform=iOS Simulator,id=AD8E8C76-910E-437D-88C2-4D6F6EBE3355,OS=10.2'

**[Back to top](#table-of-contents)**

## Demo
Possible input Strings:  
1. A12T-4GH7-QPL9-3N4M (Product: Cereal Price: $3.46)  
2. E5T6-9UI3-TH15-QR88 (Product: Chicken Price: $8.18)  
3. YRT6-72AS-K736-L4AR (Product: Pop Price: $1.63)  
4. TQ4C-VV6T-75ZX-1RMR (Product: Pizza Price: $6.78)  
5. 65P1-UDGM-XH2M-LQW2 (Product: Tuna Price: $5.89)    

Demo input String:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A12T-4GH7-QPL9-3N4M;65P1-UDGM-XH2M-LQW2  
Demo Output:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tax: $0.82  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total: $10.17  

<img src="https://cloud.githubusercontent.com/assets/7190790/22855256/43716e2c-f04b-11e6-9698-b543c06dbac0.jpg" width="200">

**[Back to top](#table-of-contents)**
