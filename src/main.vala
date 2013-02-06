using Gtk;

namespace TicTacToe {
    class TicTacToe : Granite.Application {
        private Window window;
        private Box content;
        private Grid container;

        construct {
            program_name = "Tic Tac Toe";
        }

        public override void activate() {
            this.window = new Window();
            this.window.set_application(this);

            this.window.width_request = 320;
            this.window.height_request = 480;
            this.window.window_position = Gtk.WindowPosition.CENTER;

            this.container = new Grid();
            this.container.row_spacing = 5;
            this.container.column_spacing = 5;

            for(int i=0; i<9; i++) {
                Button button = new Button();
                button.label = @"Button $i";
                button.expand = true;
                button.clicked.connect ((source) => {
                    source.sensitive = false;
                });
                this.container.attach(button, i%3, i/3, 1, 1);
            }

            this.content = new Box(Gtk.Orientation.VERTICAL, 0);
            this.content.add(container);
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
