DECLARE @UID varchar(17);	/* UID provided by server
							 * Will come in the form of a MAC address (android) */
DECLARE @C_UID varchar(17);	/* Contacted person UID provided by server
							 * Will come in the form of a MAC address (android) */

INSERT INTO CONTACTED (USER_ID, CONTACT_DT, CONTACT_USER_ID, EXPOSE_NOTIFY)
	VALUES (@UID,GETDATE(),@C_UID, 'False'); 