namespace TicTacToe {
    public class Application : Granite.Application {
        private Gtk.Window window;
        private Gtk.Toolbar toolbar;
        private Gtk.Box content;
        private Board board;

        construct {
            program_name = "Tic Tac Toe";
            exec_name = "tictactoe";
            app_years = "2013";
            app_icon = "application-default-icon";

            about_authors = {"noxan <noxan@byteweaver.net>"};
            about_documenters = {};
            about_artists = {};
            about_comments = "A simple game based on a 3x3 grid for two players.";
        }

        public override void activate() {
            this.window = new Gtk.Window();
            this.window.set_application(this);

            this.window.window_position = Gtk.WindowPosition.CENTER;

            this.board = new Board();

            Gtk.Box container = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);

            this.toolbar = new Gtk.Toolbar();
            Gtk.ToolButton reset = new Gtk.ToolButton(new Gtk.Image.from_icon_name("process-stop", Gtk.IconSize.BUTTON), "Restart game");
            reset.clicked.connect(() => {
                this.board.reset();
            });
            this.toolbar.add(reset);

            var slider = new Gtk.ToolItem ();
            slider.set_expand(true);
            this.toolbar.add(slider);

            var menu = new Gtk.Menu();
            var appmenu = this.create_appmenu (menu);
            this.toolbar.add(appmenu);
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
