defmodule TransferFunctionsTest do
  use ExUnit.Case, async: true
  doctest TransferFunctions

  import TransferFunctions

  test "is output of Hard Limit transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :hardlim, net_input: 1.23 })
    assert result === 1

    { :ok, result } = eval_function(%{ act_fun: :hardlim, net_input: -0.24 })
    assert result === 0
  end

  test "is output of Symmetrical Hard Limit transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :hardlims, net_input: 1.23 })
    assert result === 1

    { :ok, result } = eval_function(%{ act_fun: :hardlims, net_input: -0.5 })
    assert result === -1
  end

  test "is output of Linear transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :purelin, net_input: -123.39 })
    assert result === -123.39
  end

  test "is output of Saturating Linear transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :satlin, net_input: -12 })
    assert result === 0

    { :ok, result } = eval_function(%{ act_fun: :satlin, net_input: 0.53 })
    assert result === 0.53

    { :ok, result } = eval_function(%{ act_fun: :satlin, net_input: 15 })
    assert result === 1
  end


  test "is output of Symmetric Saturating
        Linear transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :satlins, net_input: -12 })
    assert result === -1

    { :ok, result } = eval_function(%{ act_fun: :satlins, net_input: -0.53 })
    assert result === -0.53

    { :ok, result } = eval_function(%{ act_fun: :satlins, net_input: 15 })
    assert result === 1
  end

  test "is output of Log-Sigmoid transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :logsig, net_input: -3 })
    assert Float.round(result, 3) === 0.047

    { :ok, result } = eval_function(%{ act_fun: :logsig, net_input: -4 })
    assert Float.round(result, 3) === 0.018

    { :ok, result } = eval_function(%{ act_fun: :logsig, net_input: 2 })
    assert Float.round(result, 3) === 0.881

    { :ok, result } = eval_function(%{ act_fun: :logsig, net_input: 0 })
    assert Float.round(result, 3) === 0.5

    { :ok, result } = eval_function(%{ act_fun: :logsig, net_input: 1.5 })
    assert Float.round(result, 3) === 0.818
  end

  test "is output of Hyperbolic Tangent Sigmoid
        transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :tansig, net_input: -3 })
    assert Float.round(result, 4) === -0.9951

    { :ok, result } = eval_function(%{ act_fun: :tansig, net_input: -4 })
    assert Float.round(result, 4) === -0.9993

    { :ok, result } = eval_function(%{ act_fun: :tansig, net_input: 2 })
    assert Float.round(result, 4) === 0.9640

    { :ok, result } = eval_function(%{ act_fun: :tansig, net_input: 0 })
    assert Float.round(result, 4) === 0.0

    { :ok, result } = eval_function(%{ act_fun: :tansig, net_input: 1.5 })
    assert Float.round(result, 4) === 0.9051
  end

  test "is output of Positive Linear transfer function valid" do
    { :ok, result } = eval_function(%{ act_fun: :poslin, net_input: -123.39 })
    assert result === 0

    { :ok, result } = eval_function(%{ act_fun: :poslin, net_input: 123.39 })
    assert result === 123.39
  end
end
