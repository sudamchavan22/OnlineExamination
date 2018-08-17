--alter table tblExamDateTime_Details drop column marks
--alter table tblExamDateTime add marks int
--alter table tblExamDateTime drop column subjects


 --sp_rename 'tblExamDateTime_Details.examidsrno','examid','column'


 -- =============================================
-- Author:		Sudam B. Chavan
-- Create date: 15 Aug 2018
-- Description:	Set or Update Exam DateTime and Subjects
-- =============================================
Alter PROCEDURE Sp_InsertOrUpdateExamTime 
	-- Add the parameters for the stored procedure here
	@examid int=null,
	@date datetime,
	@start_time time,
	@end_time time,
	@createdBy int,
	@marks int
	
AS
BEGIN
DECLARE @tempId int
if @examid is null 
begin
insert into tblExamDateTime(date,start_time,end_time,createdby,createdDate,marks) 
			values(@date,@start_time,@end_time,@createdby,GETDATE(),@marks)
end
end


-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Sudam B. Chavan
-- Create date: 16 Aug 2018
-- Description:	Retrive Exam Details Sp_GetExamDetails 6022
-- =============================================
alter PROCEDURE Sp_GetExamDetails  
@examId int=null
	-- Add the parameters for the stored procedure here
AS
BEGIN
if @examId is null
begin
select
ROW_NUMBER() over(order by date desc) as 'Sr.No',
 te.examid ,date,start_time,end_time,createdby ,
 createdDate,sbid,(select subject_name from tblSubject where sbid=ted.sbid) 'Subject Name',qids,marks 

 from tblExamDateTime te inner join tblExamDateTime_Details ted
on te.examid=ted.examid
where date>=FORMAT(getdate(),'yyyy-MM-dd') and end_time<(SELECT CONVERT (time, SYSDATETIME()))  order by start_time
end
else
begin
select
ROW_NUMBER() over(order by date desc) as 'Sr.No',
 te.examid ,date,start_time,end_time,createdby ,
 createdDate,sbid,(select subject_name from tblSubject where sbid=ted.sbid) 'Subject Name',qids,marks 

 from tblExamDateTime te inner join tblExamDateTime_Details ted
on te.examid=ted.examid
where te.examid=@examId order by start_time
end
end
GO

--exec Sp_InsertOrUpdateExamTime null,'08/19/2018',
--	'12:00 PM','01:00 PM',1,1,'1,2,3',1

SELECT CONVERT (date, SYSDATETIME())  


select * from tblExamDateTime where date=(SELECT CONVERT (date, SYSDATETIME()))   and end_time>(SELECT CONVERT (time, SYSDATETIME())) 
select * from tblExamDateTime_Details

select * from tblExamDateTime where start_time<='11:42 PM' and end_time>='11:42 PM'



select subject_name from tblSubject ts inner join tblExamDateTime_Details
ted on ts.sbid=ted.sbid where examid=6027