defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game

  # Duas constantes
  @move_avg_power 18..25
  @move_rnd_power 10..35

  # Calcula o dano do oponent.
  def attack_opponent(opponent, move) do
    damage =  calculate_power(move)

    opponent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponent_life(opponent)
  end

  # Função privada que calcula o ataque e gera valores aleatórios para o dano.
  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)

  # Função privada para calcular a vida e dano restante do oponent.
  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage

  # Função para atualizar o valor da vida do oponent.
  defp update_opponent_life(life, opponent) do
    opponent
    |> Game.fetch_player()
    |> Map.put(:life, life)
  end
end
