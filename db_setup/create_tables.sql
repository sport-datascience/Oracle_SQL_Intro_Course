CONNECT sds_learner/sds_learner@10.0.0.69:1521/XEPDB1;

-- Use an anonymous PL/SQL script to
-- drop all tables in the current schema, defined above by the CONNECT statement
-- and suppress any error messages that may displayed if these objects don't exist

BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE DIM_GAME_TYPE';
  EXECUTE IMMEDIATE 'DROP TABLE DIM_PLAYERS';
  EXECUTE IMMEDIATE 'DROP TABLE DIM_SEASON';
  EXECUTE IMMEDIATE 'DROP TABLE DIM_TEAM';
  EXECUTE IMMEDIATE 'DROP TABLE DIM_VENUE';
  EXECUTE IMMEDIATE 'DROP TABLE FACT_GOALIE';
  EXECUTE IMMEDIATE 'DROP TABLE FACT_PLAYER';
  EXECUTE IMMEDIATE 'DROP TABLE FACT_SCHEDULE';
EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE dim_game_type 
( 
  game_type_id 	                VARCHAR2(26)	    NOT NULL,
  description 	                VARCHAR2(256),
  postseason                    VARCHAR2(128),
  CONSTRAINT game_type_pk
    PRIMARY KEY (game_type_id)
);

CREATE TABLE dim_player 
( 
  player_id                           VARCHAR2(7) 	NOT NULL,
  full_name                           VARCHAR2(56),
  first_name                          VARCHAR2(26),
  last_name                           VARCHAR2(26),
  primary_number                      VARCHAR2(2),
  birth_date                          DATE,
  birth_city                          VARCHAR2(56),
  birth_state_province                VARCHAR2(5),
  birth_country                       VARCHAR2(3),
  nationality                         VARCHAR2(3),
  height                              VARCHAR2(6),
  weight                              NUMBER(3),
  active                              VARCHAR2(26),
  rookie                              VARCHAR2(26),
  shoots                              VARCHAR2(2),
  roster_status                       VARCHAR2(1),
  primary_position_code               VARCHAR2(1),
  primary_position_name               VARCHAR2(26),
  primary_position_type               VARCHAR2(26),
  primary_position_abbreviation       VARCHAR2(2),
  current_age                         NUMBER(2),
  alternate_captain                   VARCHAR2(26),
  captain                             VARCHAR2(26),
  current_team_id                     VARCHAR2(2),
  current_team_name                   VARCHAR2(26),
  CONSTRAINT player_pk
    PRIMARY KEY (player_id)
);

CREATE TABLE dim_season 
( 
  season_id                   VARCHAR2(8)     NOT NULL,
  regular_season_start_date   DATE,
  regular_season_end_date     DATE,
  season_end_date             DATE,
  number_of_games             NUMBER(38),
  ties_in_use                 VARCHAR2(26),
  olympics_participation      VARCHAR2(26),
  conferences_in_use          VARCHAR2(26),
  divisions_in_use            VARCHAR2(26),
  wild_card_in_use            VARCHAR2(26),
  CONSTRAINT season_pk
    PRIMARY KEY (season_id)
);

CREATE TABLE dim_team 
( 
  team_id                 VARCHAR2(2)		NOT NULL,
  name                    VARCHAR2(56),
  abbreviation            VARCHAR2(3),
  team_name               VARCHAR2(26),
  location_name           VARCHAR2(26),
  first_year_of_play      NUMBER(4),
  short_name              VARCHAR2(26),
  official_site_url       VARCHAR2(128),
  franchise_id            VARCHAR2(2),
  active                  VARCHAR2(26),
  venue_name              VARCHAR2(26),
  venue_city              VARCHAR2(26),
  venue_id                NUMBER(4),
  venue_time_zone_id      VARCHAR2(26),
  venue_time_zone_offset  NUMBER(38),
  venue_time_zone_tz      VARCHAR2(26),
  division_id             VARCHAR2(2),
  division_name           VARCHAR2(26),
  division_name_short     VARCHAR2(5),
  division_abbreviation   VARCHAR2(1),
  conference_id           VARCHAR2(2),
  conference_name         VARCHAR2(26),
  franchise_franchise_id  VARCHAR2(2),
  franchise_team_name     VARCHAR2(26),
  CONSTRAINT team_pk
    PRIMARY KEY (team_id)
);

CREATE TABLE dim_venue 
( 
  venue_id        VARCHAR2(4)		  NOT NULL,
  venue_name      VARCHAR2(128),
  CONSTRAINT venue_pk
    PRIMARY KEY (venue_id)
);

CREATE TABLE fact_goalie 
( 
  game_id                           VARCHAR2(10)	    NOT NULL,
  player_id                         VARCHAR2(7)       NOT NULL,
  player_name                       VARCHAR2(128),
  primary_position_code             VARCHAR2(1),
  team_id                           VARCHAR2(2),
  time_on_ice                       NUMBER(38, 2),
  assists                           NUMBER(2),
  goals                             NUMBER(2),
  points                            NUMBER(2),
  penalty_minutes                   NUMBER(3),
  shots                             NUMBER(2),
  saves                             NUMBER(3),
  power_play_saves                  NUMBER(3),
  short_handed_saves                NUMBER(3),
  even_saves                        NUMBER(3),
  short_handed_shots_against        NUMBER(3),
  even_shots_against                NUMBER(3),
  power_play_shots_against          NUMBER(3),
  decision                          VARCHAR2(5),
  save_percentage                   NUMBER(5, 2),
  even_strength_save_percentage     NUMBER(5, 2),
  CONSTRAINT fact_goalie_pk
    PRIMARY KEY (game_id, player_id),
  CONSTRAINT fact_goalie_fk_player FOREIGN KEY (player_id)
    REFERENCES sds_learner.dim_player (player_id)
);

CREATE TABLE fact_player 
( 
  GAME_ID                     VARCHAR2(10)    NOT NULL,
  PLAYER_ID                   VARCHAR2(7)     NOT NULL,
  PLAYER_NAME                 VARCHAR2(128),
  PRIMARY_POSITION_CODE       VARCHAR2(1),
  TEAM_ID                     VARCHAR2(2),
  TIME_ON_ICE                 NUMBER(5, 2),
  ASSISTS                     NUMBER(2),
  GOALS                       NUMBER(2),
  SHOTS                       NUMBER(2),
  HITS                        NUMBER(2),
  POWER_PLAY_GOALS            NUMBER(2),
  POWER_PLAY_ASSISTS          NUMBER(2),
  PENALTY_MINUTES             NUMBER(3),
  FACE_OFF_WINS               NUMBER(2),
  FACEOFF_TAKEN               NUMBER(2),
  TAKEAWAYS                   NUMBER(2),
  GIVEAWAYS                   NUMBER(2),
  SHORT_HANDED_GOALS          NUMBER(2),
  SHORT_HANDED_ASSISTS        NUMBER(2),
  BLOCKED                     NUMBER(2),
  PLUS_MINUS                  NUMBER(2),
  EVEN_TIME_ON_ICE            NUMBER(38, 2),
  POWER_PLAY_TIME_ON_ICE      NUMBER(5, 2),
  SHORT_HANDED_TIME_ON_ICE    NUMBER(5, 2),
  FACE_OFF_PCT                NUMBER(3),
  CONSTRAINT fact_player_pk
    PRIMARY KEY (game_id, player_id),
  CONSTRAINT fact_player_fk_player FOREIGN KEY (player_id)
    REFERENCES sds_learner.dim_player (player_id)
);

CREATE TABLE fact_schedule 
( 
  game_date                 DATE,
  total_games               NUMBER(2),
  game_pk                   VARCHAR2(10)    NOT NULL,
  game_type                 VARCHAR2(5),
  season                    VARCHAR2(8),
  game_date_time            DATE,
  game_status               VARCHAR2(26),
  status_start_time_tbd     VARCHAR2(26),
  away_team_id              VARCHAR2(4),
  away_team_name            VARCHAR2(26),
  away_team_score           NUMBER(2),
  away_team_wins            NUMBER(2),
  away_team_losses          NUMBER(2),
  away_team_ot              NUMBER(2),
  home_team_id              VARCHAR2(4),
  home_team_name            VARCHAR2(26),
  home_team_score           NUMBER(2),
  home_team_wins            NUMBER(2),
  home_team_losses          NUMBER(2),
  home_team_ot              NUMBER(2),
  venue_id                  VARCHAR2(4),
  venue_name                VARCHAR2(56),
  CONSTRAINT game_pk
    PRIMARY KEY (game_pk),
  CONSTRAINT fact_schedule_fk_season FOREIGN KEY (season)
    REFERENCES sds_learner.dim_season (season_id)
);
