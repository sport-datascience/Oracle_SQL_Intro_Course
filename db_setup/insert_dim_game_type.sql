INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('PR', 'Pre-season', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('R', 'Regular season', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('P', 'Playoffs', 'TRUE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('A', 'All-Star game', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('WA', 'All-Star Women game', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('O', 'Olympic game', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('WCOH_EXH', 'World cup of hockey exhibition/preseason games ', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('WCOH_PRELIM', 'World cup of hockey preliminary games ', 'FALSE');

INSERT INTO dim_game_type (game_type_id, description, postseason) 
VALUES ('WCOH_FINAL', 'World cup of hockey semifinals and finals ', 'FALSE');

COMMIT;

