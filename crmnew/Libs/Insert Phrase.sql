select PhraseValue,LanguageCode,PhraseName,PhraseType
from dbo.crm_PhraseLanguages l,dbo.crm_Phrases p
where l.PhraseID=p.ID and lower(PhraseValue) like '%warning%'

DECLARE @count INT, @name NVARCHAR(MAX), @type NVARCHAR(MAX), @valueEng NVARCHAR(MAX), @valueNor NVARCHAR(MAX), @phraseId INT
SET @name ='Global.Warning'
SET @type ='Global'
SET @valueEng = 'Warning' -- ENG
SET @valueNor ='Advarsel' -- NOR

SET @count = (SELECT COUNT(*) FROM crm_Phrases WHERE PhraseName = @name)
--SELECT @count
IF(@count <1)
	BEGIN
	Insert into crm_Phrases (PhraseName, PhraseType) values (@name, @type)
	SET @phraseId = (SELECT ID FROM crm_Phrases WHERE PhraseName = @name)

	INSERT INTO crm_PhraseLanguages(PhraseValue, LanguageCode, PhraseID) VALUES (@valueEng, N'en-US', @phraseId)
	INSERT INTO crm_PhraseLanguages(PhraseValue, LanguageCode, PhraseID) VALUES (@valueNor, N'nb-NO', @phraseId)
END
