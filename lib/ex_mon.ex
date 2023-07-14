defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  @computer_name "Robotinik"

  # Função para criar o jogador, suas habilidades.
  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  # Função para começar o game do jogador.
  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  # Função para o ver o movimento do jogador.
  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  # Função privada para retornar o erro do movimento do jogador.
  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  # Função para retornar o sucesso do movimento do jogador.
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "Realiza_cura"
      _ -> Actions.attack(move)
    end
  end
end
