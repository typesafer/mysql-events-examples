
SET GLOBAL event_scheduler = ON;

/*
Meta

1. One Time - Specific Day and time - future
No preserve
*/
 
DELIMITER $$ 
CREATE EVENT tchad
ON SCHEDULE AT TIMESTAMP '2014-08-29 12:48:00'
DO
BEGIN
insert into le_eventa (two,three) values (rand(),rand());
END $$
DELIMITER ;

 /*
Meta

2. Daily At Specific Hour And Minute
Preserve
*/

DELIMITER $$ 
CREATE EVENT le_drop
ON SCHEDULE
EVERY 1 DAY
STARTS (TIMESTAMP(CURRENT_DATE) + INTERVAL 1 DAY + INTERVAL '12:37' HOUR_MINUTE)
ON COMPLETION PRESERVE
DO
BEGIN
DROP DATABASE IF EXISTS carbo;
END $$
DELIMITER ;

 
  /*
Meta

3. Recurring - Specific Day Of The Week, At Specific Time
Preserve
*/

DELIMITER $$    
CREATE EVENT le_drop_database	
ON SCHEDULE 
EVERY 1 WEEK						
STARTS CURRENT_DATE + INTERVAL 4 - WEEKDAY(CURRENT_DATE) DAY + INTERVAL '10:00' HOUR_MINUTE 
ON COMPLETION PRESERVE
DO
BEGIN
DROP DATABASE IF EXISTS carbo;
END $$
DELIMITER ;
