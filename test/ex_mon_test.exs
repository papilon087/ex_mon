defmodule ExMonTest do
  use ExUnit.Case

  # Modulo para capturar as mensagem que vem de IO para verificar.
  import ExUnit.CaptureIO

  # Importando o Player
  alias ExMon.Player

  # Teste para a função de criação de player.
  describe "create_player/4" do
    test "returns a player" do
      expected_response =
        %Player{
          life: 100,
          moves: %{move_avg: :soco, move_heal: :cura, move_rnd: :chute},
          name: "Gustavo"
        }

      assert expected_response == ExMon.create_player("Gustavo", :chute, :soco, :cura)
    end
  end

  # Teste para quando iniciar o jogo.
  describe "start_game/1" do
    test "when the game is started, returns a message" do
      player = Player.build("Gustavo", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          assert ExMon.start_game(player) == :ok
        end)

      assert messages =~ "The game is started!"
    end
  end

  # Teste para ver se o movimento é valido ou não.
  describe "make_move/1" do
    setup do
      player = Player.build("Gustavo", :chute, :soco, :cura)

      capture_io(fn ->
        ExMon.start_game(player)
      end)

      :ok
    end

    # Teste para movimento valido.
    test "when the move is valid, do the move and the computer makes a moves" do
      player = Player.build("Gustavo", :chute, :soco, :cura)

      messages =
        capture_io(fn ->
          ExMon.make_move(:chute)
        end)

      assert messages =~ "The Player attacked the computer"
      assert messages =~ "It's computer turn"
      assert messages =~ "It's player turn"
      assert messages =~ "status: :continue"
    end

    # Teste para falha.
    test "when the move is invalid, returns an error message" do
      messages =
        capture_io(fn ->
          ExMon.make_move(:wrong)
        end)

      assert messages =~ "Invalid move: wrong"
    end
  end
end
