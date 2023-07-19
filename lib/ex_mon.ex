defmodule ExMon do
  alias ExMon.{Game, Player}
  alias ExMon.Game.{Actions, Status}

  # Variaveis de modulo.
  @computer_name "Robotinik"

  @computer_moves [:move_avg, :move_rnd, :move_heal]

  # Função para criar o jogador, suas habilidades.
  def create_player(name, move_rnd, move_avg, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  # Função para começar o game do jogador.
  def start_game(player) do
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  # Função para o ver o movimento do jogador.
  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  # Função para imprimir o status do jogo.
  defp handle_status(:game_over, _move), do: Status.print_round_message(Game.info())

  # Função para fazer o movimento padrão, como sempre normal.
  defp handle_status(_other, move) do
    move
    |> Actions.fetch_move()
    |> do_move()

    computer_move(Game.info())
  end

  # Função privada para retornar o erro do movimento do jogador.
  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  # Função para retornar o sucesso do movimento do jogador.
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal()
      _ -> Actions.attack(move)
    end

    Status.print_round_message(Game.info())
  end

  # Função para ver o movimento do computador de acordo com os parâmetros.
  defp computer_move(%{turn: :computer, status: :continue}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end

  # Função para devolver error com movimentos errados.
  defp computer_move(_), do: :ok
end
