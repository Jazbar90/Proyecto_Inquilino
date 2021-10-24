DROP TABLE IF EXISTS #InquilinoTemp

SELECT
Id_TipoInquilino, Descripcion, Estado INTO #InquilinoTemp
FROM(
VALUES
(1, 'FISICO', ''),
(2,	'JURIDICO', '')
)AS TEMP (Id_TipoInquilino, Descripcion, Estado)

-----ACTUALIZAR DATOS TABLA-----
UPDATE I SET
	I.Descripcion = TM.Descripcion,
	I.Estado = TM.Estado
FROM dbo.TipoInquilino I
INNER JOIN #InquilinoTemp TM
	ON I.Id_TipoInquilino = TM.Id_TipoInquilino

----INSERTAR DATOS TABLA----

SET IDENTITY_INSERT dbo.TipoInquilino ON

INSERT INTO dbo.TipoInquilino (
	Id_TipoInquilino,Descripcion,Estado)
SELECT
	Id_TipoInquilino,Descripcion,Estado 
FROM #InquilinoTemp

EXCEPT
SELECT
Id_TipoInquilino,Descripcion,Estado
FROM dbo.TipoInquilino

SET IDENTITY_INSERT dbo.TipoInquilino OFF

GO