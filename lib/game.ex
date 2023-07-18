defmodule ExMon.Game do
  alias ExMon.Player
  use Agent

  # Função para iniciar o jogo computador e player.
  def start(computer, player) do
    initial_value = %{computer: computer, player: player, turn: :player, status: :started}
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  # Função para pegar informações estado do jogo.
  def info do
    Agent.get(__MODULE__, & &1)
  end

  # Função para atualizar o estado do nosso jogo sobrescrevendo o estado anterior.
  def update(state) do
    Agent.update(__MODULE__, fn _ -> update_game_status(state) end)
  end

  # Função que retorna o próprio jogador para uso.
  def player, do: Map.get(info(), :player)

  # Função para retornar quem vai jogar, maquina ou jogador.
  def turn, do: Map.get(info(), :turn)

  # Função para pegar o valor de computador/player, dependendo do atom que receber.
  def fetch_player(player), do: Map.get(info(), player)

  # Função para atualizar o status do jogo! Jogador, computador e os turnos.
  defp update_game_status(
         %{player: %Player{life: player_life}, computer: %Player{life: computer_life}} = state
       )
       when player_life == 0 or computer_life == 0,
       do: Map.put(state, :status, :game_over)

  defp update_game_status(state) do
    state
    |> Map.put(:status, :continue)
    |> update_turn()
  end

  defp update_turn(%{turn: :player} = state), do: Map.put(state, :turn, :computer)
  defp update_turn(%{turn: :computer} = state), do: Map.put(state, :turn, :player)
end
