defmodule MatrixHelper do

  @doc """
    Multiply matrices

    ## Example
    iex> MatrixHelper.multiply([[1, 2]], [[3], [-5]])
    [[-7]]

    iex> MatrixHelper.multiply([[1, 2]], [[3, -5]], :transposed)
    [[-7]]

    iex> MatrixHelper.multiply([[1, 2]], [[3], [-5]], :not_transposed)
    [[-7]]

  """
  @spec multiply([list], [list]) :: number
  def multiply(matrix_a, matrix_b, transpose \\ :not_transposed) do
    case transpose do
      :transposed     ->
        do_multiply(matrix_a, matrix_b)
      :not_transposed ->
        do_multiply(matrix_a, transpose(matrix_b))
    end
  end

  @spec do_multiply([list], [list]) :: number
  defp do_multiply(
  _a_matrix = [ a_row | a_tail ],
  b_matrix = [ b_row | _b_tail ])
  when is_list(a_row) and is_list(a_tail) and is_list(b_row),
  do: [do_multiply(a_row, b_matrix) | do_multiply(a_tail, b_matrix)]

  @spec do_multiply(list, [list]) :: number
  defp do_multiply(
  a_row = [ _a_head | _a_tail ],
  _b_matrix = [ b_row | b_tail ]),
  do: [ multiply_matrix_row(a_row, b_row) | do_multiply(a_row, b_tail) ]

  @spec do_multiply(any, any) :: []
  defp do_multiply(_, _), do: []

  @spec multiply_matrix_row(list, list) :: number
  defp multiply_matrix_row([a_head | a_tail], [b_head | b_tail]),
    do: (a_head * b_head) + multiply_matrix_row(a_tail, b_tail)

  @spec multiply_matrix_row([], []) :: 0
  defp multiply_matrix_row([], []), do: 0

  @doc """
  Transpose matrix

    ## Example
    iex> MatrixHelper.transpose([[1, 3], [4, 4], [5, 6]])
    [[1, 4, 5], [3, 4, 6]]

  """
  @spec transpose([list]) :: [list]
  def transpose(matrix) do
    List.zip(matrix)
      |> tuples_to_lists()
  end

  @spec tuples_to_lists([tuple]) :: [list]
  defp tuples_to_lists([head | tail]) do
    [ :erlang.tuple_to_list(head) | tuples_to_lists(tail) ]
  end

  @spec tuples_to_lists([]) :: []
  defp tuples_to_lists(arr = []), do: arr

end
