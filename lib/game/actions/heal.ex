defmodule ExMon.Game.Actions.Heal do
  # Importando a váriaveis no arquivos criado.
  alias ExMon.Game
  alias ExMon.Game.Status

  @heal_power 18..25

  # Função para curar.
  def heal_life(player) do
    player
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life()
    |> set_life(player)
  end

  # Função para calcular a cura total.
  defp calculate_total_life(life), do: Enum.random(@heal_power) + life

  # Função para setar a cura quando for maior que o valor.
  defp set_life(life, player) when life > 100, do: update_player_life(player, 100)

  # Função para setar e dar o upgrade no jogador.
  defp set_life(life, player), do: update_player_life(player, life)

  # Função para fazer o update quando chamar a função cura.
  defp update_player_life(player, life) do
    player
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(player, life)
  end

  # Função para ver quanto cada jogador curou quando utilizou o movimento.
  defp update_game(player_data, player, life) do
    Game.info()
    |> Map.put(player, player_data)
    |> Game.update()

    Status.print_move_message(player, :heal, life)
  end
end
