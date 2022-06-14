defmodule Chess do
  @type piece :: :rook | :bishop | :knight | :queen | :king
  defmodule ChessPiece do
    defstruct [:row, :col, :piece]
    @type t() :: %__MODULE__{row: integer(), col: integer(), piece: Chess.piece()}
  end

  defmodule Board do
    defstruct [:m, :n, :used_pieces, :number_of_pieces]

    @type t() :: %__MODULE__{
            m: integer(),
            n: integer(),
            used_pieces: list(Chess.ChessPiece.t()),
            number_of_pieces: integer()
          }
  end

  @spec attacks(Chess.ChessPiece.t(), Chess.ChessPiece.t()) :: boolean()
  def attacks(%ChessPiece{row: aRow, col: aCol, piece: :rook}, %ChessPiece{row: r, col: c}),
    do: aRow == r || aCol == c

  def attacks(%ChessPiece{row: aRow, col: aCol, piece: :bishop}, %ChessPiece{row: r, col: c}),
    do: abs(r - aRow) == abs(c - aCol)

  def attacks(%ChessPiece{row: aRow, col: aCol, piece: :queen}, %ChessPiece{row: r, col: c}),
    do: r == aRow || c == aCol || abs(r - aRow) == abs(c - aCol)

  def attacks(%ChessPiece{row: aRow, col: aCol, piece: :knight}, %ChessPiece{row: r, col: c}),
    do: Enum.member?(knightMoves(aRow, aCol), {r, c})

  def attacks(%ChessPiece{row: aRow, col: aCol, piece: :king}, %ChessPiece{row: r, col: c}),
    do: Enum.member?(kingMoves(aRow, aCol), {r, c})

  defp knightMoves(r, c) do
    for x <- [-2, -1, 1, 2],
        y <- [-2, -1, 1, 2],
        abs(x) != abs(y) do
      {r + x, c + y}
    end
  end

  defp kingMoves(r, c) do
    for x <- [-1, 1, 0],
        y <- [-1, 1, 0] do
      {r + x, c + y}
    end
  end

  @spec show(Chess.ChessPiece.t()) :: String.t()
  def show(%ChessPiece{piece: :rook}), do: "R"
  def show(%ChessPiece{piece: :bishop}), do: "B"
  def show(%ChessPiece{piece: :knight}), do: "N"
  def show(%ChessPiece{piece: :queen}), do: "Q"
  def show(%ChessPiece{piece: :king}), do: "K"

  @spec is_safe(Chess.Board.t(), Chess.ChessPiece.t()) :: boolean()
  defp is_safe(%Board{used_pieces: used_pieces}, c),
    do: Enum.all?(used_pieces, fn p -> !attacks(c, p) && !attacks(p, c) end)

  defp place(%Board{m: mm, n: nn, used_pieces: up, number_of_pieces: np}, p) do
    %Board{m: mm, n: nn, used_pieces: MapSet.put(up, p), number_of_pieces: np}
  end

  defp done(%Board{used_pieces: up, number_of_pieces: n}), do: MapSet.size(up) == n

  defp create_piece(p, r, c), do: %ChessPiece{row: r, col: c, piece: p}

  defp replicate(n, x), do: for(i <- 0..n, i > 0, do: x)

  defp find_candidate(%ChessPiece{piece: piece}, %Board{m: m, n: n} = b) do
    for r <- 1..m,
        c <- 1..n,
        p = create_piece(piece, r, c),
        is_safe(b, p),
        into: MapSet.new(),
        do: place(b, p)
  end

  @spec solution(Chess.Board.t(), list(Chess.ChessPiece.t()), any()) :: any()
  defp solution(%Board{} = b, [p | ps], solutions),
    do: solution(b, ps, Enum.flat_map(solutions, fn board -> find_candidate(p, board) end))

  defp solution(_, [], solutions), do: Enum.filter(solutions, fn s -> done(s) end)

  defp chess_piece_list(kings, queens, bishops, rooks, knights),
    do:
      replicate(kings, %ChessPiece{row: 0, col: 0, piece: :king}) ++
        replicate(queens, %ChessPiece{row: 0, col: 0, piece: :queen}) ++
        replicate(bishops, %ChessPiece{row: 0, col: 0, piece: :bishop}) ++
        replicate(rooks, %ChessPiece{row: 0, col: 0, piece: :rook}) ++
        replicate(knights, %ChessPiece{row: 0, col: 0, piece: :knight})

  defp empty_board(m, n, number_of_pieces),
    do: %Board{m: m, n: n, used_pieces: MapSet.new(), number_of_pieces: number_of_pieces}

  def make_solution(m, n, kings, queens, bishops, rooks, knights) do
    board = empty_board(m, n, kings + queens + bishops + rooks + knights)
    chess_pieces = chess_piece_list(kings, queens, bishops, rooks, knights)
    solutions = MapSet.new() |> MapSet.put(board)
    solution(board, chess_pieces, solutions)
  end
end
