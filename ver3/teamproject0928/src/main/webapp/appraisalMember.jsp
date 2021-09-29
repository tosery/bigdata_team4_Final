<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm">
		<select name="id" class="tempmemberid">
			<option>abc</option>
			<option>abcd</option>
		</select> 
		<select class="appraisal">

		</select>
		<input type="text" name="temperature">

		
		<button type="submit" id="btn">단호박온도 변경</button>
	</form>

	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	<script src="/resources/js/jquery.serializeObject.js"></script>

	<script>
		var Member = document.querySelector('.tempmemberid');
		Member.onchange = function() {
			var Tempappraisal = document.querySelector('.appraisal');
			var MemOption = Member.options[Member.selectedIndex].innerText;
			var TempappOptions = {
				badTemperature : ['1', '2', '3' ],
			}

			switch (MemOption) {
			case 'abc':
				var TempappOption = TempappOptions.badTemperature;
				break;
			case 'abcd':
				var TempappOption = TempappOptions.badTemperature;
				break;
			}
			Tempappraisal.options.length = 0;
			for (var i = 0; i < TempappOption.length; i++) {
				var option = document.createElement('option');
				option.innerText = TempappOption[i];
				Tempappraisal.append(option);
			}
		}
	</script>
	<script>
		$('form#frm').on(
				'submit',
				function(event) {
					// 폼 태그의 기본동작 막기
					event.preventDefault();

					let obj = $(this).serializeObject();
					console.log(typeof obj); // object
					console.log(obj);

					let strJson = JSON.stringify(obj);
					console.log(typeof strJson); // string
					console.log(strJson);

					let $frm = $('form#frm');

					// ajax 함수 호출
					$.ajax({
						url : '/api/members/' + obj.id + '.json',
						method : 'PUT',
						data : strJson,
						contentType : 'application/json; charset=UTF-8',
						success : function(data) {
							console.log(typeof data); // object
							console.log(data); // {}

							alert('온도정보 업데이트 성공!');

							$frm[0].reset();
						},
						error : function(request, status, error) {
							alert('code: ' + request.status + '\n message: '
									+ request.responseText + '\n error: '
									+ error);
						}
					});
				});
	</script>
</body>

</html>