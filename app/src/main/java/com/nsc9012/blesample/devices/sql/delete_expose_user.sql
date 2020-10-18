DECLARE @EXP_ID varchar(17);	/* ID of exposed user
								 * Provided as a MAC address (android) */

DELETE FROM EXPOSED
	WHERE USER_ID = @EXP_ID;	/* TODO: Modify this comment to only mention in-app checks
								 * Add in-app check to secure from injections
								 * Modify table if user input for this query is allowed */