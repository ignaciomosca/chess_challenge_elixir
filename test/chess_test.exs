defmodule ChessTest do
  use ExUnit.Case
  doctest Chess

  alias Chess

  test "4x4 2K 2Q" do
    assert MapSet.size(MapSet.new(Chess.make_solution(4, 4, 2, 2, 0, 0, 0))) == 20
  end

  test "4x4 1Q 2R" do
    assert MapSet.size(MapSet.new(Chess.make_solution(4, 4, 0, 1, 0, 2, 0))) == 116
  end

  test "4x4 2K 2N" do
    assert MapSet.size(MapSet.new(Chess.make_solution(4, 4, 2, 0, 0, 0, 2))) == 322
  end

  test "4x4 2Q 1B" do
    assert MapSet.size(MapSet.new(Chess.make_solution(4, 4, 0, 2, 1, 0, 0))) == 72
  end

  test "5x5 2K 2Q" do
    assert MapSet.size(MapSet.new(Chess.make_solution(5, 5, 2, 2, 0, 0, 0))) == 816
  end

  test "5x5 1Q 2B" do
    assert MapSet.size(MapSet.new(Chess.make_solution(5, 5, 0, 1, 2, 0, 0))) == 1152
  end

  test "5x5 1Q 1B 1R" do
    assert MapSet.size(MapSet.new(Chess.make_solution(5, 5, 0, 1, 1, 1, 0))) == 1224
  end

  test "5x5 2K 2B" do
    assert MapSet.size(MapSet.new(Chess.make_solution(5, 5, 2, 0, 2, 0, 0))) == 7596
  end

  @tag timeout: :infinity
  test "6x6 2K 1B 1N 1R" do
    assert MapSet.size(MapSet.new(Chess.make_solution(6, 6, 2, 0, 1, 1, 1))) == 343_816
  end

  @tag timeout: :infinity
  test "7x7 2K 2Q 2B 0R 1N" do
    assert MapSet.size(MapSet.new(Chess.make_solution(7, 7, 2, 2, 2, 0, 1))) == 3_063_828
  end
end
