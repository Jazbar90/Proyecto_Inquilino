CREATE PROCEDURE [dbo].[InquilinoActualizar]
	@Id_TipoInquilino int,
	@Descripcion VARCHAR(250),
	@Estado BIT

AS BEGIN
SET NOCOUNT ON

	BEGIN TRANSACTION TRANS

		BEGIN TRY

		UPDATE dbo.TipoInquilino SET
			Descripcion = @Descripcion,
			Estado = @Estado
		WHERE
			Id_TipoInquilino = @Id_TipoInquilino
		
	COMMIT TRANSACTION TRANS
	SELECT 0 AS CodeError, '' AS MsgError

	END TRY

	BEGIN CATCH

	SELECT
		ERROR_NUMBER() AS CodeError,
		ERROR_MESSAGE() AS MsgError

	ROLLBACK TRANSACTION TRANS

	END CATCH

END