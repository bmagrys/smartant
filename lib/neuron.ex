defmodule Neuron do
  defstruct [
  weight: 1,
  bias: 0,
  act_fun: :hardlim ]

  import TransferFunctions, only: [eval_function: 1]

  @doc """
    Evaluate neuron activation

    ## Example
      iex> Neuron.eval(%Neuron{ }, 0)
      { :ok, 1 }

  """
  @spec eval(map, number) :: number
  def eval(neuron = %Neuron{}, input) do
    eval_function(
      %{
        act_fun: neuron.act_fun,
        net_input: eval_net_input(neuron, input)
      }
    )
  end

  @spec eval_net_input(map, number) :: number
  defp eval_net_input(map = %Neuron{weight: w}, input)
  when is_number(w) and is_number(input)
  do
    (input * map.weight) + map.bias
  end

  @spec eval_net_input(map, [list]) :: number
  defp eval_net_input(map = %Neuron{weight: w}, input)
  when is_list(w) and is_list(input)
  do
    [ output ] = MatrixHelper.multiply(map.weight, input)
    output + map.bias
  end

end
