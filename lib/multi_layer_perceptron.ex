defmodule MultiLayerPerceptron do
  defstruct [
    layers: [
      %SingleLayerPerceptron{ },
      %SingleLayerPerceptron{ }
    ]
  ]

  @doc """
    Evaluate output of multi layer perceptron

    ## Example
    iex> input = 0
    iex> neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    iex> neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    iex> slp_1 = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    iex> neuron_3 = %Neuron{ weight: [1, -1], bias: 0, act_fun: :purelin }
    iex> slp_2 = %SingleLayerPerceptron{neurons: [neuron_3]}
    iex> mlp = %MultiLayerPerceptron{ layers: [ slp_1, slp_2 ] }
    iex> MultiLayerPerceptron.eval(mlp, input)
    { :ok, [2] }
  """
  @spec eval(map, number) :: number
  def eval(mlp = %MultiLayerPerceptron{ }, input) do
    {
      :ok,
      eval_layers(mlp.layers, input)
        |> List.flatten
    }
  end

  @spec eval_layers(list(map), list) :: list
  defp eval_layers([ head_layer | tail ], input) do
    { :ok, result } = SingleLayerPerceptron.eval(head_layer, input)
    eval_layers(tail, result)
  end

  @spec eval_layers([], list) :: []
  defp eval_layers([], result), do: result

end
