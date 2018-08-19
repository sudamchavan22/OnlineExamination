$(function () {
    $("#lstClass").html('');
    debugger
    function registerFunctions() {



    }
    $('[id$=btnSet]').click(function () {
        debugger;
        $("#lstClass").html('');
        $("#divAddSubjects").append(" ");
        $.ajax({
            type: "POST",
            url: "clientService.asmx/getClassList",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (result) {
                debugger;

                var s = result.d.length;
                var da = result.d;
                $.each(da, function (index, data) {
                    $("#lstClass").append($("<option>").val(data.classId).text(data.className));
                })

            },
            error: function () { alert('failed..') }
        });

        $.ajax({
            type: "POST",
            url: "clientService.asmx/getSubjectList",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:1,
            success: function (result) {
                debugger;

                var s = result.d.length;
                var da = result.d;
                $.each(da, function (index, data) {
                    $("#lstSubjects").append($("<option>").val(data.subjectId).text(data.subjectName));
                })

            },
            error: function () { alert('failed..') }
        });

    })







    $("#lnkbtn").click(function () {
        debugger;
    
    })

    $("#lstClass").change(function () {
        debugger
        var subjectId=this.selectedOptions[0].value;
        $.ajax({
            type: "POST",
            url: "clientService.asmx/GetSubjectList",
            contentType: "application/json; charset=utf-8",
            data:{subjectId:1},
            dataType: "json",
            success: function (result) {
                debugger;

                var s = result.d.length;
                var da = result.d;
                $.each(da, function (index, data) {
                    $("#lstSubjects").append($("<option>").val(data.subjectId).text(data.subjectName));
                })

            },
            error: function () { alert('failed..') }
        });


    })



})