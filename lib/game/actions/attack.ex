defmodule ExMon.Game.Actions.Attack do

  # Duas constantes
  @move_avg_power 18..25
  @move_rnd_power 10..35

  # Calcula o poder de ataque do jogador e máquina.
  def attack_opponent(oponent, move) do
    damage =  calculate_power(move)
  end

  # Função privada que calcula o ataque e gera valores aleatórios para o dano.
  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)
end
