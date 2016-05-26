defmodule PerceptronLearningRuleTest do
  use ExUnit.Case, async: true
  doctest PerceptronLearningRule

  test "test learning" do
    input = [ -1, -0.9, -0.8, -0.7, -0.6, -0.5 ]
    expected_result = [-.9602, -.5770, -.0729, .3771, .6405, .6600]
    r = 1
    s1 = 1
    q = 6
    w1 = [ 0, 1, 3, 2, 1, 1 ]
    b1 = [ 2, 1, -3, 2, 1, 0 ]
    


  end

end
