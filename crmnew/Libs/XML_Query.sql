SELECT '<?xml version="1.0" encoding="UTF-8"?>'+(SELECT CAST((select Phrase.ID,Phrase.PhraseName,Lang.PhraseValue,Lang.LanguageCode
from dbo.crm_Phrases Phrase,dbo.crm_PhraseLanguages Lang
where Phrase.ID=Lang.PhraseID
FOR XML AUTO,TYPE, ELEMENTS ,ROOT('Phrases')) AS VARCHAR(MAX)) AS XmlData)