defmodule SingleLayerPerceptron do

  defstruct [neurons: [ %Neuron{ }] ]

  @doc """
    Evaluate activation of all layer neurons

    ## Example
    iex> input = 2
    iex> neuron_1 = %Neuron{ weight: 2, bias: 2, act_fun: :satlins }
    iex> neuron_2 = %Neuron{ weight: 1, bias: -1, act_fun: :satlins }
    iex> slp = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    iex> SingleLayerPerceptron.eval(slp, input)
    {:ok, [[1], [1]]}

  """
  @spec eval(struct, list) :: list
  def eval(layer = %SingleLayerPerceptron{ }, input) do
    { :ok, eval_neurons(layer.neurons, input) }
  end

  @spec eval_neurons(list(map), list) :: list
  defp eval_neurons([ head_neuron | tail ], input) do
    { :ok, result } = Neuron.eval(head_neuron, input)
    [ [ result ] | eval_neurons(tail, input) ]
  end

  @spec eval_neurons([], list) :: []
  defp eval_neurons([ ], _input), do: []

end
