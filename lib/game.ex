defmodule ExMon.Game do
  use Agent

  # Função para iniciar o jogo computador e player.
  def start(computador, player) do
    initial_value = %{computador: computador, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  # Função para pegar informações estado do jogo.
  def info do
    Agent.get(__MODULE__, & &1)
  end

  # Função para atualizar o estado do nosso jogo sobrescrevendo o estado anterior.
  def update(state) do
    Agent.update(__MODULE__, fn _ -> state end)
  end

  # Função que retorna o próprio jogador para uso.
  def player, do: Map.get(info(), :player)

  # Função para retornar quem vai jogar, maquina ou jogador.
  def turn, do: Map.get(info(), :turn)

  # Função para pegar o valor de computador/player, dependendo do atom que receber.
  def fetch_player(player), do: Map.get(info(), player)
end
