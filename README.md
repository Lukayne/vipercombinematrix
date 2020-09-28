## Project title
Command line program which is written fully in Xcode with Swift. The project is built upon frameworks such as Combine and the data pattern follows the VIPER architecture. 
The purpose of the program is to input your preferred matrix grid (width and height) and a starting position for your object. Then you'll be able to control the object by 
giving it commmands to execute. You'll then know whether or not your object ended up inside the grid or not.
 
## Screenshots
// TODO

## Installation
An executable of the program can be found in the directory bin. To run the program locate to the directory and type in ./Matrix and then you the program will run.
If you want to be able to debug what occurs then you can do that through Xcode. 

## Tests
Since the project is written in a VIPER architecture adding tests has been incedibly easy. The tests can't be run currently since there's no product module, 
but that will be updated shortly when I add the iOS version of the app.

## How it currently functions?
* The program will ask you for these values: 
  * The size of the table as two integers [width, height]
  * The objects starting position as two integers [x, y]
* The user will provide the values throgh `stdin`
  * The user will not be able to proceed until the input through `stdin` is formatted correctly.
      * This is the correct format `50,20,3,2` which in other words means -> `width, height, x, y`. 
* These are the requirements: 
  * The `width` can't be `<= 0`, but there's no maximum value limit. 
  * The `height`can't be `< 0` but it can be `0`. Meaning that possibility to initialize the game with only one row. The same applies to `height` as for `width` - there's no maximum 
    limit value limit.
  * There's no validation going on until the command `0` is run. Therefore your object can initially start at any `x` and `y` position. 
 * Once a valid set of starting values has been provided you'll be prompted to input a list of `commands`.
  * Even if you were to input the `commands` incorrectly.. 

