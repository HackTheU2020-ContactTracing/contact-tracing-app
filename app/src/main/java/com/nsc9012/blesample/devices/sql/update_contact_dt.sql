DECLARE @UID varchar(17);	/* UID provided by server
							 * Will come in the form of a MAC address (android) */
DECLARE @C_UID varchar(17);	/* Contacted person UID provided by server
							 * Will come in the form of a MAC address (android) */
UPDATE CONTACTED
SET CONTACT_DT = GETDATE()
	WHERE USER_ID = @UID
	AND CONTACT_USER_ID = @C_UID;