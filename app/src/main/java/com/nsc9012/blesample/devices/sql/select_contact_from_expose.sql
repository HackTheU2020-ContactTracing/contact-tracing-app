DECLARE @EXP_ID varchar(17);	/* ID of exposed user
								 * Provided as a MAC address (android) */

SELECT CONTACT_USER_ID FROM CONTACTED CT
	WHERE CT.USER_ID = @EXP_ID
	AND CT.CONTACT_DT > (DATEADD(WEEK, -2, GETDATE()))
	AND CT.EXPOSE_NOTIFY = 'False'
	AND EXISTS(SELECT 'X' FROM EXPOSED EX
		WHERE EX.USER_ID = CT.USER_ID);
