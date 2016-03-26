defmodule MatrixHelperTest do
  use ExUnit.Case, async: true
  doctest MatrixHelper

  import MatrixHelper

  test "transposing matrix" do
   assert transpose([[4], [5], [6]]) === [[4, 5, 6]]
   assert transpose([[4, 5, 6, 8, 9], [2, 3, 1, 4, 5], [1, 3, 4, 2, 1]]) ===
    [[4, 2, 1], [5, 3, 3], [6, 1, 4], [8, 4, 2], [9, 5, 1]]
  end

  test "multiplying matrices assuming that
        a second one is already transposed" do
    assert multiply(
      [
        [1, 3, 2],
        [3, 1, 2],
        [1, 2, 1]],
      [
        [1, 4, 1],
        [2, 2, 1],
        [3, 1, 10],
        [2, -1, -3]],
      :transposed
    ) === [
      [15, 10, 26, -7],
      [9, 10, 30, -1],
      [10, 7, 15, -3]]
  end

  test "multiplying matrices assuming that
        a second one is not transposed" do
    assert multiply(
      [
        [1, 3, 2],
        [3, 1, 2],
        [1, 2, 1]],
      [ [1, 2, 3, 2],
        [4, 2, 1, -1],
        [1, 1, 10, -3]]
    ) === [
      [15, 10, 26, -7],
      [9, 10, 30, -1],
      [10, 7, 15, -3]]
  end

end
