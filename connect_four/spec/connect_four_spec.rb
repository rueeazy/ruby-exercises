require 'connect_four.rb'

describe Board do
    describe "#display_board" do
        it "shows a game board" do 
            expect(STDOUT).to receive(:puts).exactly(14).times
            subject.display_board
        end
    end
end

describe Game do
    describe "#game_start" do
        it "it starts the game" do
            expect(subject).to receive(:play_game)
            subject.game_start
        end
    end

    describe "#play_game" do
        it "receives a column choice from player" do
            expect(subject).to receive(:pick_space).with(instance_of(Player))
            subject.play_game
        end
    end
end
