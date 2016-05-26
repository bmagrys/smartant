defmodule SingleLayerPerceptronTest do
  use ExUnit.Case, async: true
  doctest SingleLayerPerceptron

  import SingleLayerPerceptron

  test "evaluating all of neurons one-by-one in perceptron" do
    input = -2

    # For now it is the main test for 2-layer perceptron with 2 and 1 neurons.
    # It will be absolutely moved or changed in the future.

    # First pseudo layer
    neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    slp = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    { :ok, output } = eval(slp, input)

    # Second pseudo layer
    neuron_3 = %Neuron{ weight: [1, -1], bias: 0, act_fun: :purelin }
    { :ok, result } = Neuron.eval(neuron_3, output)
    assert result === 0

    input = -1.5

    # First pseudo layer
    neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    slp = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    { :ok, output } = eval(slp, input)

    # Second pseudo layer
    neuron_3 = %Neuron{ weight: [1, -1], bias: 0, act_fun: :purelin }
    { :ok, result } = Neuron.eval(neuron_3, output)
    assert result === 0.0

    input = -1

    # First pseudo layer
    neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    slp = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    { :ok, output } = eval(slp, input)
    
    # Second pseudo layer
    neuron_3 = %Neuron{ weight: [1, -1], bias: 0, act_fun: :purelin }
    { :ok, result } = Neuron.eval(neuron_3, output)
    assert result === 1

    input = 0

    # First pseudo layer
    neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    slp = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    { :ok, output } = eval(slp, input)

    # Second pseudo layer
    neuron_3 = %Neuron{ weight: [1, -1], bias: 0, act_fun: :purelin }
    { :ok, result } = Neuron.eval(neuron_3, output)
    assert result === 2
  end

end
