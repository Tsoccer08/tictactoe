# Tic-Tac-Toe (Erlang Console Project)

A simple two-player Tic-Tac-Toe game built in Erlang using functional programming concepts. The program runs in the console and allows two players to take turns placing X and O on a 3x3 game board until one player wins, the game ends in a draw, or the user chooses to quit.

## Instructions for Build and Use

Steps to build and/or run the software:

1. Install Erlang/OTP.
2. Open a terminal or PowerShell and navigate to the project folder.
3. Compile the program by running `erlc tictactoe.erl`.
4. Start the Erlang shell by running `erl`.
5. Run the game by entering `tictactoe:start().`.

Instructions for using the software:

1. Enter a number from 1 to 9 to place your mark in the corresponding position on the board.
2. Players alternate turns between X and O until one player wins or the game ends in a draw.
3. Enter `0` at any time to quit the game and return to the Erlang shell.

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

* Erlang/OTP 29
* Visual Studio Code
* Erlang extension for Visual Studio Code
* Windows PowerShell or Command Prompt

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [Erlang Documentation](https://www.erlang.org/docs)
* [Erlang Standard Library Reference Manual](https://www.erlang.org/doc/man)
* [TutorialsPoint Erlang Tutorial](https://www.tutorialspoint.com/erlang)
* [Learn You Some Erlang](https://learnyousomeerlang.com/)
* [ChatGPT](https://chatgpt.com/)

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Add an option to play another game without restarting the program.
* [ ] Improve the user interface with a cleaner board layout and clearer messages.
* [ ] Add a single-player mode with a simple computer opponent.
