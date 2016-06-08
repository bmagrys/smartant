defmodule PerceptronLearningRuleTest do
  use ExUnit.Case, async: true
  doctest PerceptronLearningRule

  test "test learning" do
    IO.puts "\n\n##########################"
    IO.puts "Test 1: \n"

    layer = %SingleLayerPerceptron{ neurons: [%Neuron{ weight: [0, 0], bias: 0, act_fun: :hardlim }] }
    IO.inspect input = [ [[-1.0], [1.0]], [[-1], [-1]], [[0], [0]], [[1], [0]] ]
    expected_result = [[[1]],[[1]],[[0]],[[0]]]
    IO.inspect PerceptronLearningRule.learn({ input, expected_result }, layer)
  end

  test "test learning 2" do
    IO.puts "\n\n##########################"
    IO.puts "Test 2: \n"

    layer = %SingleLayerPerceptron{ neurons: [%Neuron{ weight: [0, 1], bias: 1, act_fun: :hardlim }] }
    IO.inspect input = [ [[1], [0]], [[-1], [2]], [[1], [2]] ]
    expected_result = [[[0]],[[0]],[[1]]]
    IO.inspect PerceptronLearningRule.learn({ input, expected_result }, layer)
  end

  test "test learning 3" do
    IO.puts "\n\n##########################"
    IO.puts "Test 3: \n"

    layer = %SingleLayerPerceptron{ neurons: [%Neuron{ weight: [1, 0], bias: 0.5, act_fun: :hardlim }] }
    IO.inspect input = [ [[-1], [-1]], [[0], [0]], [[-1], [1]] ]
    expected_result = [[[0]],[[0]],[[1]]]
    IO.inspect PerceptronLearningRule.learn({ input, expected_result }, layer)
  end
end
