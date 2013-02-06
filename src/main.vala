using Gtk;

namespace TicTacToe {
    class TicTacToe : Granite.Application {
        private Window window;
        private Box content;

        construct {
            program_name = "Tic Tac Toe";
        }

        public override void activate() {
            this.window = new Window();
            this.window.set_application(this);

            this.window.width_request = 320;
            this.window.height_request = 480;

            this.content = new Box(Gtk.Orientation.VERTICAL, 0);
            this.window.add(content);

            this.window.show_all();
        }
    }
}

public static int main(string[] args) {
    Gtk.init(ref args);

    var tictactoe = new TicTacToe.TicTacToe();

    return tictactoe.run(args);
}
