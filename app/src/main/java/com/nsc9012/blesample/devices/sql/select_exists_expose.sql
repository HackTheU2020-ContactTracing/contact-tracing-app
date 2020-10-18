DECLARE @C_UID varchar(17);	/* Contacted person UID provided by server
							 * Will come in the form of a MAC address (android) */

SELECT 'Y' FROM EXPOSED
	WHERE USER_ID = @C_UID
	/* TODO: Delete this comment
	 * If we add delete for exposed where expose_dt > 2 weeks, 
	 * delete the date check below
	 * otherwise keep and add update for new expose_dt */
	 AND EXPOSE_DT > (DATEADD(WEEK, -2, GETDATE()));