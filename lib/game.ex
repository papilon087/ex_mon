defmodule ExMon.Game do
  use Agent

  # Função para iniciar o jogo computador e player.
  def start(computador, player) do
    initial_value = %{computador: computador, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  # Função para pegar informações do jogo.
  def info do
    Agent.get(__MODULE__, & &1)
  end

  # Função que retorna o próprio jogador para uso.
  def player, do: Map.get(info(), :player)
end
