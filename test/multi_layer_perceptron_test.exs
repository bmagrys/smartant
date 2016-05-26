defmodule MultiLayerPerceptronTest do
  use ExUnit.Case, async: true
  doctest MultiLayerPerceptron

  test "Multi Layer Perceptron sample structure" do
    input = 0

    neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    slp_1 = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}

    neuron_3 = %Neuron{ weight: [1, -1], bias: 0, act_fun: :purelin }
    slp_2 = %SingleLayerPerceptron{neurons: [neuron_3]}

    mlp = %MultiLayerPerceptron{ layers: [ slp_1, slp_2 ] }

    { :ok, result } = MultiLayerPerceptron.eval(mlp, input)
    assert result === [2]
  end

end
