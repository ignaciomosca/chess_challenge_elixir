defmodule PiecesTest do
  use ExUnit.Case
  doctest Chess

  alias Chess
  alias Chess.ChessPiece

  describe "Chess piece movements" do
    test "test King movements" do
      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 5,
               col: 6,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 6,
               col: 4,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 5,
               col: 4,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 4,
               col: 4,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 4,
               col: 5,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 4,
               col: 6,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 5,
               col: 6,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 6,
               col: 6,
               piece: :king
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :king}, %ChessPiece{
               row: 8,
               col: 8,
               piece: :king
             }) == false
    end

    test "test Bishop movements" do
      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 7,
               col: 7,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 6,
               col: 6,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 4,
               col: 6,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 3,
               col: 7,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 7,
               col: 3,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 6,
               col: 4,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 4,
               col: 4,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 3,
               col: 3,
               piece: :bishop
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :bishop}, %ChessPiece{
               row: 8,
               col: 1,
               piece: :bishop
             }) == false
    end

    test "test Knight movements" do
      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 7,
               col: 6,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 6,
               col: 7,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 4,
               col: 7,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 3,
               col: 6,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 3,
               col: 4,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 4,
               col: 3,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 6,
               col: 3,
               piece: :knight
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :knight}, %ChessPiece{
               row: 8,
               col: 1,
               piece: :knight
             }) == false
    end

    test "test Queen movements" do
      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 7,
               col: 7,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 6,
               col: 6,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 4,
               col: 6,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 3,
               col: 7,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 7,
               col: 3,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 6,
               col: 4,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 4,
               col: 4,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 3,
               col: 3,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 6,
               col: 5,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 7,
               col: 5,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 4,
               col: 5,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 3,
               col: 5,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 5,
               col: 6,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 5,
               col: 7,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 5,
               col: 4,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :queen}, %ChessPiece{
               row: 5,
               col: 3,
               piece: :queen
             }) == true

      assert Chess.attacks(%ChessPiece{row: 1, col: 1, piece: :queen}, %ChessPiece{
               row: 3,
               col: 4,
               piece: :queen
             }) == false
    end

    test "test Rook movements" do
      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 6,
               col: 5,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 7,
               col: 5,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 4,
               col: 5,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 3,
               col: 5,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 5,
               col: 6,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 5,
               col: 7,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 5,
               col: 4,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 5,
               col: 3,
               piece: :rook
             }) == true

      assert Chess.attacks(%ChessPiece{row: 5, col: 5, piece: :rook}, %ChessPiece{
               row: 7,
               col: 2,
               piece: :rook
             }) == false
    end
  end
end
