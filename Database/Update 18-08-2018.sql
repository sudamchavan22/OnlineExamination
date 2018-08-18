truncate table tblExamDateTime_Details
alter table tblExamDateTime_Details alter column qids int

sp_rename 'tblExamDateTime_Details.qids','qid','column'



USE [OnlineExaminationDB]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetExamDetails]    Script Date: 8/18/2018 1:42:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sudam B. Chavan
-- Create date: 16 Aug 2018
-- Description:	Retrive Exam Details Sp_GetExamDetails 6022
-- =============================================
ALTER PROCEDURE [dbo].[Sp_GetExamDetails]  
@examId int=null
	-- Add the parameters for the stored procedure here
AS
BEGIN
if @examId is null
begin
select
ROW_NUMBER() over(order by date desc) as 'Sr.No',
 te.examid ,date,start_time,end_time,createdby ,
 createdDate,sbid,(select subject_name from tblSubject where sbid=ted.sbid) 'Subject Name',qid,marks 

 from tblExamDateTime te inner join tblExamDateTime_Details ted
on te.examid=ted.examid
where date>=FORMAT(getdate(),'yyyy-MM-dd') and end_time<(SELECT CONVERT (time, SYSDATETIME()))  order by start_time
end
else
begin
select
ROW_NUMBER() over(order by date desc) as 'Sr.No',
 te.examid ,date,start_time,end_time,createdby ,
 createdDate,sbid,(select subject_name from tblSubject where sbid=ted.sbid) 'Subject Name',qid,marks 

 from tblExamDateTime te inner join tblExamDateTime_Details ted
on te.examid=ted.examid
where te.examid=@examId order by start_time
end
end










-- =============================================
-- Author:		Sudam B. Chavan
-- Create date: 18 Aug 2018
-- Description:	Set Questions for Exam
-- Exec SpWriteExamQuestions  10,20,'20,20,30,30,30,410'
-- =============================================
Alter procedure SpWriteExamQuestions(
@examid int=null,
	@date date,
	@start_time time,
	@end_time time,
	@createdBy int,
	@sbid int,
	@qids varchar(max),
	@marks int,
	@isExamId bit=0
)
as
begin
DECLARE @str VARCHAR(max)
DECLARE @tempId int
DECLARE @len INT, @lastINDEX INT,@currentINDEX INT
SET @str=@qids+','
if @examid is null 
begin
if @isExamId=0
begin 
insert into tblExamDateTime(date,start_time,end_time,createdby,createdDate,marks) 
			values(@date,@start_time,@end_time,@createdby,GETDATE(),@marks)
			set @tempId= @@IDENTITY
			print @tempId
			end
else
begin
select top 1 @tempId=examid from tblExamDateTime where createdDate=convert(date,getdate()) order by examid desc
end
SELECT @len=LEN(@str), @lastINDEX=0,@currentINDEX=0

WHILE @lastINDEX<=@len
BEGIN
SET @currentINDEX=CHARINDEX(',',@str,@lastINDEX)
    IF  @currentINDEX>0
    BEGIN
	insert into tblExamDateTime_Details(examid,sbid,qid) 
		values(@tempId,@sbid,SUBSTRING(@str,@lastINDEX,@currentINDEX-@lastINDEX))
        SET @lastINDEX=@currentINDEX+1
    END
    ELSE
    BEGIN
       insert into tblExamDateTime_Details(examid,sbid,qid) 
		values(@tempId,@sbid,SUBSTRING(@str,@lastINDEX,@currentINDEX-@lastINDEX))
        SET @lastINDEX=@currentINDEX+1
    END

END
end
else
begin
update tblExamDateTime set date=@date,start_time=@start_time,end_time=@end_time,marks=@marks where examid=@examid
--delete from tblExamDateTime_Details where examid=@examid and sbid=@sbid
--SELECT @len=LEN(@str), @lastINDEX=0,@currentINDEX=0
--WHILE @lastINDEX<=@len
--BEGIN
--SET @currentINDEX=CHARINDEX(',',@str,@lastINDEX)
--    IF  @currentINDEX>0
--    BEGIN
--	insert into tblExamDateTime_Details(examid,sbid,qid) 
--		values(@examid,@sbid,SUBSTRING(@str,@lastINDEX,@currentINDEX-@lastINDEX))
--        SET @lastINDEX=@currentINDEX+1
--    END
--    ELSE
--    BEGIN
--       insert into tblExamDateTime_Details(examid,sbid,qid) 
--		values(@examid,@sbid,SUBSTRING(@str,@lastINDEX,@currentINDEX-@lastINDEX))
--        SET @lastINDEX=@currentINDEX+1
--    END

--END
end
end



create procedure SpGetExamQuestions(
@examId int
)
as 
begin
select q_id,question,opt_1,opt_2,opt_3,opt_4,ans,ted.sbid,te.marks,ROW_NUMBER() 
OVER(ORDER BY q_id ASC)AS Q_Number from tblQuestionMaster tqm inner join tblExamDateTime_Details ted
on tqm.q_id=qid inner join  tblExamDateTime te on te.examid=ted.examid where te.examid=@examId
end