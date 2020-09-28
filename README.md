## Move around an object inside a matrix and see where you end up!
Command line program which is written fully in Xcode with Swift. The project is built upon frameworks such as Combine and the data pattern follows the VIPER architecture. 
The purpose of the program is to input your preferred matrix grid (width and height) and a starting position for your object. Then you'll be able to control the object by 
giving it commmands to execute. You'll then know whether or not your object ended up inside the grid or not.
 
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

## Screenshots
Step 1:
![Step 1](https://user-images.githubusercontent.com/25737947/94438132-fc0b6d80-019e-11eb-82e8-8e8a8afbe52d.png)

Example with errors:
![Example with errors](https://user-images.githubusercontent.com/25737947/94441636-45f65280-01a3-11eb-99a1-3860db618e2e.png)

Example with no errors: 
![Example no errors](https://user-images.githubusercontent.com/25737947/94438824-e9ddff00-019f-11eb-8893-b05f4d889ab1.png)

Step 2:
![Step 2](https://user-images.githubusercontent.com/25737947/94441796-7938e180-01a3-11eb-8109-46a564697f03.png)

Full example of playing the game with a valid position:
![valid position](https://user-images.githubusercontent.com/25737947/94439140-4ccf9600-01a0-11eb-93e2-d804c084da41.png)

Full example of playing the game and ending up outside of the matrix:
![outofbounds](https://user-images.githubusercontent.com/25737947/94439253-7983ad80-01a0-11eb-9bcc-ac54fe69e1f4.png)

# Enjoy!
