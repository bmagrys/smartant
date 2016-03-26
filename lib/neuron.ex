defmodule Neuron do
  defstruct [
  input: 0,
  weight: 1,
  bias: 0,
  act_fun: :hardlim ]

  import TransferFunctions, only: [eval_function: 1]
  import MatrixHelper, only: [multiply: 2]

  @doc """
    Evaluate neuron activation

    ## Example
      iex> Neuron.eval(%Neuron{ })
      { :ok, 1 }

  """
  @spec eval(map) :: number
  def eval(neuron = %Neuron{}) do
    eval_function(%{act_fun: neuron.act_fun, net_input: eval_net_input(neuron)})
  end

  @spec eval_net_input(map) :: number
  defp eval_net_input(map = %Neuron{weight: w, input: i})
  when is_number(w) and is_number(i)
  do
    (map.input * map.weight) + map.bias
  end

  @spec eval_net_input(map) :: number
  defp eval_net_input(map = %Neuron{weight: w, input: i})
  when is_list(w) and is_list(i)
  do
    [ output ] = MatrixHelper.multiply(map.weight, map.input)
    output + map.bias
  end

end
