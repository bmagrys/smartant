defmodule TransferFunctions do

  @doc """
  Evaluate activation function

  Available functions:
    Hard Limit (hardlim)
    Symmetrical Hard Limit (hardlims)
    Linear (:purelin)
    Saturating Linear (:satlin)
    Symmetric Saturating Linear (:satlins)
    Log-Sigmoid (:logsig)
    Hyperbolic Tangent Sigmoid (:tansig)
    Positive Linear (:poslin)

  ## Example
    iex> TransferFunctions.eval_function(%{ act_fun: :hardlim, net_input: -0.5 })
    { :ok, 0 }

    iex> TransferFunctions.eval_function(%{ act_fun: :unknown_function, net_input: -0.5 })
    { :error, "Cannot recognize received activation function type" }
  """
  @spec eval_function(map) :: number
  def eval_function(map = %{}) do
    case map do
      %{ act_fun: :hardlim }  ->
        { :ok, Map.get(map, :net_input) |> hard_limit() }
      %{ act_fun: :hardlims } ->
        { :ok, Map.get(map, :net_input) |> symmetrical_hard_limit() }
      %{ act_fun: :purelin }  ->
        { :ok, Map.get(map, :net_input) |> linear() }
      %{ act_fun: :satlin }   ->
        { :ok, Map.get(map, :net_input) |> saturating_linear() }
      %{ act_fun: :satlins }  ->
        { :ok, Map.get(map, :net_input) |> symmetric_saturating_linear() }
      %{ act_fun: :logsig }   ->
        { :ok, Map.get(map, :net_input) |> log_sigmoid() }
      %{ act_fun: :tansig }   ->
        { :ok, Map.get(map, :net_input) |> hyperbolic_tangent_sigmoid() }
      %{ act_fun: :poslin }  ->
        { :ok, Map.get(map, :net_input) |> positive_linear() }
      _                       ->
        { :error, "Cannot recognize received activation function type" }
    end

  end

  @spec hard_limit(number) :: non_neg_integer
  defp hard_limit(n)
  when is_number(n)
  do
    cond do
      n < 0   -> 0
      n >= 0  -> 1
    end
  end

  @spec symmetrical_hard_limit(number) :: integer
  defp symmetrical_hard_limit(n)
  when is_number(n)
  do
    cond do
      n < 0   -> -1
      n >= 0  -> 1
    end
  end

  @spec linear(number) :: number
  defp linear(n)
  when is_number(n)
  do
    n
  end

  @spec saturating_linear(number) :: number
  defp saturating_linear(n)
  when is_number(n)
  do
    cond do
      n < 0             -> 0
      n >= 0 and n <= 1 -> n
      n > 0             -> 1
    end
  end

  @spec symmetric_saturating_linear(number) :: number
  defp symmetric_saturating_linear(n)
  when is_number(n)
  do
    cond do
      n < -1              -> -1
      n >= -1 and n <= 1  -> n
      n > 0               -> 1
    end
  end

  @spec log_sigmoid(number) :: number
  defp log_sigmoid(n)
  when is_number(n)
  do
    1 / (1 + :math.exp(-n))
  end

  @spec hyperbolic_tangent_sigmoid(number) :: number
  defp hyperbolic_tangent_sigmoid(n)
  when is_number(n)
  do
    (:math.exp(n) - :math.exp(-n)) / (:math.exp(n) + :math.exp(-n))
  end

  @spec positive_linear(number) :: number
  defp positive_linear(n)
  when is_number(n)
  do
    cond do
      n < 0 -> 0
      n > 0 -> n
    end
  end

end
