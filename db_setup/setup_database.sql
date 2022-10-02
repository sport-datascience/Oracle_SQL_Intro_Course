spool setup_database.log;

prompt>Creating users/schemas
start create_users

prompt>Creating AP tables
start create_tables

prompt>Loading Dim Game Type
start insert_dim_game_type

prompt>Loading Dim Player
start insert_dim_player

prompt>Loading Dim Season
start insert_dim_season

prompt>Loading Dim Team
start insert_dim_team

prompt>Loading Dim Venue
start insert_dim_venue

prompt>Loading Fact Goalie
start insert_fact_goalie

prompt>Loading Fact Player
start insert_fact_player

prompy>Loading Fact Schedule
start insert_fact_schedule

spool off;

exit;