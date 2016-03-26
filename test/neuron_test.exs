defmodule NeuronTest do
  use ExUnit.Case, async: true
  doctest Neuron

  import Neuron

  test "neuron structure" do
    n = %Neuron{}
    assert n.weight === 1
  end

  test "evaluating transfer function with scalars" do
    { :ok , result } = eval(%Neuron{ })
    assert result === 1

    { :ok , result } = eval(
      %Neuron{
        input: 2.0,
        weight: 2.3,
        bias: -3,
        act_fun: :hardlim })
    assert result === 1
  end

  test "evaluating transfer function with multiple inputs and weights" do
    { :ok , result } = eval(%Neuron{ })
    assert result === 1

    { :ok , result } = eval(
      %Neuron{
        input: [[2.0], [3.0]],
        weight: [2.3, -1],
        bias: -3,
        act_fun: :hardlim })
    assert result === 0
  end
end
