namespace TicTacToe {
    public enum Player {
        PLAYER1,
        PLAYER2
    }

    public enum GameEvent {
        DRAW,
        WIN_PLAYER1,
        WIN_PLAYER2
    }

    public class Block : Gtk.Button {
        private Player player { public get; private set; }

        public Block() {
            set_size_request(64, 64);

            expand = true;
        }

        public void mark(Player player) {
            sensitive = false;
            this.player = player;
        }

        public int get_status() {
            if(get_sensitive()) {
                return 0;
            }
            if(player == Player.PLAYER1) {
                return 1;
            }
            return 2;
        }

        public void reset() {
            sensitive = true;
        }

        public override bool draw(Cairo.Context context) {
            if(sensitive) {
                return base.draw(context);
            } else {
                int width = get_allocated_width();
                int height = get_allocated_height();

                if(player == Player.PLAYER1) {
                    context.set_source_rgba(1, 0, 0, 1);
                } else {
                    context.set_source_rgba(1, 1, 0, 1);
                }
                context.arc(width/2, height/2, int.min(width, height) / 2, 0, 2 * Math.PI);
                context.fill();

                return true;
            }
        }
    }

    public class Board : Gtk.Grid {
        public signal void game_event(GameEvent event);

        private Player current_player = Player.PLAYER1;
        private Block[,] blocks;

        public Board() {
            row_spacing = 5;
            column_spacing = 5;

            blocks = new Block[3, 3];

            for(int x=0; x<blocks.length[0]; x++) {
                for(int y=0; y<blocks.length[1]; y++) {
                    blocks[x, y] = new Block();
                    blocks[x, y].clicked.connect ((source) => {
                        ((Block) source).mark(current_player);
                        check_game();
                        change_current_player();
                    });
                    attach(blocks[x, y], x, y, 1, 1);
                }
            }
        }

        public void reset() {
            for(int x=0; x<blocks.length[0]; x++) {
                for(int y=0; y<blocks.length[1]; y++) {
                    blocks[x, y].reset();
                }
            }
        }

        private int get_status(int x, int y) {
            return blocks[x, y].get_status();
        }

        private void check_game() {
            int total_sum = 0;

            for(int i=0; i<3; i++) {
                int sum = get_status(0, i) + get_status(1, i) + get_status(2, i);
                if(sum == 3) {
                    game_event(GameEvent.WIN_PLAYER1);
                } else if(sum == 6) {
                    game_event(GameEvent.WIN_PLAYER2);
                }
                total_sum += sum;
            }

            if(total_sum >= 13) {
                game_event(GameEvent.DRAW);
            }
        }

        private void change_current_player() {
            if(current_player == Player.PLAYER1) {
                current_player = Player.PLAYER2;
            } else {
                current_player = Player.PLAYER1;
            }
        }
    }
}
