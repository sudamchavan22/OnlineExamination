alter table tblStudents add classId int

alter table tblStudents add rollNo int,userId varchar(max),password varchar(max),regDate date,status bit


USE [OnlineExaminationDB]
GO
/****** Object:  StoredProcedure [dbo].[SP_INS_STUD_REG_MASTER]    Script Date: 8/19/2018 11:15:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SpWriteStudentDetails]
@name varchar(max),
@classId int,
@rollNo int, 
@userId varchar(max),
@passward varchar(max),
@regDate date,
@status bit
AS
BEGIN
begin
if not exists(select name from tblStudents where userId=@userId)
BEGIN
insert into tblStudents(name,classId,rollNo,userId,password,regDate,status) 
	values(@name,@classId,@rollNo,@userId,@passward,@regDate,@status)
	print 'Inserted'
END
else 
BEGIN
update tblStudents set name=@name,classId=@classId,rollNo=@rollNo,password=@passward,regDate=@regDate,status=@status
		where userId=@userId
		print 'Updated'
END
END
 