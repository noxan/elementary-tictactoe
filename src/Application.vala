namespace TicTacToe {
    public class Application : Granite.Application {
        private Gtk.Window window;
        private Gtk.Box content;
        private Board board;

        construct {
            program_name = "Tic Tac Toe";
        }

        public override void activate() {
            this.window = new Gtk.Window();
            this.window.set_application(this);

            this.window.window_position = Gtk.WindowPosition.CENTER;

            this.board = new Board();

            this.content = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            this.content.margin = 5;
            this.content.add(board);
            this.window.add(content);

            this.window.show_all();
        }
    }
}
