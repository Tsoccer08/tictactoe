-module(tictactoe).
-export([start/0]).

%% =====================================================
%% Start Game
%% =====================================================

start() ->
    Board = [1,2,3,4,5,6,7,8,9],
    io:format("~n=== Tic Tac Toe ===~n"),
    io:format("Enter 0 at any time to quit.~n"),
    game_loop(Board, x).

%% =====================================================
%% Recursion Requirement
%% Main Game Loop
%% =====================================================

game_loop(Board, Player) ->
    print_board(Board),

    case check_winner(Board) of

        x ->
            io:format("~nPlayer X wins!~n");

        o ->
            io:format("~nPlayer O wins!~n");

        draw ->
            io:format("~nGame ended in a draw.~n");

        none ->
            io:format("~nPlayer ~p's turn.~n", [Player]),

            Move = get_move(),

            case Move of

                0 ->
                    io:format("~nThanks for playing!~n");

                _ ->
                    case valid_move(Board, Move) of

                        true ->
                            NewBoard = make_move(Board, Move, Player),
                            game_loop(NewBoard, switch_player(Player));

                        false ->
                            io:format("Invalid move. Please choose an open position from 1-9.~n"),
                            game_loop(Board, Player)
                    end
            end
    end.

%% =====================================================
%% Pattern Matching Requirement
%% =====================================================

switch_player(x) -> o;
switch_player(o) -> x.

%% =====================================================
%% Input Handling
%% =====================================================

get_move() ->

    io:format("Enter move (1-9, or 0 to quit): "),

    case io:fread("", "~d") of

        {ok, [Move]} ->
            Move;

        _ ->
            io:format("Invalid input. Please enter a number.~n"),
            -1
    end.

%% =====================================================
%% Guards Requirement
%% =====================================================

valid_move(Board, Position)
    when Position >= 1, Position =< 9 ->

    Cell = lists:nth(Position, Board),

    case Cell of
        x -> false;
        o -> false;
        _ -> true
    end;

valid_move(_, _) ->
    false.

%% =====================================================
%% Guards Requirement
%% =====================================================

make_move(Board, Position, Player)
    when Position >= 1, Position =< 9 ->
    replace(Board, Position, Player).

%% =====================================================
%% Recursion Requirement
%% Replace List Item
%% =====================================================

replace(Board, Position, Value) ->
    replace(Board, Position, Value, 1).

replace([], _, _, _) ->
    [];

replace([_|Tail], Position, Value, Position) ->
    [Value | Tail];

replace([Head|Tail], Position, Value, Index) ->
    [Head | replace(Tail, Position, Value, Index + 1)].

%% =====================================================
%% Lambda Function Requirement (lists:map)
%% Display Board
%% =====================================================

print_board(Board) ->

    DisplayBoard =
        lists:map(
            fun(Cell) ->
                lists:flatten(io_lib:format("~p", [Cell]))
            end,
            Board),

    [A,B,C,D,E,F,G,H,I] = DisplayBoard,

    io:format("~n"),
    io:format("~s | ~s | ~s~n", [A,B,C]),
    io:format("--+---+--~n"),
    io:format("~s | ~s | ~s~n", [D,E,F]),
    io:format("--+---+--~n"),
    io:format("~s | ~s | ~s~n", [G,H,I]),
    io:format("~n").

%% =====================================================
%% Lists Requirement
%% Stretch Challenge: CASE Blocks
%% =====================================================

check_winner(Board) ->

    Wins =
        [
            [1,2,3],
            [4,5,6],
            [7,8,9],
            [1,4,7],
            [2,5,8],
            [3,6,9],
            [1,5,9],
            [3,5,7]
        ],

    case winner(Board, Wins) of

        none ->

            %% Lambda Function Requirement (lists:filter)

            EmptyCells =
                lists:filter(
                    fun(Cell) ->
                        Cell /= x andalso Cell /= o
                    end,
                    Board),

            case EmptyCells of
                [] -> draw;
                _ -> none
            end;

        Winner ->
            Winner
    end.

%% =====================================================
%% Recursion Requirement
%% =====================================================

winner(_, []) ->
    none;

winner(Board, [[A,B,C]|Rest]) ->

    V1 = lists:nth(A, Board),
    V2 = lists:nth(B, Board),
    V3 = lists:nth(C, Board),

    case {V1,V2,V3} of

        {x,x,x} ->
            x;

        {o,o,o} ->
            o;

        _ ->
            winner(Board, Rest)
    end.