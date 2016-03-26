defmodule SingleLayerPerceptron do

  defstruct [neurons: []]

  @doc """
    Evaluate activation of all layer neurons

    ## Example
    iec> input = 2
    iex> neuron_1 = %Neuron{ input: 2, weight: 2, bias: 2, act_fun: :satlins }
    iex> neuron_2 = %Neuron{ input: 2, weight: 1, bias: -1, act_fun: :satlins }
    iex> slp = %SingleLayerPerceptron{neurons: [neuron_1, neuron_2]}
    iex> SingleLayerPerceptron.eval(slp)
    [[1], [1]]

  """
  @spec eval(struct) :: list
  def eval(layer = %SingleLayerPerceptron{}) do
    eval_neurons(layer.neurons)
  end

  @spec eval_neurons(list(map)) :: list
  defp eval_neurons([ head_neuron | tail ]) do
    { :ok, result } = Neuron.eval(head_neuron)
    [ [ result ] | eval_neurons(tail) ]
  end

  @spec eval_neurons([]) :: []
  defp eval_neurons([ ]), do: []

end
