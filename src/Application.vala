namespace TicTacToe {
    public class Application : Granite.Application {
        private Gtk.Window window;
        private Gtk.Toolbar toolbar;
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

            Gtk.Box container = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);

            this.toolbar = new Gtk.Toolbar();
            container.add(this.toolbar);

            this.content = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
            this.content.margin = 5;
            this.content.add(board);
            container.add(content);

            this.window.add(container);

            this.window.show_all();
        }
    }
}
