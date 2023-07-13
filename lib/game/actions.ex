defmodule ExMon.Game.Actions do
  alias ExMon.Game

  # Função para ver o movimento do player.
  def fetch_move(move) do
    Game.player()
    |> Map.get(:moves)
    |> find_move(move)
  end

  # Função privada para percorrer os movimentos passados do usuário.
  defp find_move(moves, move) do
    Enum.find_value(moves, {:error, move}, fn {key, value} ->
      if value == move, do: {:ok, key}
    end)
  end
end
