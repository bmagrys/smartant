defmodule PerceptronLearningRule do

  @doc """

  """
  @spec learn(map, struct) :: map
  def learn(learning_set, layer) do
    { p, t } = learning_set
    layer = %SingleLayerPerceptron{ neurons: gen_neurons(t, :hardlim) }
    IO.inspect "Untrained perceptron:"
    IO.puts " "
    IO.inspect layer
    IO.puts " "
    IO.inspect "Learning:"
    IO.puts " "
    layer = learning(p, t, layer, MatrixHelper.length(p))
    IO.puts " "
    IO.inspect "Trained perceptron:"
    IO.puts " "
    IO.inspect layer
    IO.puts " "
  end

  @spec learning(list, list, struct, number, number) :: struct
  defp learning([ p_h | p_t ] = p, [ t_h | t_t ] = t, layer, count \\ 40, count_ok \\ 0, length_in) do
    {:ok, a} = SingleLayerPerceptron.eval(layer, p_h)
    if (count > 0 && count_ok < length_in) do
      if a == t_h do
        count_ok = count_ok + 1
        learning( p_t ++ [p_h], t_t ++ [t_h], layer, count - 1, count_ok, length_in)
      else
        e = MatrixHelper.subtraction(t_h, a)
        [ neuron ] = layer.neurons
        w = neuron.weight |> MatrixHelper.wrap_elements();
        [[e]] = e
        w1 = MatrixHelper.addition(
          MatrixHelper.wrap_elements(neuron.weight), MatrixHelper.scalar_array_prod(e, p_h)
        )
        neuron = %{neuron | weight: List.flatten w1}
        neuron = Map.put(neuron, :bias, neuron.bias + e)
        layer = Map.put(%SingleLayerPerceptron{}, :neurons, [neuron])

        IO.inspect ("e = " <> to_string e)
        IO.inspect neuron

        count_ok = 0
        learning(p, t, layer, count - 1, count_ok, length_in)
     end
    else
      layer
    end
  end

  @spec gen_neurons(list(list), :atom) :: list(struct)
  defp gen_neurons([ [h_h | h_t] = h | t ], act_fun ) do
    [
      %Neuron{
          weight: [((:random.uniform * 2) - 1), ((:random.uniform * 2) - 1)],
          bias: ((:random.uniform * 2) - 1),
          act_fun: act_fun }
      | gen_neurons(h_t, act_fun)
    ]
  end

  @spec gen_neurons([], :atom) :: []
  defp gen_neurons([], _act_fun ), do: []

end
