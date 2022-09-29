   		//페이징 처리
		let pageForm = $("#pageForm");
		$(".pageChange").on("click", function(e){
			e.preventDefault();
			
			pageForm.find("input[name='pagenum']").val($(this).attr("href"))
			pageForm.submit();
		})
		
		// 강퇴 메세지 삭제
		let BanForm = $("#BanForm");
		$(".BanDelete").on("click", function(e){
			e.preventDefault();
			
			let bannum = $(this).attr('href');
			let json = {"bannum":bannum}
			$.ajax(
					{
						type:"POST",
						url:"/moim/deleteMessage",
						data:JSON.stringify(json),
						contentType: "application/json",
						success:function(result,status,xhr){
							console.log(result);
							if(result == "success"){
								location.reload();
							}
						},
						error:function(xhr,status,e){
							alert("에러 발생");
						}
					}		
				)
		})	