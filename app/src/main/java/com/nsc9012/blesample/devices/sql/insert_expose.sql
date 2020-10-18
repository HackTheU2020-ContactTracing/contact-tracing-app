DECLARE @UID varchar(17);	/* UID provided by server
							 * Will come in the form of a MAC address (android) */

INSERT INTO EXPOSED (USER_ID, EXPOSE_DT)
	VALUES (@UID, GETDATE()); 